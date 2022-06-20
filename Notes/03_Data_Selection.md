# EXSM 3937 Notes
## Data Selection
---
## Selecting Data From A Table
To retrieve data from a table, we can use a SELECT statement:

    SELECT *
    FROM myfirsttable
    WHERE id = 1;

The * stands for 'records' and allows you to retrieve all available columns/fields.

If we want data from multiple tables, we can use a JOIN which comes in three main varieties (or, really, two): INNER JOIN and LEFT/RIGHT JOIN. An INNER JOIN will only include data that is on "both sides" of the join (NULLs excluded) whereas LEFT/RIGHT JOIN will show NULLS depending on the orientation.

    SELECT myfirsttable.id, mysecondtable.id, myfirsttable.name, mysecondtable.information
        FROM myfirsttable
        INNER JOIN mysecondtable ON myfirsttable.id=mysecondtable.otherid;
---
## Aggregation
If we want to use aggregates (COUNT, SUM, MAX, MIN, AVG, etc.) we can tell the query how we want that data grouped for the aggregate:

    SELECT COUNT(*)
        FROM myfirsttable
        INNER JOIN mysecondtable ON myfirsttable.id=mysecondtable.otherid;
    GROUP BY myfirsttable.id;

In this example, a count will be shown  of how many records in the second table as associated with each record in the first table.

Aggregates essentially turn your data set into a "big bowl of soup", and pick only the specified values out of the soup. 

Aggregates are often combined with GROUP BY clauses, which filter the "bowl of soup" into smaller "cups of soup". In the snippet above, the data set is broken up into one "cup of soup" for each ID value of the first table. When these clauses are used with aggregates, the aggregate is run on each "cup" instead of the "big bowl".

When writing queries in this way, it is important to recognize that using fields not in the GROUP BY and outside of aggregates in your field list (the SELECT clause) will result in garbage data, as it will simply pick the first value in the group (not by any defined rule). Some database systems will just error out if you try (for example SQL Server).

When WHERE clauses are used with GROUP BY clauses, the WHERE clause runs first. If you want to filter based on the result of a GROUP BY / Aggregate, you must use a HAVING clause. If the GROUP BY / Aggregates are a "factory", the WHERE guards the "entrance" and the HAVING guards the "exit". 
---
### Edge Case - Selecting Another Field Based on MAX/MIX Without Subqueries

In the event that you want to, say, "Select the name of the product with the highest price." you are traditionally stuck using a subquery, as attemping this:

    SELECT name, MAX(price)
    FROM product;

will result in the correct highest price, but the first name in the database (not paired to said price).

We can get around this by combining ORDER BY (to put the record with the highest price at the top) and LIMIT 1 (to cut the rest of the data off):

    SELECT name, price
    FROM product
    ORDER BY price DESC
    LIMIT 1;
---
### Subqueries

In very specific circumstances, it may only be possible to achieve the desired result using a subquery - a query nested in a query. They typically have only one column and allow you to cross-reference your table with a subset defined using another SELECT. These take (relatively) forever to run and are hard to read. Avoid them if possible. There's no reason to do this in one query in a application, but as an example, here is BOTH the highest and lowest priced product using subqueries:

    SELECT name, price AS 'Highest AND Lowest Price'
    FROM products
    WHERE id IN 
        (SELECT id FROM products WHERE price IN (SELECT MAX(price) FROM products))
    OR id IN 
        (SELECT id FROM products WHERE price IN (SELECT MIN(price) FROM products));
        
Having subqueries more than 3 layers deep is almost never necessary and is viewed as bad practice. Note that most database engines don't like using LIMIT in subqueries which makes them even more complex in scenarios such as this.
---
### Views

Finally, SELECT statements can be stored in view's which serve as convenient ways to access complicated information with minimal effort:

    CREATE VIEW myview AS
    SELECT myfirsttable.id, mysecondtable.id, myfirsttable.name, mysecondtable.information
        FROM myfirsttable
        INNER JOIN mysecondtable ON myfirsttable.id=mysecondtable.otherid;

This will bundle the joined query into a view that can be accessed such:

    SELECT * FROM myview;