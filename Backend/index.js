const express = require("express");
const router = require('./routes/route');

const app = express();
require('dotenv').config();

app.use(express.json());
app.use("/api", router);

require('dotenv').config();
const port = process.env.PORT || 6600;

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})