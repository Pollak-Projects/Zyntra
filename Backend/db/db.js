// db.js

const mysql = require('mysql2');

// MySQL kapcsolat beállítása
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',    // vagy a saját adatbázis felhasználóneved
    password: '',    // a saját adatbázis jelszavad
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
