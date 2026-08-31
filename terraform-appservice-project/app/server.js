const express = require("express");
const { sql, getPool } = require("./src/db");

const app = express();

app.use(express.json());


// ======================================================
// HOME PAGE - COLORFUL PRODUCT APPLICATION
// ======================================================

app.get("/", (req, res) => {
  const html = `
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Product Manager</title>

  <style>

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: Arial, Helvetica, sans-serif;
      min-height: 100vh;

      background: linear-gradient(
        135deg,
        #667eea 0%,
        #764ba2 50%,
        #f093fb 100%
      );

      padding: 40px 20px;
    }

    .container {
      max-width: 1000px;
      margin: auto;
    }

    /* HEADER */

    .header {
      text-align: center;
      color: white;
      margin-bottom: 30px;
    }

    .header h1 {
      font-size: 42px;
      margin-bottom: 10px;
    }

    .header p {
      font-size: 17px;
      opacity: 0.9;
    }

    /* CARD */

    .card {
      background: white;
      border-radius: 20px;
      padding: 30px;
      margin-bottom: 25px;

      box-shadow:
        0 20px 50px rgba(0, 0, 0, 0.18);
    }

    .card h2 {
      color: #333;
      margin-bottom: 20px;
    }

    /* FORM */

    .form {
      display: grid;
      grid-template-columns: 1fr 1fr auto;
      gap: 15px;
      align-items: end;
    }

    .field {
      display: flex;
      flex-direction: column;
    }

    .field label {
      color: #444;
      font-weight: bold;
      margin-bottom: 8px;
    }

    .field input {
      padding: 14px;

      border: 2px solid #ddd;
      border-radius: 10px;

      font-size: 16px;
      outline: none;
    }

    .field input:focus {
      border-color: #667eea;

      box-shadow:
        0 0 0 3px rgba(102, 126, 234, 0.15);
    }

    /* BUTTON */

    button {
      border: none;

      padding: 14px 22px;

      border-radius: 10px;

      background: linear-gradient(
        135deg,
        #667eea,
        #764ba2
      );

      color: white;

      font-size: 16px;
      font-weight: bold;

      cursor: pointer;

      transition: 0.2s;
    }

    button:hover {
      transform: translateY(-2px);

      box-shadow:
        0 8px 20px rgba(102, 126, 234, 0.3);
    }

    button:disabled {
      opacity: 0.6;
      cursor: not-allowed;
      transform: none;
    }

    /* MESSAGE */

    #message {
      display: none;

      margin-top: 20px;

      padding: 12px;

      border-radius: 10px;

      text-align: center;

      font-weight: bold;
    }

    .success {
      display: block !important;

      background: #dcfce7;
      color: #166534;
    }

    .error {
      display: block !important;

      background: #fee2e2;
      color: #991b1b;
    }

    /* PRODUCTS */

    .products {
      display: grid;

      grid-template-columns:
        repeat(3, 1fr);

      gap: 20px;
    }

    .product {
      background: linear-gradient(
        135deg,
        #f8fafc,
        #eef2ff
      );

      border: 1px solid #e5e7eb;

      border-radius: 16px;

      padding: 22px;

      transition: 0.2s;
    }

    .product:hover {
      transform: translateY(-5px);

      box-shadow:
        0 10px 25px rgba(0, 0, 0, 0.1);
    }

    .product-icon {
      font-size: 36px;
      margin-bottom: 12px;
    }

    .product-id {
      color: #888;
      font-size: 13px;
      margin-bottom: 6px;
    }

    .product-name {
      color: #333;
      font-size: 21px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .product-price {
      color: #667eea;
      font-size: 20px;
      font-weight: bold;
    }

    .loading {
      text-align: center;
      color: #777;
      padding: 20px;
    }

    .empty {
      text-align: center;
      color: #777;
      padding: 30px;
    }

    /* STATUS */

    .status {
      text-align: center;
      color: white;
      margin-top: 20px;
      font-size: 14px;
    }

    /* MOBILE */

    @media (max-width: 768px) {

      .form {
        grid-template-columns: 1fr;
      }

      .products {
        grid-template-columns: 1fr;
      }

      .header h1 {
        font-size: 30px;
      }

    }

  </style>

</head>


<body>

  <div class="container">

    <!-- HEADER -->

    <div class="header">

      <h1>🛍️ Product Manager</h1>

      <p>
        Node.js • Azure App Service • Azure SQL
      </p>

    </div>


    <!-- ADD PRODUCT -->

    <div class="card">

      <h2>➕ Add New Product</h2>

      <form id="productForm">

        <div class="form">

          <div class="field">

            <label for="name">
              Product Name
            </label>

            <input
              id="name"
              type="text"
              placeholder="Enter product name"
              required
            >

          </div>


          <div class="field">

            <label for="price">
              Price
            </label>

            <input
              id="price"
              type="number"
              min="0"
              placeholder="Enter price"
              required
            >

          </div>


          <button
            id="saveButton"
            type="submit"
          >
            💾 Save Product
          </button>

        </div>

      </form>


      <div id="message"></div>

    </div>


    <!-- PRODUCTS -->

    <div class="card">

      <h2>📦 Products from Azure SQL</h2>

      <div
        id="products"
        class="products"
      >

        <div class="loading">
          Loading products...
        </div>

      </div>

    </div>


    <div class="status">
      ☁️ Application running on Azure App Service
    </div>

  </div>


  <script>

    // ============================================
    // LOAD PRODUCTS
    // ============================================

    async function loadProducts() {

      const container =
        document.getElementById("products");

      container.innerHTML =
        '<div class="loading">Loading products...</div>';


      try {

        const response =
          await fetch("/api/products");


        if (!response.ok) {

          throw new Error(
            "Failed to fetch products"
          );

        }


        const products =
          await response.json();


        container.innerHTML = "";


        if (products.length === 0) {

          container.innerHTML =
            '<div class="empty">📦 No products found</div>';

          return;

        }


        products.forEach(function(product) {

          const card =
            document.createElement("div");

          card.className = "product";


          const icon =
            document.createElement("div");

          icon.className = "product-icon";

          icon.textContent = "🛍️";


          const id =
            document.createElement("div");

          id.className = "product-id";

          id.textContent =
            "Product #" + product.id;


          const name =
            document.createElement("div");

          name.className = "product-name";

          name.textContent =
            product.name;


          const price =
            document.createElement("div");

          price.className = "product-price";

          price.textContent =
            "₹" +
            Number(product.price)
              .toLocaleString("en-IN");


          card.appendChild(icon);
          card.appendChild(id);
          card.appendChild(name);
          card.appendChild(price);


          container.appendChild(card);

        });


      } catch (error) {

        console.error(error);

        container.innerHTML =
          '<div class="empty">❌ Failed to load products</div>';

      }

    }


    // ============================================
    // ADD PRODUCT
    // ============================================

    document
      .getElementById("productForm")
      .addEventListener(
        "submit",
        async function(event) {

          event.preventDefault();


          const name =
            document
              .getElementById("name")
              .value
              .trim();


          const price =
            Number(
              document
                .getElementById("price")
                .value
            );


          const button =
            document.getElementById("saveButton");


          if (!name) {

            showMessage(
              "Please enter a product name.",
              "error"
            );

            return;

          }


          if (
            Number.isNaN(price) ||
            price < 0
          ) {

            showMessage(
              "Please enter a valid price.",
              "error"
            );

            return;

          }


          button.disabled = true;

          button.textContent =
            "⏳ Saving...";


          try {

            const response =
              await fetch(
                "/api/products",
                {

                  method: "POST",

                  headers: {
                    "Content-Type":
                      "application/json"
                  },

                  body: JSON.stringify({
                    name: name,
                    price: price
                  })

                }
              );


            const data =
              await response.json();


            if (!response.ok) {

              throw new Error(
                data.error ||
                "Failed to save product"
              );

            }


            showMessage(
              "✅ " +
              data.name +
              " saved successfully!",
              "success"
            );


            document
              .getElementById("productForm")
              .reset();


            await loadProducts();


          } catch (error) {

            console.error(error);

            showMessage(
              "❌ " + error.message,
              "error"
            );

          } finally {

            button.disabled = false;

            button.textContent =
              "💾 Save Product";

          }

        }
      );


    // ============================================
    // SHOW MESSAGE
    // ============================================

    function showMessage(text, type) {

      const message =
        document.getElementById("message");


      message.textContent = text;

      message.className = type;

      message.style.display = "block";


      setTimeout(function() {

        message.style.display = "none";

        message.className = "";

      }, 4000);

    }


    // ============================================
    // INITIAL LOAD
    // ============================================

    loadProducts();

  </script>

</body>

</html>
`;

  res.send(html);
});


// ======================================================
// GET PRODUCTS
// ======================================================

app.get("/api/products", async (req, res) => {

  try {

    const pool = await getPool();

    const result =
      await pool
        .request()
        .query(`
          SELECT
            id,
            name,
            price
          FROM products
          ORDER BY id
        `);


    res.status(200).json(
      result.recordset
    );


  } catch (error) {

    console.error(
      "Database error:",
      error
    );


    res.status(500).json({
      error: "Failed to fetch products"
    });

  }

});


// ======================================================
// ADD PRODUCT
// ======================================================

app.post("/api/products", async (req, res) => {

  try {

    const {
      name,
      price
    } = req.body;


    if (
      !name ||
      price === undefined ||
      price === null
    ) {

      return res.status(400).json({

        error:
          "Product name and price are required"

      });

    }


    const pool =
      await getPool();


    const result =
      await pool
        .request()

        .input(
          "name",
          sql.VarChar,
          name
        )

        .input(
          "price",
          sql.Decimal(18, 2),
          price
        )

        .query(`
          INSERT INTO products
            (name, price)

          OUTPUT
            INSERTED.id,
            INSERTED.name,
            INSERTED.price

          VALUES
            (@name, @price)
        `);


    res.status(201).json(
      result.recordset[0]
    );


  } catch (error) {

    console.error(
      "Database error:",
      error
    );


    res.status(500).json({

      error:
        "Failed to save product"

    });

  }

});


// ======================================================
// START SERVER
// ======================================================

const PORT =
  process.env.PORT || 3000;


app.listen(PORT, () => {

  console.log(
    "Server running on port " + PORT
  );

});