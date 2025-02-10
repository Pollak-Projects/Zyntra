const express = require('express');
const bodyParser = require('body-parser');
const reviewsRoutes = require('./routes/reviewsRoutes');
const app = express();
const express = require('express');
const path = require('path');

// Statikus fájlok kiszolgálása a /public mappából
app.use(express.static(path.join(__dirname, 'public')));


// Middlewares
app.use(bodyParser.json());

// Vélemények API regisztrálása
app.use('/api', reviewsRoutes);

const PORT = 6630;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
