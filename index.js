require("dotenv").config();

const express = require("express");
const cors = require("cors");

const userRouter = require("./routes/userRouter");
const productRouter = require("./routes/productRouter");
const orderRouter = require("./routes/orderRouter");

const PORT = process.env.PORT;
const app = express();

app.use(cors("*"));
app.use(express.json());

app.use("/users", userRouter);
app.use("/products", productRouter);
app.use("/orders", orderRouter);

app.listen(PORT, () => {
  console.log(`Server up & running on : ${PORT}`);
});
