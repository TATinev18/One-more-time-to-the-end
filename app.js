const sql = require('mssql/msnodesqlv8');
const express = require('express');
const path = require('path');
const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'))

const {config} = require('./config/database_config');

(async () => {
    try{
        console.log('Trying to connect');
        let connection = await sql.connect(config);
        console.log('Connected');

        const result = await connection.request().query(`SELECT * FROM Users`);
        console.log(result.recordset);

        // express

        app.get('/', function(req, res)
        {
            res.render('index');
        });

        app.get('/game', function(req, res)
        {
            res.render('gamePage');
        });

        app.get('/users', function(req, res)
        {
            res.render('showUsers',
                { userList: result.recordset }
            );
        });

        app.get('*', function(req, res)
        {
            res.render('error_page');
        });

        app.listen('5500', function(req, res) {
            console.log(' Website');
        });
        //
    }
    catch(err)
    {
        console.log(err);
    }
})()