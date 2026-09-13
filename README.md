# Sales & Order Management Analytics

##  Project Overview

This project is a SQL-based Sales & Order Management Analytics System developed using MySQL.

The project focuses on designing a relational database and performing business-oriented data analysis using SQL. It includes customer, product, order, order item, and payment data.

The project demonstrates both basic and advanced SQL concepts used in real-world data analytics.

---

##  Objectives

- Design a relational database for sales and order management
- Store customer, product, order, and payment information
- Perform CRUD operations
- Use SQL JOINs to combine data from multiple tables
- Analyze sales and revenue
- Identify top-performing products
- Identify high-value customers
- Analyze monthly sales trends
- Analyze order and payment status
- Identify repeat customers
- Use advanced SQL queries for business analysis
- Improve query performance using indexes

---

## 🗄️ Database Tables

The database contains the following tables:

### 1. Customers
Stores customer information.

- Customer ID
- Name
- Email
- City
- Signup Date

### 2. Products
Stores product information.

- Product ID
- Product Name
- Category
- Price
- Stock

### 3. Orders
Stores order information.

- Order ID
- Customer ID
- Order Date
- Status
- Total Amount

### 4. Order Items
Stores products included in each order.

- Order Item ID
- Order ID
- Product ID
- Quantity
- Unit Price

### 5. Payments
Stores payment information.

- Payment ID
- Order ID
- Payment Date
- Amount
- Payment Status

---

## 🔗 Database Relationships

```text
Customers
    |
    | 1 : Many
    ↓
Orders
    |
    | 1 : Many
    ↓
Order_Items
    ↑
    |
Products

Orders
    |
    | 1 : Many
    ↓
Payments
