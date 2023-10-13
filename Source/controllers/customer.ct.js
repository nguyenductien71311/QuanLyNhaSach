const cusM = require('../models/customer.model');
const moment = require('moment');
const receiptM = require('../models/receipt.model');
exports.getView = async (req, res, next) => {
    // const page = req.query.page || 1;

    // const limit = 20;
    // const offset = (page - 1) * limit;

    // const numberCus = await cusM.countCus();
    // const PageNumber = Math.ceil(numberCus / limit);

    // const pageNumberList = [];
    // for (var i = 1; i <= PageNumber; i++) {
    //     pageNumberList.push({
    //         value: i,
    //         currentPage: +page === i
    //     })
    // }

    const list = await cusM.getAll();
    list.forEach(element => {
        element.DateOfBirth = moment(element.DateOfBirth).format('DD-MM-YYYY')
    });

    if (req.session.user.Permission === 1) {
        return res.render('viewCustomer/home', {
            list: list,
            empty: list.length === 0,
        });
    }
    else if (req.session.user.Permission === 2) {
        return res.render('viewEmployee/customer', {
            list: list,
            empty: list.length === 0,
            layout: 'ContainerCustomer.hbs'
        });
    }
    // điều kiện trả về màn hỉnh của ql hoặc nv
}

// exports.checkExist = async (req, res) => {
//     // tên và sdt tách ra
//     const FullName = '';
//     const PhoneNumber = '';
//     const Customer = cusM.getCusByNameAndPhone(FullName, PhoneNumber);
//     if (Customer === null) {
//         return res.json(true);
//     }
//     return res.json(false);
// }

exports.search = async (req, res) => {

    const keySearch = req.body.search;
    const list = await cusM.search(keySearch);

    res.render('viewEmployee/customer', {
        list: list,
        empty: list.length === 0,
        layout: 'ContainerCustomer.hbs'
    })
}


exports.getAdd = async (req, res) => {
    res.render('viewEmployee/addCustomer',{
        layout: 'ContainerAddCustomer.hbs'
    });
}

exports.postAdd = async (req, res) => {
    const cus = req.body;
    // const idCus = cusM.getId(cus);
    // if(idCus == null)
    // {
    //     return res.render('/viewCustomer/add',{
    //         cus,
    //         message: "Khách hàng đã tồn tại trong danh sách thanh viên"
    //     })
    // }
    cus.DeptMoney = 0;
    console.log(cus);
    await cusM.add(cus);

    res.render('viewEmployee/addCustomer',{
        layout: 'ContainerAddCustomer.hbs'
    });
}

exports.isAvailable = async (req, res) => {
    let cus = req.query.phone;
    cus = cus.split("|");
    const name = cus[0];
    const phone = cus[1];
    const user = await cusM.getCusByNameAndPhone(name, phone);

    var DeptMoney = -1;
    if (user !== null) {
        DeptMoney = user.DeptMoney;
    }
    return res.json(DeptMoney);
}

exports.getEdit = async (req, res) => {
    
    // const id = req.query.idCustomer;
    // const cus = await cusM.getCusById(id);
    // const page = req.query.page || 1;

    // const limit = 20;
    // const offset = (page - 1) * limit;

    // const numberCus = await cusM.countCus();
    // const PageNumber = Math.ceil(numberCus / limit);

    // const pageNumberList = [];
    // for (var i = 1; i <= PageNumber; i++) {
    //     pageNumberList.push({
    //         value: i,
    //         currentPage: +page === i
    //     })
    // }

    const list = await cusM.getAll();
    list.forEach(element => {
        element.DateOfBirth = moment(element.DateOfBirth).format('DD-MM-YYYY')
    });

    res.render('viewEmployee/editCustomer', {
        // cus : cus,
        list : list,
        layout: 'ContainerEditCustomer.hbs'
    })
}

exports.postEdit = async (req, res, next) => {
    const cus = req.body;
    console.log(cus);

    console.log(moment(cus.DateOfBirth, "MM-DD-YYYY"));
    cus.DateOfBirth =  moment(cus.DateOfBirth, 'DD-MM-YYYY').format('YYYY-MM-DD');
    await cusM.update(cus);
    // if (req.session.user.Permission === 1){
    //     return res.redirect('/manager/home');
    // }
    // else if (req.session.user.Permission === 2){
    //     return res.redirect('/staff/home');
    // }
    // const url = req.headers.referer;
    return res.redirect('/staff/customer/edit');
}


exports.history = async (req, res) => {

    // const idCus = req.query.id || 1;
    // const history = receiptM.getById(idCus);
    // const listReceipt = await cusM.getAdd(idCus);
    // const n = listReceipt.length;
    // for (var i = 0; i < n; i++) {
    //     const DateCreate = moment(listReceipt[i].DateCreate, 'YYYY-MM-DD').format('DD/MM/YYYY');
    //     listReceipt[i].DateCreate = DateCreate;
    // }

    return res.render('viewEmployee/hisPurcharse', {
        // history: history,
        layout: 'ContainerHisPurcharse.hbs'
    });
    // else if (req.session.user.Permission === 2){
    //     return res.render('viewCustomer/history', {
    //         listReceipt: listReceipt,
    //         empty: listReceipt.length===0,
    //     });
    // }
}