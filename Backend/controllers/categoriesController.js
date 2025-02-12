const db = require('../db/db'); // A db kapcsolódást kell beállítani

exports.getCategories = async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM categories');
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).send('Hiba történt a kategóriák lekérésekor');
  }
};
