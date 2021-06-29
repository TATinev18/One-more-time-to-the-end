const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// parse application/json
router.use(bodyParser.json());

// parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/login', function (req, res)
{
    res.render('login_admin');
});

router.post('/login', async function(req, res, next) {
    try {
        // Put data into the Sql server
        const pool = await sql.connect   (config);
        const AdminUsername = req.body.username;
        const AdminPass = req.body.password
        
        const result = await pool.request()
        .input("username", sql.NVarChar, req.body.username)
        .query(`
            SELECT password FROM Admin WHERE username = @username
        `)
        
        if(result.recordset[0].password == req.body.password)
        {
            req.session.isAdmin = true;
        } else {

            req.session.isAdmin = false;
        }  
        
    } catch (err) {
        console.log(err);
    }

    res.redirect("/users");
});

module.exports = router;