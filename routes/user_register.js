const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();


router.get('/register', function (req, res)
{
    res.render('Register_User');
});

router.post('/register', async function(req, res, next) {
    try {

        // Put data into the Sql server
        const pool = await sql.connect(config);
        const result = await pool.request()
            .input("first_name", sql.VarChar, req.body.first_name)
            .input("last_name", sql.VarChar, req.body.last_name)
            .input("username", sql.NVarChar, req.body.username)
            .input("email", sql.NVarChar, req.body.email)
            .input("password", sql.VarChar, req.body.password)
            .input("age", sql.TinyInt, req.body.age)
            .query(`
                INSERT INTO Users (username, first_name, last_name,age, email, password)
                VALUES (@username @first_name, @last_name, @age,  @email, @password)
            `)
        console.log(result)

    } catch (err) {
        console.log(err.message)
        return displayError(res, "Error!");
        return;
    }

    res.redirect("/register");
});

module.exports = router;