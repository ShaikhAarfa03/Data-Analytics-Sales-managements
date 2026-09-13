create database  sales_order_management;
Use sales_order_management;
SELECT DATABASE();
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(80),
    signup_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(80) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    CHECK (price > 0),
    CHECK (stock >= 0)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CHECK (total_amount >= 0)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CHECK (amount >= 0)
);
SHOW TABLES;
DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE payments;

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '2025-01-10'),
(2, 'Priya Patel', 'priya@gmail.com', 'Delhi', '2025-01-15'),
(3, 'Rahul Mehta', 'rahul@gmail.com', 'Pune', '2025-02-05'),
(4, 'Sneha Shah', 'sneha@gmail.com', 'Mumbai', '2025-02-20'),
(5, 'Rohan Verma', 'rohan@gmail.com', 'Bangalore', '2025-03-12'),
(6, 'Ananya Gupta', 'ananya@gmail.com', 'Delhi', '2025-03-25'),
(7, 'Vikram Singh', 'vikram@gmail.com', 'Pune', '2025-04-10'),
(8, 'Neha Joshi', 'neha@gmail.com', 'Mumbai', '2025-04-18'),
(9, 'Karan Malhotra', 'karan@gmail.com', 'Hyderabad', '2025-05-02'),
(10, 'Isha Kapoor', 'isha@gmail.com', 'Bangalore', '2025-05-15');
SELECT * FROM customers;

INSERT INTO products
(product_id, product_name, category, price, stock)
VALUES
(101, 'Laptop', 'Electronics', 65000, 20),
(102, 'Smartphone', 'Electronics', 35000, 35),
(103, 'Headphones', 'Electronics', 3000, 50),
(104, 'Keyboard', 'Accessories', 2500, 40),
(105, 'Mouse', 'Accessories', 1200, 60),
(106, 'Smart Watch', 'Wearables', 5000, 30),
(107, 'Backpack', 'Bags', 1800, 45),
(108, 'Running Shoes', 'Footwear', 4000, 25),
(109, 'T-Shirt', 'Fashion', 1000, 80),
(110, 'Jeans', 'Fashion', 2500, 50),
(111, 'Bluetooth Speaker', 'Electronics', 4500, 25),
(112, 'Water Bottle', 'Accessories', 800, 100);
SELECT * FROM  products;

INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1001, 1, '2025-01-20', 'COMPLETED', 65000),
(1002, 2, '2025-01-25', 'COMPLETED', 35000),
(1003, 3, '2025-02-10', 'COMPLETED', 5500),
(1004, 4, '2025-02-18', 'CANCELLED', 4000),
(1005, 5, '2025-03-05', 'COMPLETED', 5000),
(1006, 6, '2025-03-15', 'COMPLETED', 27000),
(1007, 7, '2025-03-25', 'PENDING', 2500),
(1008, 8, '2025-04-05', 'COMPLETED', 7000),
(1009, 9, '2025-04-15', 'COMPLETED', 8000),
(1010, 10, '2025-04-25', 'COMPLETED', 1800),
(1011, 1, '2025-05-05', 'COMPLETED', 4500),
(1012, 2, '2025-05-12', 'COMPLETED', 7500),
(1013, 3, '2025-05-20', 'COMPLETED', 3000),
(1014, 4, '2025-06-05', 'COMPLETED', 68000),
(1015, 5, '2025-06-15', 'PENDING', 4000),
(1016, 6, '2025-06-25', 'COMPLETED', 5000),
(1017, 7, '2025-07-05', 'COMPLETED', 5300),
(1018, 8, '2025-07-15', 'COMPLETED', 35000),
(1019, 9, '2025-07-25', 'CANCELLED', 2500),
(1020, 10, '2025-08-05', 'COMPLETED', 4500);
SELECT * FROM orders;

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 65000),
(2, 1002, 102, 1, 35000),
(3, 1003, 103, 1, 3000),
(4, 1003, 105, 2, 1200),
(5, 1004, 108, 1, 4000),
(6, 1005, 106, 1, 5000),
(7, 1006, 102, 1, 35000),
(8, 1006, 103, 1, 3000),
(9, 1007, 104, 1, 2500),
(10, 1008, 106, 1, 5000),
(11, 1008, 105, 1, 1200),
(12, 1008, 112, 1, 800),
(13, 1009, 108, 2, 4000),
(14, 1010, 107, 1, 1800),
(15, 1011, 111, 1, 4500),
(16, 1012, 104, 1, 2500),
(17, 1012, 106, 1, 5000),
(18, 1013, 103, 1, 3000),
(19, 1014, 101, 1, 65000),
(20, 1014, 105, 1, 1200),
(21, 1015, 108, 1, 4000),
(22, 1016, 106, 1, 5000),
(23, 1017, 103, 1, 3000),
(24, 1017, 107, 1, 1800),
(25, 1017, 112, 1, 800),
(26, 1018, 102, 1, 35000),
(27, 1019, 104, 1, 2500),
(28, 1020, 111, 1, 4500);
SELECT * FROM order_items;

INSERT INTO payments
(payment_id, order_id, payment_date, amount, payment_status)
VALUES
(1, 1001, '2025-01-20', 65000, 'SUCCESS'),
(2, 1002, '2025-01-25', 35000, 'SUCCESS'),
(3, 1003, '2025-02-10', 5500, 'SUCCESS'),
(4, 1004, '2025-02-18', 4000, 'FAILED'),
(5, 1005, '2025-03-05', 5000, 'SUCCESS'),
(6, 1006, '2025-03-15', 27000, 'SUCCESS'),
(7, 1007, '2025-03-25', 2500, 'PENDING'),
(8, 1008, '2025-04-05', 7000, 'SUCCESS'),
(9, 1009, '2025-04-15', 8000, 'SUCCESS'),
(10, 1010, '2025-04-25', 1800, 'SUCCESS'),
(11, 1011, '2025-05-05', 4500, 'SUCCESS'),
(12, 1012, '2025-05-12', 7500, 'SUCCESS'),
(13, 1013, '2025-05-20', 3000, 'SUCCESS'),
(14, 1014, '2025-06-05', 68000, 'SUCCESS'),
(15, 1015, '2025-06-15', 4000, 'PENDING'),
(16, 1016, '2025-06-25', 5000, 'SUCCESS'),
(17, 1017, '2025-07-05', 5300, 'SUCCESS'),
(18, 1018, '2025-07-15', 35000, 'SUCCESS'),
(19, 1019, '2025-07-25', 2500, 'FAILED'),
(20, 1020, '2025-08-05', 4500, 'SUCCESS');
SELECT * FROM payments;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS  total_products
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT COUNT(*) AS total_payments
FROM payments;

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(11, 'Test Customer', 'test@gmail.com', 'Mumbai', '2025-08-10');
SELECT * 
FROM customers
WHERE customer_id = 11;
 Select * from customers;
DELETE FROM customers
WHERE customer_id = 11;

Select order_id, payment_date From payments;

UPDATE products
SET stock = stock - 1
WHERE product_id = 101;
SELECT *
FROM products
WHERE product_id = 101;

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(11, 'Test Customer', 'test@gmail.com', 'Mumbai', '2025-08-10');
DELETE FROM customers
WHERE customer_id = 11;

SELECT
    c.name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT
    c.name AS customer_name,
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS item_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;

SELECT
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'COMPLETED';

SELECT
    COUNT(*) AS completed_orders
FROM orders
WHERE status = 'COMPLETED';

SELECT
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status = 'COMPLETED';

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.category
ORDER BY revenue DESC;

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 1;

SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) >
(
    SELECT AVG(total_amount)
    FROM orders
    WHERE status = 'COMPLETED'
);

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.name,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.status = 'COMPLETED'
    GROUP BY c.customer_id, c.name
)

SELECT *
FROM customer_sales
ORDER BY total_spent DESC;

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.name,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.status = 'COMPLETED'
    GROUP BY c.customer_id, c.name
)

SELECT
    customer_id,
    name,
    total_spent,
    CASE
        WHEN total_spent >= 50000 THEN 'High Value'
        WHEN total_spent >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_sales
ORDER BY total_spent DESC;

SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS revenue,
    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS revenue_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name;

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS revenue
FROM orders
WHERE status = 'COMPLETED'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders
FROM orders
WHERE status = 'COMPLETED'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT
    SUM(amount) AS successful_payment_revenue
FROM payments
WHERE payment_status = 'SUCCESS';

SELECT
    payment_status,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status;

CREATE VIEW customer_sales_view AS
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name;
SELECT *
FROM customer_sales_view
ORDER BY total_spent DESC;

CREATE VIEW product_sales_view AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name,
    p.category;
    
SELECT *
FROM product_sales_view
ORDER BY revenue DESC;

CREATE INDEX idx_orders_customer
ON orders(customer_id);
CREATE INDEX idx_orders_date
ON orders(order_date);
CREATE INDEX idx_orders_status
ON orders(status);
CREATE INDEX idx_order_items_product
ON order_items(product_id);

EXPLAIN
SELECT
    *
FROM orders
WHERE customer_id = 1;

START TRANSACTION;

UPDATE products
SET stock = stock - 1
WHERE product_id = 101;

COMMIT;
ROLLBACK;