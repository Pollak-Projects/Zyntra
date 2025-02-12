// routes/categoriesRoutes.js
const express = require('express');
const router = express.Router();
const categoriesController = require('../controllers/categoriesController');

// Kategóriák lekérése
router.get('/', categoriesController.getCategories);

module.exports = router;
