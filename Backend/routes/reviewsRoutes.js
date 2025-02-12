// routes/reviewRoutes.js
const express = require('express');
const router = express.Router();
const reviewsController = require('../controllers/reviewsController');  // Hivatkozás a controllerre

// Vélemények lekérése
router.get('/reviews', reviewsController.getReviews);  // Hivatkozás a controller függvényre

module.exports = router;
