require('dotenv').config();
const express = require('express');
const db = require('./db_config');
const app = express();
const host = process.env.HOST || 'localhost';
const port = process.env.PORT || 3500;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('مرحبا بك في برنامج إدارة المخزون!');
});

app.listen(port, host, () => {
  console.log(`http://${host}:${port}`);
});
