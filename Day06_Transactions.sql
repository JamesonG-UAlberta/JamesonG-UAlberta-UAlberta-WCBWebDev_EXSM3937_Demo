/* Takes a snapshot of the database and stores it in memory. */
START TRANSACTION;

SELECT * FROM credithistory;

INSERT INTO COURSE (code, credits, name, programid) VALUES ('TEST1003', 3, 'Test course 3', 2);
INSERT INTO COURSE (code, credits, name, programid) VALUES ('TEST1004', 3, 'Test course 4', 2);

SELECT * FROM credithistory;

/* Reverts to the snapshot. */
ROLLBACK;

/* Makes the changes permanent. */
COMMIT;