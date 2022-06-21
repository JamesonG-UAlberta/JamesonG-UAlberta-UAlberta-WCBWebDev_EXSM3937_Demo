DROP TRIGGER IF EXISTS ExampleTrigger;

/* Set our delimeter to something we can use to end the procedure, so it doesn't end prematurely when we have statements inside. */
DELIMITER |
/* The trigger will fire after the INSERT is complete (required for access to the AUTO_INCREMENT field), once for each row. */
CREATE TRIGGER ExampleTrigger AFTER INSERT ON products FOR EACH ROW
BEGIN
    /* Using the new ID and the function NOW() for the current time, we log our addition in the productlog table. */
    INSERT INTO productlog(productid, dateadded)
    VALUES (NEW.id, NOW());
END |
/* Set our delimeter back to semicolon. */
DELIMITER ;

