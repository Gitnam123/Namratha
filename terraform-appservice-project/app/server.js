const express = require("express");
const appInsights = require("applicationinsights");

appInsights.setup().start();

const { sql, getPool } = require("./src/db");

const app = express();

app.use(express.json());

const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hello from Azure App Service!",
    status: "Running"
  });
});

app.get("/api/products", async (req, res) => {
  try {
    const pool = await getPool();

    const result = await pool
      .request()
      .query(
        "SELECT id, name, price FROM products ORDER BY id"
      );

    res.json(result.recordset);
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({
      error: "Failed to fetch products"
    });
  }
});

app.post("/api/products", async (req, res) => {
  try {
    const { name, price } = req.body;

    if (!name || price === undefined) {
      return res.status(400).json({
        error: "name and price are required"
      });
    }

    const pool = await getPool();

    const result = await pool
      .request()
      .input("name", sql.NVarChar, name)
      .input("price", sql.Decimal(18, 2), price)
      .query(
        `INSERT INTO products (name, price)
         OUTPUT INSERTED.id, INSERTED.name, INSERTED.price
         VALUES (@name, @price)`
      );

    res.status(201).json(result.recordset[0]);
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({
      error: "Failed to insert product"
    });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});