-- create the database
create database online_retail_db;
-- use the database
use online_retail_db;
-- create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(50),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode VARCHAR(50),
    country VARCHAR(50),
    mobile CHAR(10),
    created DATETIME DEFAULT GETDATE()
);
-- craete the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2),
    stock INT,
    created DATETIME DEFAULT GETDATE()
);
-- create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- create the categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);
-- create the order item table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- insert sample data into categories table
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic gadgets and devices'),
('Books', 'Fiction, non-fiction, textbooks'),
('Clothing', 'Men and women clothing'),
('Home Appliances', 'Appliances for home use'),
('Sports', 'Sports equipment and apparel'),
('Toys', 'Toys for kids'),
('Beauty', 'Beauty and skincare products'),
('Automotive', 'Car accessories and parts'),
('Garden', 'Garden tools and supplies'),
('Office Supplies', 'Stationery and office tools');
-- insert sample data into products table
INSERT INTO products (product_name, category_id, price, stock) VALUES
('Smartphone', 1, 699.99, 50),
('Laptop', 1, 999.99, 30),
('Notebook', 2, 3.49, 200),
('Jeans', 3, 49.99, 100),
('Microwave', 4, 120.00, 25),
('Football', 5, 25.00, 60),
('Barbie Doll', 6, 15.99, 80),
('Lipstick', 7, 9.99, 150),
('Car Charger', 8, 19.99, 70),
('Garden Shovel', 9, 12.99, 40);
-- insert sample data into customers table
INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zipcode, country, mobile) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'USA', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Park Ave', 'Los Angeles', 'CA', '90001', 'USA', '2345678901'),
('Alice', 'Johnson', 'alice.j@example.com', '3456789012', '789 Elm St', 'Chicago', 'IL', '60601', 'USA', '3456789012'),
('Bob', 'Brown', 'bob.b@example.com', '4567890123', '321 Oak St', 'Houston', 'TX', '77001', 'USA', '4567890123'),
('Charlie', 'Davis', 'charlie.d@example.com', '5678901234', '654 Pine St', 'Phoenix', 'AZ', '85001', 'USA', '5678901234'),
('Eva', 'Garcia', 'eva.g@example.com', '6789012345', '987 Cedar Rd', 'Philadelphia', 'PA', '19101', 'USA', '6789012345'),
('Frank', 'Miller', 'frank.m@example.com', '7890123456', '246 Birch Rd', 'San Antonio', 'TX', '78201', 'USA', '7890123456'),
('Grace', 'Wilson', 'grace.w@example.com', '8901234567', '135 Maple St', 'San Diego', 'CA', '92101', 'USA', '8901234567'),
('Henry', 'Taylor', 'henry.t@example.com', '9012345678', '864 Walnut St', 'Dallas', 'TX', '75201', 'USA', '9012345678'),
('Isla', 'Anderson', 'isla.a@example.com', '0123456789', '753 Spruce Ln', 'San Jose', 'CA', '95101', 'USA', '0123456789');
-- insert sample data into orders table
INSERT INTO orders (customer_id, total_amount) VALUES
(1, 125.50),
(2, 89.99),
(3, 250.00),
(4, 45.00),
(5, 310.75),
(6, 98.25),
(7, 120.00),
(8, 76.49),
(9, 220.10),
(10, 33.33);
-- insert sample data into order_items table
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 699.99),
(2, 2, 1, 999.99),
(3, 3, 10, 3.49),
(4, 4, 2, 49.99),
(5, 5, 1, 120.00),
(6, 6, 3, 25.00),
(7, 7, 2, 15.99),
(8, 8, 5, 9.99),
(9, 9, 2, 19.99),
(10, 10, 1, 12.99);
-- reterive all orders for a specific customers
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount,
    oi.order_item_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.customer_id = 1;














