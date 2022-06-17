CREATE DATABASE exercise_01;

DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Clients;

CREATE TABLE Clients (
    ID int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(30),
    Address varchar(40),
    PhoneNumber char(12)
);
CREATE TABLE Orders (
    Number int PRIMARY KEY AUTO_INCREMENT,
    ClientID int REFERENCES Clients(ID),
    OrderQty int,
    OrderDate date
);

INSERT INTO Clients (Name, Address, PhoneNumber)
VALUES
('Jane Smith', '123 Main Street', '123-456-7890');

INSERT INTO Orders (ClientID, OrderQty, OrderDate)
VALUES
(1, 11, 2023-06-02);

UPDATE Orders
SET OrderQty = 1
WHERE Number = 1;

DELETE FROM Orders
WHERE Number = 1;

