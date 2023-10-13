const empM = require('../models/employee.model');
const accM = require('../models/account.model');
const cryptoJS = require('crypto-js');
const hashLength = 64;
const moment = require('moment');


exports.getView = async (req, res, next) => {

    // const page = req.query.page || 1;

    // const limit = 9;
    // const offset = (page - 1) * limit;

    // const numberEmp = await empM.countEmp();
    // const PageNumber = Math.ceil(numberEmp / limit);

    // const pageNumberList = [];
    // for (var i = 1; i <= PageNumber; i++) {
    //     pageNumberList.push({
    //         value: i,
    //         currentPage: +page === i
    //     })
    // }

    const list = await empM.getAll();
    list.forEach(element => {
        element.DateOfBirth = moment(element.DateOfBirth).format('DD-MM-YYYY')
    });
    res.render('viewTest/employee', {
        list: list,
        empty: list.length === 0,
       
        layout: 'ContainerEmployee.hbs'
    });
}


exports.getAdd = async (req, res) => {
    res.render('viewTest/addEmployee', {
        layout: 'ContainerAddEmployee.hbs'
    });
}

exports.postAdd = async (req, res) => {
    
    const un = req.body.Username;
    const pw = req.body.Password;

    const salt = Date.now().toString(16);//dob.toString(16);
    const pwS = pw + salt;
    const pwH = cryptoJS.SHA3(pwS, { outputLength: hashLength * 4 }).toString(cryptoJS.enc.Hex);

    
    var permission;
    const emp = req.body;
    if(emp.Type === "Quản lý"){
        permission = 1;
    }
    else{
        permission = 2;
    }
    const user = {
        Username: un,
        Password: pwH + salt,
        Permission: permission
    }

    const idAcc = await accM.add(user);
    await empM.add(emp, idAcc);

    res.redirect('/manager/staff');
    //res.render('viewbook/add');
}

// // ham kiem tra nhan vien va tai khoan da ton tai chua
// exports.isAvailable =  async function (req, res) {
//     const emp = req.query.emp;
//     const checkEmp = emp.split("-");
//     const acc = await accM.findByUsername(checkEmp[0]);
//     const sdt = await empM.getPhone(checkEmp[1]);
//     if (acc === null && sdt === null) {

//       return res.json(true);
//     }
  
//     res.json(false);
// };

exports.getEdit = async (req, res) => {
    const list = await empM.getAll();
    //const id = req.query.idEmployee;
    // const emp = await empM.getEmpById(id);
    list.forEach(element => {
        element.DateOfBirth = moment(element.DateOfBirth).format('DD-MM-YYYY')
    });
    res.render('viewTest/editEmployee', {
        // emp :emp,
        list: list,
        //layout: 'ContainerEmployee.hbs'
        layout: 'ContainerEditEmployee.hbs'
    })
}

exports.postEdit = async (req, res, next) => {
    const emp = req.body;

    emp.DateOfBirth = moment(emp.DateOfBirth, 'DD-MM-YYYY').format('YYYY-MM-DD');
    console.log(emp);
    await empM.update(emp);
    // const url = req.headers.referer;
    res.redirect('/manager/staff/edit');

}
