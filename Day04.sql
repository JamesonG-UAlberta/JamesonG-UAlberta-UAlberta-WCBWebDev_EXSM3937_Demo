DROP PROCEDURE IF EXISTS AddProduct;

/* Set our delimeter to something we can use to end the procedure, so it doesn't end prematurely when we have statements inside. */
DELIMITER |
CREATE PROCEDURE AddProduct
/* Specify our parameters. */
(
    catName varchar(30), 
    catDesc varchar(100), 
    prodName varchar(100),
    prodPrice decimal(5,2)
)
BEGIN
    /* If our category does not exist... */
	IF (NOT EXISTS (SELECT * FROM categories WHERE name=catName)) THEN
        /* If a description was not provided... */
        IF catDesc IS NULL THEN
            /* Throw an exception. */
            SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='You must provide a category description if the category does not exist.';
        END IF;
        /* Insert our category. */
        INSERT INTO categories (name, description) 
        	VALUES (catName, catDesc);
    END IF;
    /* Grab the ID for our category for use in the foreign key. */
    SET @catID = (SELECT id FROM categories WHERE name=catName);
    /* Insert our product. */
   	INSERT INTO products (category_id, name, price, qoh)
    	VALUES (@catID, prodName, prodPrice, 0);
/* End the procedure with our custom delimiter. */
END |
/* Set our delimeter back to semicolon. */
DELIMITER ;


/* Error, nonexistent category with a null description. */
CALL AddProduct('Toiletries', NULL, 'Paper Towel', 0.50);

/* Good call with an existing category. */
CALL AddProduct('Bakery', NULL, 'Pita Bread', 2.25);

/* Good call with a new category. */
CALL AddProduct('Fish', 'Stuff from the ocean.', 'Salmon Filet', 10.50);