/* Select a count of all contacts who have a zero in their email address, and the domain is adventure-works.com. */
SELECT COUNT(*)
FROM contact
WHERE EmailAddress LIKE '%0%adventure-works.com';
/*2662*/

/* Select unique titles given to contacts. */
SELECT DISTINCT Title
FROM contact;
/*
Mr.
Ms.
Sr.
Sra.
NULL
Ms
Mrs.
*/

/* Select only the location with the highest rate. */
SELECT * 
FROM location
ORDER BY CostRate DESC
LIMIT 1;
/* 20   Frame Welding   25  108.00  1998-06-01 00:00:00 */

/* Select the ID of the sales person who has exceeded their quota this year by the greatest amount (HINT: sales people). */
SELECT SalesPersonID
FROM salesperson
ORDER BY SalesYTD-SalesQuota DESC
LIMIT 1;
/* 276 */

/* Select the product ID with the highest quantity sold on a single order (HINT: sales order details). */
SELECT ProductID
FROM salesorderdetail
ORDER BY OrderQty DESC
LIMIT 1;
/* 863 */

/* Select the count of products whose descriptions mention ‘race’ (HINT: product descriptions). */
SELECT COUNT(*)
FROM productdescription
WHERE Description LIKE '%race%';
/* 5 */

/* Select the ID of the highest paid employee (HINT: employee pay history). */
SELECT EmployeeID
FROM employeepayhistory
ORDER BY Rate DESC
LIMIT 1;
/* 109 */

/* Select the number of job candidates who were hired (HINT: job candidates). */
SELECT COUNT(*)
FROM jobcandidate
WHERE EmployeeID IS NOT NULL;

SELECT COUNT(EmployeeID)
FROM jobcandidate;
/* 2 */

/* Select the count of types of frames available (HINT product sub categories). */
SELECT COUNT(*)
FROM productsubcategory
WHERE Name LIKE '%frame%';
/* 3 */

/* Select the 5 vendor IDs with the lowest average lead time, in numerical ID order if tied (HINT: product vendors). */
SELECT VendorID, MIN(AverageLeadTime)
FROM productvendor
GROUP BY VendorID
ORDER BY MIN(AverageLeadTime) ASC, VendorID ASC
LIMIT 5;
/*
2   15
4   15
8   15
12  15 
17  15
*/

