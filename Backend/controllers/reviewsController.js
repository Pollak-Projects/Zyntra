const db = require('../db');  


// Vélemények lekérése
exports.getReviews = (req, res) => {
    db.query('SELECT * FROM reviews ORDER BY created_at DESC', (err, results) => {
        if (err) {
            console.error('Hiba a vélemények lekérésekor:', err);
            return res.status(500).send('Hiba történt');
        }
        res.json(results);
    });
};

// Vélemény mentése
exports.saveReview = (req, res) => {
    const { username, avatar_color, content, image_url } = req.body;
    const query = 'INSERT INTO reviews (username, avatar_color, content, image_url) VALUES (?, ?, ?, ?)';

    db.query(query, [username, avatar_color, content, image_url], (err, result) => {
        if (err) {
            console.error('Hiba a vélemény mentésekor:', err);
            return res.status(500).send('Hiba történt');
        }
        res.status(201).send('Vélemény sikeresen mentve');
    });
};
