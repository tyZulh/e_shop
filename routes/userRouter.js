const router = require('express').Router()
const mysql = require('../db');

router.post('/', async (req, res) => {
  try {
    const [result] = await mysql.query('INSERT INTO User SET ?', [req.body])
    const user = {...req.body, id: result.insertId}
    res.status(201).json(user)
  } catch(err){
    console.log(err);
    res.status(500).json(err.message)
  }
})

router.post('/:userId/orders', async (req, res) => {
  console.log(req.params);
  const order = {
    User_id: parseInt(req.params.userId),
    Price: req.body.Price,
    Created_at : new Date()
  }
  const [orderResult] = await mysql.query('INSERT INTO `e-shop`.Order SET ?', [order])
  const orderId = orderResult.insertId
  const products = req.body.products.map(async (product) => {
      await mysql.query('INSERT INTO Order_has_Product set ?', [{ ...product, Order_id: orderId }])
    })
    console.log(products);
  const [results] = await mysql.query(
    'SELECT OhP.Order_id, OhP.Product_id, OhP.Quantity  FROM `e-shop`.Order JOIN Order_has_Product as OhP ON OhP.Order_id = ?', [orderId,])

  res.status(200).json(results)
})

module.exports = router;
