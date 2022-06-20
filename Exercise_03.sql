/*
Show how many items are on each sales order (HINT: salesorderheader > salesorderdetail).
*/
SELECT salesorderheader.SalesOrderID, COUNT(SalesOrderDetailID) 
    FROM salesorderheader
    INNER JOIN salesorderdetail on salesorderheader.SalesOrderID=salesorderdetail.SalesOrderID
GROUP BY salesorderheader.SalesOrderID
ORDER BY salesorderheader.SalesOrderID;

/*
Show the product name with each review (HINT: productreview > product).
*/
SELECT ProductReviewID, product.ProductID, Name, ReviewerName, ReviewDate, EmailAddress, Rating, Comments
    FROM productreview
    INNER JOIN product on productreview.ProductID=product.ProductID;

/*
Show the current department of each successful hire (HINT: jobcandidate > employee > employeedepartmenthistory > department).
*/
SELECT JobCandidateID, employee.LoginID, employee.Title, employeedepartmenthistory.StartDate, department.Name 
    FROM jobcandidate
    INNER JOIN employee on jobcandidate.EmployeeID=employee.EmployeeID
    INNER JOIN employeedepartmenthistory on employee.EmployeeID=employeedepartmenthistory.EmployeeID
    INNER JOIN department on employeedepartmenthistory.DepartmentID=department.DepartmentID; 

SELECT JobCandidateID, department.Name 
    FROM jobcandidate
    INNER JOIN employeedepartmenthistory on jobcandidate.EmployeeID=employeedepartmenthistory.EmployeeID
    INNER JOIN department on employeedepartmenthistory.DepartmentID=department.DepartmentID; 

/*
Show how many active (not discontinued) products belong to each category (HINT: productcategory > productsubcategory > product).
*/
SELECT productcategory.ProductCategoryID, productcategory.Name, COUNT(ProductID)
    FROM productcategory
    INNER JOIN productsubcategory on productcategory.ProductCategoryID=productsubcategory.ProductCategoryID
    INNER JOIN product on productsubcategory.ProductSubcategoryID=product.ProductSubcategoryID
WHERE product.DiscontinuedDate IS NULL
GROUP BY productcategory.ProductCategoryID, productcategory.Name;

/*
Show all employees who do not reside in the United States (HINT: employee > employeeaddress > address > stateprovince > countryregion).
*/
SELECT employee.EmployeeID, employee.LoginID, countryregion.CountryRegionCode
    FROM employee
    INNER JOIN employeeaddress ON employee.EmployeeID=employeeaddress.EmployeeID
    INNER JOIN address on employeeaddress.AddressID=address.AddressID
    INNER JOIN stateprovince on address.StateProvinceID=stateprovince.StateProvinceID
    INNER JOIN countryregion on stateprovince.CountryRegionCode=countryregion.CountryRegionCode
WHERE countryregion.CountryRegionCode != 'US';