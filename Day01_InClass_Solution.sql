INSERT INTO categories (name, description)
VALUES
('Candy', 'All the tooth decaying goodness.');

INSERT INTO products (name, qoh, price, category_id)
VALUES
('Sour Patch Kids', 3, 3.00, 5),
('Chocolate Bar', 5, 1.50, 5),
('6pk Burger Buns', 2, 1.20, 1),
('Milk 0.5L 1%', 3, 1.20, 2),
('Milk 0.5L 2%', 7, 1.35, 2);

SELECT * 
FROM products 
WHERE id > 20;

SELECT COUNT(*)
FROM products 
WHERE UPPER(name) LIKE 'ICE CREAM%'