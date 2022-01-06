const router = require('express').Router()
const mysql = require('../db');

router.get('/', async (req, res) => {
  try {
    const [products] = await mysql.query('SELECT * FROM Product') 
    res.status(200).json(products)
  } catch (err) {
    res.status(500).json(err.message)
  }
})

router.get('/:id', async (req, res) => {
  console.log(req.params.id);
  try {
    const [product] = await mysql.query('SELECT * FROM Product WHERE id = ?', [req.params.id])
    res.status(200).json(product)
  } catch (err) {
    res.status(500).json(err.message)
  }
})

module.exports = router;
