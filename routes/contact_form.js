const { request } = require('express');
const express = require('express');
const nodemailer = require("nodemailer");

let router = express.Router();

router.use(express.json());

router.get('/contact', function (req, res) {
    res.render('contactForm');
    
});

router.post('/contact', function (req, res){

    let formData = req.body;
    console.log(formData);

    const transporter = nodemailer.createTransport({
        service: 'gmail',
        port: 465,
        host: 'smtp.gmail.com',
        secure: true,
        auth: {
            user: 'georgikal4ev@gmail.com',
            pass: 'pass'
        }
    })

    const mailOptions = {
        from: req.body.email,
        to: 'georgikal4ev@gmail.com',
        subject: `Message from ${req.body.email}: ${req.body.subject}`,
        text: req.body.message
    }

    transporter.sendMail(mailOptions, (error, info) =>{
        if(error) {
            console.log(error);
            res.send('error');
        }
        else {
            console.log('Email sent: ' + info.response);
            res.send('success');
        }
    })
});

module.exports = router;