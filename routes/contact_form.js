const express = require('express');
let router = express.Router();

router.get('/contact', function (req, res) {
    res.render('contactForm');
});

module.exports = router;