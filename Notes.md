# EXSM 3937 Notes

C - Create (INSERT)

R - Read (SELECT)

U - Update (UPDATE)

D - Delete (DELETE)

## Databases and Tables
---

Tables function sort of like Excel spreadsheets. They have rows and columns in which they store data. Rows are also referred to as "records".

Tables live in databases, which act sort of like workbooks in Excel, housing many tables (sheets).

You can create tables and databases using a CREATE statement:

    CREATE DATABASE mydatabase

and

    CREATE TABLE myfirsttable (
        id int PRIMARY KEY AUTO_INCREMENT,
        name varchar(30)
    )

Records are identified by a primary key, which serves as a unique identifier for that record. They also serve to link a record to information in other tables through foriegn keys (when the primary key is used in a record in another table).

AUTO_INCREMENT tells the database to generate an incremental number for the field for each record. Note that if a record is deleted, that ID remains spent and will not be reused.

    CREATE TABLE mysecondtable (
        id int PRIMARY KEY AUTO_INCREMENT,
        otherid int REFERENCES myfirsttable.id
        information varchar(255)
    )

In this example, the 'otherid' field is referencing the id field of the first table through a foreign key. This allows records in this table to "point to" records in the first table. 

For example, if we had a "make" and "model" table, we could have "Ford" with an ID of 1 in the "make" table, and "Mustang" with an ID of 5 in the "model" table but with a foreign key of 1 (in a foreign key column) which associates the Mustang to Ford.

## Modifying Data 
---
Data can be inserted into a table using an INSERT statement:

    INSERT INTO myfirsttable (name) VALUES
    ('A Name');

AUTO_INCREMENT fields should not be included in INSERT's.

Data can be updated in a table using a UPDATE statement:

    UPDATE myfirsttable
    SET name = 'Another Name'
    WHERE id = 1;

Data can be deleted from a table using a DELETE statement:

    DELETE FROM myfirsttable
    WHERE id = 1;

Be *very* careful when updating and deleting as it is possible to affect many more records than you intend to. To be safe, always do a select with your where clause first, or wrap the statement in a transaction (rolling it back before committing it).  

## Selecting Data 
---
To retrieve data from a table, we can use a SELECT statement:

    SELECT *
    FROM myfirsttable
    WHERE id = 1;

The * stands for 'records' and allows you to retrieve all available columns/fields.

If we want data from multiple tables, we can use a JOIN which comes in three main varieties (or, really, two): INNER JOIN and LEFT/RIGHT JOIN. An INNER JOIN will only include data that is on "both sides" of the join (NULLs excluded) whereas LEFT/RIGHT JOIN will show NULLS depending on the orientation.

    SELECT myfirsttable.id, mysecondtable.id, myfirsttable.name, mysecondtable.information
        FROM myfirsttable
        INNER JOIN mysecondtable ON myfirsttable.id=mysecondtable.otherid;

If we want to use aggregates (COUNT, SUM, MAX, MIN, AVG, etc.) we can tell the query how we want that data grouped for the aggregate:

    SELECT COUNT(*)
        FROM myfirsttable
        INNER JOIN mysecondtable ON myfirsttable.id=mysecondtable.otherid;
    GROUP BY myfirsttable.id;

In this example, a count will be shown  of how many records in the second table as associated with each record in the first table.

Finally, SELECT statements can be stored in view's which serve as convenient ways to access complicated information with minimal effort:

    CREATE VIEW myview AS
    SELECT myfirsttable.id, mysecondtable.id, myfirsttable.name, mysecondtable.information
        FROM myfirsttable
        INNER JOIN mysecondtable ON myfirsttable.id=mysecondtable.otherid;

This will bundle the joined query into a view that can be accessed such:

    SELECT * FROM myview;