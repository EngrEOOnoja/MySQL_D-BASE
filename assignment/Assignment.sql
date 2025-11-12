--  Create the database
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

-- ALTER TABLE users
-- RENAME COLUMN id TO user_id;


-- -- -- -- Create the products table
CREATE TABLE IF NOT EXISTS products (
product_id INT PRIMARY KEY,
name VARCHAR(100),
price VARCHAR(100),
expiring_date VARCHAR(100)
);

--  Create the orders table with foreign key
CREATE TABLE IF NOT EXISTS orders (
order_id INT PRIMARY KEY,
user_id INT,
total_amount DECIMAL(10,2),
status VARCHAR(50) DEFAULT 'Pending',
FOREIGN KEY (user_id) REFERENCES users(user_id)
 );