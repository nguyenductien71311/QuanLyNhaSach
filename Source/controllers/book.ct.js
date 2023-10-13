const bookM = require('../models/book.model.js');
const reguM = require('../models/regulation.model');
const moment = require('moment');
// exports.getHome = async (req, res, next) => {

//     const page = req.query.page || 1;

//     const limit = 20;
//     const offset = (page - 1) * limit;

//     const numberBook = await bookM.countBook();
//     const PageNumber = Math.ceil(numberBook / limit);

//     const pageNumberList = [];
//     for (var i = 1; i <= PageNumber; i++) {
//         pageNumberList.push({
//             value: i,
//             currentPage: +page === i
//         })
//     }

//     const listbook = await bookM.findPage(offset, limit);

//     if (req.session.user.Permission === 1) {
//         return res.render('viewTest/home', {
//             books: listbook,
//             empty: listbook.length === 0,
//             pageNumberList,
//             PageNumber
//         });

//     }
// }

// exports.search = async (req, res) => {
//     const keySearch = req.body.search;


//     const listBook = await bookM.search(keySearch);


//     res.render('viewBook/home', {
//         listBook: listBook,
//         empty: listBook.length === 0,
//     })
// }

// ham kiem tra xem sách nhập vào có đáp ứng điều kiện số lượng
exports.check = async (req, res) => {
    let infoBook = req.query.book;
    infoBook = infoBook.split("|");
    const BookName = infoBook[0];
    const Author = infoBook[1];

    const Book = await bookM.getBookByNameAndAuthor(BookName, Author);
    var Quantity = -1;
    if (Book !== null) {
        Quantity = Book.Quantity;
    }
    return res.json(Quantity);
}


exports.getViewAddNew = async (req, res) => {
    //const listbook = await bookM.getAll();
    const listRule = await reguM.getAll();
    const n = listRule.length;
    var minAdd = -1;
    check = false;
    for (var i = 0; i < n; i++) {
        if(listRule[i].Status === 'Đang sử dụng' && listRule[i].Detail === 'Số lượng nhập tối thiểu'){
            minAdd = listRule[i].Value;
            check = true;
            break;
        }
    }
    return res.render('viewTest/addNew', {
        minAdd, check,
        layout: 'ContainerAddNew.hbs'
    });
}

exports.postAddNew = async (req, res) => {
    const DayCreate = moment().format('YYYY-MM-DD');

    const idImport_History = await bookM.addHistory(DayCreate);

    
    const listBook =req.body.array;
    listBook.forEach( async (book)=>{
        const idBook = await bookM.add(book);
        await bookM.adddetail(idBook.idBook, idImport_History, book.Quantity);
    })

    //res.redirect('/manager/home');
    res.json(true);
    //res.render('viewbook/add');
}

exports.getViewAddExist = async (req, res) => {
    const listRule = await reguM.getAll();
    const n = listRule.length;
    var minAdd = -1;
    var minInventory = -1;
    check1 = false;
    check2 = false;
    for (var i = 0; i < n; i++) {
        if(listRule[i].Status === 'Đang sử dụng'){
            if(listRule[i].Detail === 'Số lượng nhập tối thiểu'){

                minAdd = listRule[i].Value;
                check1 = true;
            }
            else if(listRule[i].Detail === 'Số lượng tồn tối thiệu trước khi nhập'){
                minInventory = listRule[i].Value;
                check2 = true;
            }
        }
    }

    res.render('viewTest/addExist', {
        check1, minAdd,
        check2, minInventory,
        layout: 'ContainerAddExist.hbs'
    });
}


exports.postAddExist = async (req, res) => {

    // // const image
    // const book = 
    // {BookName: bookName, Author: author, Topic: topic, Quantity: quantity};
    
    
    const DayCreate = moment().format('YYYY-MM-DD');
    const idImport_History = await bookM.addHistory(DayCreate);
    
    const listBook = req.body.array;//mảng sách nhận từ người dùng
    listBook.forEach( async (book) =>{
        const Quantity = await bookM.getQuantity(book);
        const QuantityAfter = Quantity + book.Quantity;
        const idBook = await bookM.addBookExist(book, QuantityAfter);
        await bookM.adddetail(idBook.idBook, idImport_History, book.Quantity);

    })

    res.json(true);
    //res.render('viewbook/add');
}

exports.getEdit = async (req, res) => {
    // const id = req.query.idBook;
    // const book = await bookM.getBookById(id);
    const listbook = await bookM.getAll();
    res.render('viewTest/edit', {
        listbook:listbook,
        layout: 'ContainerEdit.hbs'
    })
}

exports.postEdit = async (req, res, next) => {
    const book = req.body;
    await bookM.update(book);
    res.redirect('/manager/book/edit');
}

// // hàm kiểm tra số lượng nhập và tồn kho của sách nhập

