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

        // express experiments

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
            const users = [
                {username: result.recordset[0].username, email: result.recordset[0].email},
                {username: result.recordset[1].username, email: result.recordset[1].email},
            ]
            const username = result.recordset[0].username;
            const email = result.recordset[0].email;
            res.render('showUsers', {
                userList : users
                // UserName: username,
                // Email: email,
            });
        });

        app.get('*', function(req, res)
        {
            res.send('Error: Page not found');
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