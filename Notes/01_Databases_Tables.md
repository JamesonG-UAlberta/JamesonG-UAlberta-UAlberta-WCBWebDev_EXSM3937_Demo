# EXSM 3937 Notes
## Databases & Tables
---

### Creation

Tables function sort of like Excel spreadsheets. They have rows and columns in which they store data. Rows are also referred to as "records".

Tables live in databases, which act sort of like workbooks in Excel, housing many tables (sheets).

You can create tables and databases using a CREATE statement:

    CREATE DATABASE mydatabase;

and

    CREATE TABLE myfirsttable (
        id int PRIMARY KEY AUTO_INCREMENT,
        name varchar(30)
    );

### Primary Keys

Records are identified by a primary key, which serves as a unique identifier for that record. They also serve to link a record to information in other tables through foriegn keys (when the primary key is used in a record in another table).

AUTO_INCREMENT tells the database to generate an incremental number for the field for each record. Note that if a record is deleted, that ID remains spent and will not be reused.

    CREATE TABLE mysecondtable (
        id int PRIMARY KEY AUTO_INCREMENT,
        otherid int REFERENCES myfirsttable.id
        information varchar(255)
    );

### Foreign Keys

In this example, the 'otherid' field is referencing the id field of the first table through a foreign key. This allows records in this table to "point to" records in the first table. 

For example, if we had a "make" and "model" table, we could have "Ford" with an ID of 1 in the "make" table, and "Mustang" with an ID of 5 in the "model" table but with a foreign key of 1 (in a foreign key column) which associates the Mustang to Ford.