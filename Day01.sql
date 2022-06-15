CREATE DATABASE exsm3937_day01;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30),
    description varchar(100)
);

CREATE TABLE products (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30),
    qoh int,
    price decimal(5,2),
    category_id int REFERENCES categories(id)
    /* CONSTRAINT FK_CategoryId FOREIGN KEY (category_id) REFERENCES categories(id) */
);

INSERT INTO categories (name, description)
VALUES
('Bakery', 'Bread, buns, all types of grain foods.'),
('Dairy', 'Milk, cream, butter, all types of milk products'),
('Garden', 'Fruits, vegitables, plant-stuffs.'),
('Frozen', 'Pre-packaged goodness.');

INSERT INTO products (name, qoh, price, category_id)
VALUES
('Bread', 5, 1.00, 1),
('6pk Buns', 3, 1.25, 1),
('8pk Hot Dog Buns', 7, 1.50, 1),
('Milk 1L 1%', 3, 1.60, 2),
('Milk 1L 2%', 7, 1.80, 2),
('Milk 4L 1%', 2, 3.00, 2),
('Ice Cream Vanilla', 3, 3.00, 2),
('Ice Cream Chocolate', 5, 3.20, 2),
('Tomato', 12, 0.40, 3),
('Potato', 18, 0.25, 3),
('Onion', 14, 0.30, 3),
('Pizza, Cheese', 3, 6.00, 4),
('Pizza, Pepperoni', 4, 6.20, 4);


INSERT INTO products (name, qoh, price, category_id)
VALUES
('Bread, Whole Grain', 3, 2.00, 1),
('Milk 4L 2%', 3, 3.25, 2),
('Ice Cream Neopolitan', 2, 3.50, 2),
('Broccoli', 20, 0.70, 3),
('Cauliflower', 17, 0.65, 3),
('Orange', 12, 0.55, 3),
('Pizza, Hawaiian', 2, 7.00, 4);

SELECT name, price FROM `products`; /* Just name and price. */

SELECT name, price FROM `products`
WHERE category_id = 2; /* Only dairy products. */

SELECT name, price FROM `products`
WHERE category_id = 2
ORDER BY name; /* In alphabetical order. */

SELECT name, price FROM `products`
WHERE category_id = 4
ORDER BY price DESC; /* In reverse order. */

UPDATE products
SET price = 8.00
WHERE name = 'Pizza, Hawaiian'; 
/* Generally speaking, you don't want to delete/update
on things other than the PRIMARY KEY without doing a select first. */

DELETE FROM products
WHERE name = 'Pizza, Pepperoni';
/* In practice in industry, DELETE very rarely gets used, instead, records are flagged as 'archived' and not displayed to users. */

SELECT COUNT(*) AS 'How Many Frozen?' 
FROM `products`
WHERE category_id = 4;
/* Retrieve a count of records matching the query, with a fancy heading. */

SELECT DISTINCT price FROM `products`;
/* Remove duplicate items. */