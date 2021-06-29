const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

(async () => {
    try{
        let connection = await sql.connect(config);
        const users_result = await connection.request().query(`SELECT * FROM Users`);

        
        router.get('/users', function (req, res)
        {
            if (req.session.isAdmin == true) {
                res.render('showUsers', 
                {userList: users_result.recordset});
            } else {
                res.render('error_page');
            }
        });
    }
    catch(err)
    {
        console.log(err);
    }
})()

module.exports = router;