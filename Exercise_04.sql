DROP PROCEDURE IF EXISTS AddCourse;

/* Set our delimeter to something we can use to end the procedure, so it doesn't end prematurely when we have statements inside. */
DELIMITER |
CREATE PROCEDURE AddCourse
/* Specify our parameters. */
(
    courseCode char(8), 
    courseName varchar(40), 
    courseCredits int,
    progName varchar(30),
    progDesc varchar(100)
)
BEGIN
    /* If our program does not exist... */
	IF (NOT EXISTS (SELECT * FROM program WHERE name=progName)) THEN
        /* If a description was not provided... */
        IF progDesc IS NULL THEN
            /* Throw an exception. */
            SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='You must provide a program description if the program does not exist.';
        END IF;
        /* Insert our category. */
        INSERT INTO program (name, description) 
        	VALUES (progName, progDesc);
    END IF;
    /* Grab the ID for our program for use in the foreign key. */
    SET @progID = (SELECT id FROM program WHERE name=progName);
    /* Insert our course. */
   	INSERT INTO course (code, name, credits, programid)
    	VALUES (courseCode, courseName, courseCredits, @progID);
/* End the procedure with our custom delimiter. */
END |
/* Set our delimeter back to semicolon. */
DELIMITER ;


/* Error, nonexistent program with a null description. */
CALL AddCourse('PHYS1001', 'Physics', 2, 'Physics Specialty', NULL);

/* Good call with an existing program. */
CALL AddCourse('SCIP1001', 'Physics', 2, 'Science', NULL);

/* Good call with a new program. */
CALL AddCourse('SOCI1001', 'Social Studies', 1, 'Society Studies', 'Learning about history and societies.');