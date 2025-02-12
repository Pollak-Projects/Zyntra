const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();
const port = 6630;

// Middleware
app.use(express.json());


// Csatlakozás a MySQL adatbázishoz
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // Cseréld le a saját felhasználónevedre
  password: '', // Cseréld le a saját jelszavadra
  database: 'zyntra'
});

// Kapcsolódás az adatbázishoz
db.connect((err) => {
  if (err) throw err;
  console.log('Connected to the database');
});

// Statikus fájlok kiszolgálása
app.use(express.static(path.join(__dirname, 'public')));

// API végpontok

// Kategóriák lekérése
app.get('/api/categories', (req, res) => {
  const sql = 'SELECT * FROM categories';
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results); // Visszaküldjük a kategóriákat JSON formátumban
  });
});

// Vélemények lekérése
app.get('/api/reviews', (req, res) => {
  const sql = 'SELECT * FROM reviews';
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results); // Visszaküldjük a véleményeket JSON formátumban
  });
});

// Alapértelmezett útvonal (index.html kiszolgálása)
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Szerver indítása
const PORT = process.env.PORT || 6630;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});