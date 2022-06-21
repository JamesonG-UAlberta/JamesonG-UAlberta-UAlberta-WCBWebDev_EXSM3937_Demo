DROP FUNCTION IF EXISTS AveragePrice;

/* Set our delimeter to something we can use to end the procedure, so it doesn't end prematurely when we have statements inside. */
DELIMITER |
CREATE FUNCTION AveragePrice
/* Specify our parameters. */
(
    catName varchar(30)
)
/* Since functions return a value, SQL needs to know what data type to expect out of it. */
RETURNS decimal(5,2)
/* A deterministic function will always return the same result for a given parameter and database state. */
NOT DETERMINISTIC
BEGIN
    /* Set a variable to our output value so we can return it. */
    SET @averagePrice = (
        SELECT AVG(price) 
            FROM products
            INNER JOIN categories on products.category_id=categories.id
        WHERE categories.name=catName
    );
    /* If the category doesn't exist... */
    IF (@averagePrice IS NULL) THEN
        /* Throw an error. */
        SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='The category name provided does not exist.';
    ELSE
        /* Otherwise return our result. */
        RETURN @averagePrice;
    END IF;
/* End the function with our custom delimiter. */
END |
/* Set our delimeter back to semicolon. */
DELIMITER ;
