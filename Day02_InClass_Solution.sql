SELECT AVG(price)
FROM products
WHERE category_id = 5;

SELECT MAX(price)
FROM products 
WHERE category_id = 3;

SELECT COUNT(*)
FROM products 
WHERE UPPER(name) LIKE '%MILK%' AND UPPER(name) LIKE '%1\%';

SELECT *
FROM products 
WHERE qoh <= 3;