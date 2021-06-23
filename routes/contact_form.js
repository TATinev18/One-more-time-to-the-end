const express = require('express');
let router = express.Router();

router.use(express.json());

router.get('/contact', function (req, res) {
    res.render('contactForm');
    
});

router.post('/contact', function (req, res){
    console.log(req.body);
});

module.exports = router;