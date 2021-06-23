const sql = require('mssql/msnodesqlv8');
const express = require('express');
const path = require('path');
const app = express();
let user_registration_router = require('./public/js/user_register');

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

        const coral_result = await connection.request().query(`SELECT typeName, description FROM Corals`);
        console.log(coral_result.recordset);

        // express

        app.get('/', function(req, res)
        {
            res.render('index');
        });

        app.get('/CoralAdoption', function(req, res)
        {
            res.render('CoralAdoption');
        });

        app.get('/HelpCorals', function(req, res)
        {
            res.render('HelpCorals');
        });

        app.get('/ImportanceOfCorals', function(req, res)
        {
            res.render('ImportanceOfCorals');
        });

        app.get('/game', function(req, res)
        {
            res.render('gamePage');
        });

        //show all users from the database
        app.get('/users', function(req, res)
        {
            res.render('showUsers',
                { userList: result.recordset }
            );
        });

        //show all corals from the database
        app.get('/CoralsInfo', function(req, res) {
            res.render('CoralsInfo', 
              {CoralList: coral_result.recordset}
            );
        });

        app.get('/register', user_registration_router);

        // catch 404 and forward to error handler
        app.use('*', function(req, res, next) {
            next(createError(404));
        });

        // error handler
        app.use(function(err, req, res, next) {
            // set locals, only providing error in development
            res.locals.message = err.message;
            res.locals.error = req.app.get('env') === 'development' ? err : {};
        
            // render the error page
            res.status(err.status || 500);
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