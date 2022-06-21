# EXSM 3937 Notes
## Procedures, Functions and Triggers
---
### General

Procedures, Functions and Triggers in databases allow you to bundle multiple queries and error checking together all in a simple call (like a function in JavaScript).

Procedures no not return values and are invoked with a CALL statement.

Functions return values and are invoked as part of a SELECT statement.

Triggers do not return values and are invoked automatically when a certain event happens (INSERT, UPDATE or DELETE on a table).

When defining any of these, it is important to change your delimiter so that you can use semicolons in the declaration without ending the declaration:

    DELIMITER |
    DELIMITER ;

The delimiter is changed to something nonstandard at the top, then back to the semicolon at the bottom.

Code blocks for these structures are begun using the BEGIN keyword and ended with the END keyword.

Variables can be declared and referenced in any of these code blocks using the @ symbol and SET keyword:

    SET @variableExample = (SELECT AVG(column) from table);

Decisions can be made using an IF structure:

    IF (EXISTS (SELECT * FROM table)) THEN
        /* Statements */
    ELSEIF (EXISTS (SELECT * FROM table2)) THEN
        /* Statements */
    ELSE
        /* Statements */
    END IF;

Errors can be raised using the SIGNAL keyword:

    SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='Your custom message goes here.';

State 45000 is a user defined error, and MYSQL_ERRNO is mostly arbitrary and at your discretion. 

### Parameters & Returns

Procedures and Functions both accept parameters defined in a list at the top of the declaration:

    CREATE PROCEDURE MyProcedure
    (
        paramOne int, 
        paramTwo varchar(100) 
    )

Functions also specify a return type for the value expected to come back out, as well as whether the function is deterministic or not (whether it should produce the same result with the same inputs and table data): 

    CREATE FUNCTION MyFunction
    (
        paramOne int, 
        paramTwo varchar(100) 
    )
    RETURNS decimal(5,2)
    NOT DETERMINISTIC

### Triggers

Triggers are set to fire on a given event on a table, either before or after the event:

    CREATE TRIGGER MyTrigger AFTER INSERT ON table FOR EACH ROW

Data from the INSERT in this case can be referenced using NEW:

    INSERT INTO logtable(recordid, dateadded)
    VALUES (NEW.id, NOW());

The same is true of UPDATE. UPDATE and DELETE also have access to OLD, the data prior to the UPDATE or DELETE.