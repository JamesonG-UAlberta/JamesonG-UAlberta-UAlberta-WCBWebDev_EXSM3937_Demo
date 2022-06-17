SELECT currencyfrom.Name AS 'FromCurrency', currencyto.Name AS 'ToCurrency', currencyrate.AverageRate FROM currencyrate
	INNER JOIN currency as currencyfrom on currencyrate.FromCurrencyCode=currencyfrom.CurrencyCode
    INNER JOIN currency as currencyto on currencyrate.ToCurrencyCode=currencyto.CurrencyCode
WHERE currencyrate.CurrencyRateDate = '2001-07-01' AND currencyrate.FromCurrencyCode = 'USD' AND currencyrate.ToCurrencyCode = 'JPY';

SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS FullName FROM contact
	INNER JOIN employee on employee.ContactID=contact.ContactID
WHERE ManagerID IS NULL;