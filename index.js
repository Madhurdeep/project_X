const express = require('express');

const pingRouter = require('./routes/ping');

const PORT = process.env.PORT || 3000;

const app = express();
app.use(express.json());

app.use('/ping', pingRouter);

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});