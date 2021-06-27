const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

(async () => {
    try{
        let connection = await sql.connect(config);
        const coral_result = await connection.request().query(`SELECT typeName, description,images FROM Corals`);
        //console.log(coral_result.recordset);

        router.get('/CoralsInfo', function (req, res)
        {
            res.render('CoralsInfo', 
            {CoralList: coral_result.recordset});
        });
    }
    catch(err)
    {
        console.log(err);
    }
})()

module.exports = router;