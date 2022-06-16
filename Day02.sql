SELECT COUNT(*)
FROM products 
WHERE UPPER(name) LIKE 'ICE CREAM%' AND UPPER(name) LIKE '%Vanilla%';
/* Using AND to select multiple criteria. */

SELECT *
FROM products 
WHERE UPPER(name) LIKE 'ICE CREAM%' OR UPPER(name) LIKE '%ATO';
/* Using OR to select alternate criteria. */

SELECT *
FROM products 
WHERE UPPER(name) LIKE 'ICE CREAM%' OR UPPER(name) LIKE '%1\%';
/* Using a backslash to escape a percentage sign. */

SELECT *
FROM products
WHERE ID > 10
LIMIT 10;
/* Using a WHERE and LIMIT to 'paginate' results. */

SELECT AVG(qoh)
FROM products 
WHERE name LIKE 'ICE CREAM%';
/* Using AVG to get the average of a column. */

SELECT SUM(qoh)
FROM products 
WHERE name LIKE 'ICE CREAM%';
/* Using SUM to get the total of a column. */

SELECT MIN(qoh), MAX(qoh)
FROM products 
WHERE name LIKE 'ICE CREAM%';
/* Using MIN and MAX to get the lowest and highest value. */

SELECT category_id, SUM(qoh)
FROM products
GROUP BY category_id
/* Using GROUP BY to get a sum for categories. */

SELECT category_id, SUM(qoh)
FROM products
GROUP BY category_id
HAVING sum(qoh) < 10;
/* Using HAVING to filter GROUP BY results (runs after the GROUP BY). */

SELECT category_id, SUM(qoh)
FROM products
WHERE price >= 1.00
GROUP BY category_id
HAVING sum(qoh) > 10;
/* Combining WHERE and HAVING to pre-filter a GROUP BY. */

SELECT category_id, price, COUNT(id)
FROM products
GROUP BY category_id, price;
/* Grouping by a combination of category_id and price. */

SELECT category_id, SUM(qoh)
FROM products
WHERE price >= 1.00
GROUP BY category_id
HAVING sum(qoh) > 10
ORDER BY category_id DESC;
/* Combining everything. */