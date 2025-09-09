# online_retail_db

A sample SQL database schema for managing an online retail system, including customers, products, orders, categories, and order items.

---

## Overview

This project contains the SQL scripts and sample data to create and populate a simple online retail database. It models key entities such as:

- Customers
- Products
- Categories
- Orders
- Order Items

---

## Database Schema

The schema includes the following tables:

- `customers`: Stores customer information.
- `products`: Details of products available for sale.
- `categories`: Product categories.
- `orders`: Customer orders.
- `order_items`: Products included in each order.

---

## Usage

1. Run the SQL script `create_tables.sql` to create the database tables.
2. Run `insert_sample_data.sql` to populate the tables with sample data.
3. Use the queries in the `queries/` folder for common operations, such as retrieving customer orders.

---

## Sample Query

```sql
-- Retrieve all orders for a specific customer
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

