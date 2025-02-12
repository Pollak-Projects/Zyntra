// controllers/reviewController.js
const db = require('../db/db');  // Hivatkozás az adatbázis kapcsolatra

// Vélemények lekérése
exports.getReviews = (req, res) => {
    const query = 'SELECT * FROM reviews';  // SQL lekérdezés a véleményekhez

    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching reviews:', err);
            return res.status(500).json({ error: 'Error fetching reviews' });
        }
        res.json(results);  // A válasz JSON formátumban
    });
};
