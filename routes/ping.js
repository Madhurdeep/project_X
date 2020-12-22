const express = require('express');

const pingRouter = express.Router();

pingRouter.get('/', (req, res) => {
    res.send({
        status: `ACTIVE`,
        message: `Hi there!`
    });
});

module.exports = pingRouter;