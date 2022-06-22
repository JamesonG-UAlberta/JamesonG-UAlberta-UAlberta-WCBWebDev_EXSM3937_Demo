DROP FUNCTION IF EXISTS AveragePrice;
DROP TRIGGER IF EXISTS ExampleTrigger;

/* Set our delimeter to something we can use to end the procedure, so it doesn't end prematurely when we have statements inside. */
DELIMITER |


CREATE FUNCTION AverageCredits()
/* Since functions return a value, SQL needs to know what data type to expect out of it. */
RETURNS decimal(3,2)
/* A deterministic function will always return the same result for a given parameter and database state. */
DETERMINISTIC
BEGIN
    /* Set a variable to our output value so we can return it. */
    SET @averageCredits = (
        SELECT AVG(credits) 
            FROM course
    );
    IF (@averageCredits IS NULL) THEN
        SET @averageCredits = 0;
    END IF;
    RETURN @averageCredits;
/* End the function with our custom delimiter. */
END |


/* The trigger will fire after the INSERT is complete (required for access to the AUTO_INCREMENT field), once for each row. */
CREATE TRIGGER ApplyAverageCredits AFTER INSERT ON course FOR EACH ROW
BEGIN
    /* Using the new ID and the function NOW() for the current time, we log our addition in the productlog table. */
    INSERT INTO credithistory(averagecredits, inserttime)
    VALUES (AverageCredits(), NOW());
END |


/* Set our delimeter back to semicolon. */
DELIMITER ;

