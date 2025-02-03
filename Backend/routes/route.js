const express = require('express');
const { getAllErtekeles } = require('../controllers/controller');
const { createErtekeles } = require('../controllers/controller');
const { deleteErtekeles } = require('../controllers/controller');

const router = express.Router();
// Végpontok létrehozása
router.get("/ertekeles", getAllErtekeles); // Összes értékelés lekérdezése
router.post("/ertekeles", createErtekeles); // Új értékelés létrehozása
router.delete("/ertekeles/:id", deleteErtekeles); // Értékelés törlése
module.exports = router;