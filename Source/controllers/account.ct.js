const cryptoJS = require('crypto-js');
const accountM = require('../models/account.model.js');
const hashLength = 64;

exports.getLogin = (req, res, next) => {
    if (req.session.auth === true) {
        return res.redirect('/')
    }

    res.render('viewAccount/login', {
        layout: 'ContainerLogin.hbs'
    });
}

exports.postLogin = async (req, res, next) => {

    const user = await accountM.findByUsername(req.body.Username);
    if (user === null) {
        return res.render('viewAccount/login', {
            errMessage: "Tên tài khoản hoặc mật khẩu sai.",
            layout: 'ContainerLogin.hbs'
        });
    }

    const pw = req.body.Password;
    const salt = user.Password.slice(hashLength);
    const pwS = pw + salt;
    const pwH = cryptoJS.SHA3(pwS, { outputLength: hashLength * 4 }).toString(cryptoJS.enc.Hex);
    if ((pwH + salt) !== user.Password) {
        return res.render('viewAccount/login', {
            errMessage: "Tên tài khoản hoặc mật khẩu sai.",
            layout: 'ContainerLogin.hbs'
        });
    }

    req.session.auth = true;
    req.session.user = user;
    if (req.session.user.Permission === 1) {
        req.session.permission = 'quanly';
    } else {
        req.session.permission = 'nhanvien';
    }
    res.redirect('/');
}

// exports.getRegister = (req, res, next) => {
//     res.render('viewAccount/register');
// }

// exports.postRegister = async (req, res, next) => {
//     const un = req.body.Username;
//     const pw = req.body.Password;

//     const salt = Date.now().toString(16);//dob.toString(16);
//     const pwS = pw + salt;
//     const pwH = cryptoJS.SHA3(pwS, { outputLength: hashLength * 4 }).toString(cryptoJS.enc.Hex);

//     const user = {
//         Username: un,
//         Password: pwH + salt,
//         FullName: req.body.FullName,
//         Email: req.body.Email,
//         f_DOB: req.body.dob,
//         f_Permission: 1
//     }

//     await accountM.add(user);

//     req.session.auth = true;
//     req.session.user = user;
//     res.redirect('/categories');
// }

exports.postLogout = async (req, res, next) => {
    req.session.auth = false;
    req.session.user = null;

    res.redirect('/');
}

exports.isAvailable = async (req, res) => {
    const username = req.query.user;
    const user = await accountM.findByUsername(username);
    if (user === null) {
        return res.json(false);
    }
    res.json(true);
}


exports.getChangePw = (req, res, next) => {
    return res.render('viewAccount/changePW', {
        layout: 'containerChangePW.hbs'
    });
}

exports.postChangePw = async (req, res) => {

    const user = await accountM.findByUsername(req.session.user.Username);

    // if (user === null) {
    //     return res.render('viewAccount/login', {
    //         errMessage: "mật khẩu sai.",
    //     });
    // }

    const PasswordOld = req.body.PasswordOld;
    const salt = user.Password.slice(hashLength);
    const pwS = PasswordOld + salt;
    const pwH = cryptoJS.SHA3(pwS, { outputLength: hashLength * 4 }).toString(cryptoJS.enc.Hex);

    var errMessage = "";
    if ((pwH + salt) !== user.Password) {
        errMessage = "Mật khẩu cũ sai.";
        return res.render('viewAccount/changePW', {
            errMessage: errMessage,
            layout: 'containerChangePW.hbs'
        });
    }

    const pwN = req.body.PasswordNew;

    const saltN = Date.now().toString(16);//dob.toString(16);
    const pwNS = pwN + saltN;
    const pwNH = cryptoJS.SHA3(pwNS, { outputLength: hashLength * 4 }).toString(cryptoJS.enc.Hex);
    const password = pwNH + saltN;

    const username = req.session.user.Username;
    await accountM.update(username, password);

    res.redirect('/');
}

exports.getResetPw = (req, res, next) => {
    res.render('viewAccount/resetPW', {
        layout: 'containerResetPW.hbs'
    });
}

exports.postResetPw = async (req, res) => {
    //const user = await accountM.findByUsername(req.body.Username);
    const pwN = req.body.PasswordNew;
    const saltN = Date.now().toString(16);//dob.toString(16);
    const pwNS = pwN + saltN;
    const pwNH = cryptoJS.SHA3(pwNS, { outputLength: hashLength * 4 }).toString(cryptoJS.enc.Hex);
    const password = pwNH + saltN;

    const username = req.body.Username;
    await accountM.update(username, password);

    res.redirect('/');
}