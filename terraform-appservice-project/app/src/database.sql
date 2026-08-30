CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(18,2) NOT NULL
);

INSERT INTO products (name, price)
VALUES
('Laptop', 65000),
('Mouse', 800),
('Keyboard', 1500);