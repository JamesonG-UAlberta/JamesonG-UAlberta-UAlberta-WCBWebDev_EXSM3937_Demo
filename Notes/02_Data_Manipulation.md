# EXSM 3937 Notes
## Data Manipulation
---
## Inserting 
Data can be inserted into a table using an INSERT statement:

    INSERT INTO myfirsttable (name) VALUES
    ('A Name');

AUTO_INCREMENT fields should not be included in INSERT's.
---
## Updating

Data can be updated in a table using a UPDATE statement:

    UPDATE myfirsttable
    SET name = 'Another Name'
    WHERE id = 1;
---
## Deleting

Data can be deleted from a table using a DELETE statement:

    DELETE FROM myfirsttable
    WHERE id = 1;

Be *very* careful when updating and deleting as it is possible to affect many more records than you intend to. To be safe, always do a select with your where clause first, or wrap the statement in a transaction (rolling it back before committing it).  