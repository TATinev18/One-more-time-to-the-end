const sql = require('mssql/msnodesqlv8');
const express = require('express');
const path = require('path');
const PORT = process.env.PORT || 5500;
const app = express();
let session = require('express-session')

let user_registration_router = require('./routes/user_register');
let contact_form_router = require('./routes/contact_form');
let coral_info_router = require('./routes/coral_info');
let users_list_router = require('./routes/users_list');
let login_admin_router = require('./routes/login_admin');


app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.json());

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))

//Contact us using nodemailer
app.use('/', contact_form_router);

//Register an user
app.use('/', user_registration_router);

//Show all corals from the database
app.use('/', coral_info_router);

//Show all users from the database
app.use('/', users_list_router);

//Login admin
app.use('/', login_admin_router);

const {config} = require('./config/database_config');

(async () => {
    try{
        console.log('Trying to connect');
        let connection = await sql.connect(config);
        console.log('Connected');

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

        app.get('/CoralOrgs', function(req, res)
        {
            res.render('CoralOrgs');
        });

        app.get('/IoT-for-corals', function(req, res)
        {
            res.render('IoT-for-corals');
        });

        app.get('/TechCorals', function(req, res)
        {
            res.render('TechCorals');
        });

        app.get('/game', function(req, res)
        {
            res.render('gamePage');
        });

        // Catch 404 and forward to error handler
        app.use('*', function(req, res, next) {
            next(createError(404));
        });

        // Error handler
        app.use(function(err, req, res, next) {
            // Set locals, only providing error in development
            res.locals.message = err.message;
            res.locals.error = req.app.get('env') === 'development' ? err : {};
        
            // Render the error page
            res.status(err.status || 500);
            res.render('error_page');
        });

        app.listen(PORT, function(req, res) {
            console.log(`Server running on port ${PORT}`);
        });
    }
    catch(err)
    {
        console.log(err);
    }
})()