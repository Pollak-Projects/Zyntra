const mysql = require('mysql');


const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',   
    password: '',    
    database: 'zyntra'
});

connection.connect((err) => {
    if (err) {
        console.error('Database connection error: ', err);
        return;
    }
    console.log('Connected to MySQL database');
});

module.exports = connection;
