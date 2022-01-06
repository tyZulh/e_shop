const router = require('express').Router()
const mysql = require('../db');

router.post('/', (req, res) => {
  try {
    const [result] = mysql.query('INSERT INTO Order SET = ?', [order])
  } catch (err) {
    res.status(500).json(err.message)
  }
})

module.exports = router;