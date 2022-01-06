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
  const order = {
    User_id: parseInt(req.params.userId),
    Price: req.body.Price,
    Created_at : new Date()
  }
  const [orderResult] = await mysql.query('INSERT INTO `e-shop`.Order SET ?', [order])
  
  const orderId = orderResult.insertId

  req.body.products.map(async (product) => {
      await mysql.query('INSERT INTO Order_has_Product set ?', [{ ...product, Order_id: orderId }])
    })

  const [results] = await mysql.query('SELECT p.id, p.Name, p.Price, p.Description, OhP.Quantity FROM Order_has_Product OhP  JOIN Product p ON OhP.Order_id = ? and OhP.Product_id = p.id', [orderId])
  
  order.id = orderId
  order.products = [...results]

  res.status(200).json(order)
})

module.exports = router;
