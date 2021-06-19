const sql = require('mssql/msnodesqlv8');
const {config} = require('./config/database_config');

(async () => {
    try{
        console.log('Trying to connect');
        let connection = await sql.connect(config);

        const result = await connection.request().query(`SELECT * FROM Users`);
        console.log(result.recordset);
    }
    catch(err)
    {
        console.log(err);
    }
})()