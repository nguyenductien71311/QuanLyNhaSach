const bookM = require('../models/book.model.js');

exports.getHome = async (req, res, next) => {

    // const page = req.query.page || 1;

    // const limit = 20;
    // const offset = (page - 1) * limit;

    // const numberBook = await bookM.countBook();
    // const PageNumber = Math.ceil(numberBook/limit);

    // const pageNumberList = [];
    // for(var i = 1; i<= PageNumber ; i++){
    //     pageNumberList.push({
    //         value: i,
    //         currentPage: +page === i 
    //     })
    // }
    
    // const listbook = await bookM.findPage(offset, limit);

    const listbook = await bookM.getAll();

    //trả màn hình quản lý
    if (req.session.user.Permission === 1){
        return res.render('viewTest/search', {
            books: listbook,
            empty: listbook.length===0,
           
            layout: 'ContainerSearch.hbs'
        });
    }

    //trả màn hình nhân viên
    else if (req.session.user.Permission === 2){
        return res.render('viewEmployee/search', {
            books: listbook,
            empty: listbook.length===0,
            
            layout: 'ContainerSearchEmployee.hbs'
        });
    }
}



exports.search = async (req, res) =>{
    const keySearch = req.body.search;
    
    const listBook = await bookM.search(keySearch);

    res.render('viewTest/search',{
        listBook: listBook,
        empty: listBook.length===0,
        layout: 'ContainerSearch.hbs'
    })
}
