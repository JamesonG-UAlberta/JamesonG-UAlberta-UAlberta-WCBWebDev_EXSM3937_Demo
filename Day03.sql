SELECT CustomerID, AccountNumber, CountryRegionCode
FROM customer INNER JOIN salesterritory ON customer.TerritoryID = salesterritory.TerritoryID;
/* Combines data from two tables into one output. INNER JOIN displays only rows that have data on both sides. Any NULLs will be omitted. */

SELECT customer.CustomerID, AddressLine1, City, PostalCode, CountryRegionCode
FROM customer 
    INNER JOIN salesterritory ON customer.TerritoryID = salesterritory.TerritoryID
    INNER JOIN customeraddress ON customer.CustomerID = customeraddress.CustomerID
    INNER JOIN address on customeraddress.AddressID = address.AddressID;
/* Multiple table inner join. */


SELECT contact.ContactID, CardType
FROM contact
    INNER JOIN contactcreditcard on contact.ContactID = contactcreditcard.ContactID
    INNER JOIN creditcard on contactcreditcard.CreditCardID = creditcard.CreditCardID;
/* Does not include ContactID 1 because they do not have a credit card on file. */

SELECT contact.ContactID, CardType
FROM contact
    LEFT JOIN contactcreditcard on contact.ContactID = contactcreditcard.ContactID
    LEFT JOIN creditcard on contactcreditcard.CreditCardID = creditcard.CreditCardID;
/* Includes ContactID 1 with a NULL card type because the contact table is the "LEFT" of a LEFT JOIN.

