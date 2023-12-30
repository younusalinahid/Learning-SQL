----learn sql----

--Introduction to SQL
--SQL stands for Structured Query Language
--SQL lets you access and manipulate databases
--SQL can execute queries against a database
--To use a server-side scripting language, like PHP or ASP
--RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, Oracle, MySQL, and Microsoft Access.
--RDBMS stands for Relational Database Management System.

--Select all records from the Customers table:
SELECT * FROM Customers;
SELECT CustomerName, City FROM Customers;
--Syntax
SELECT column1, column2, ...
FROM table_nam


--Select all the different countries from the "Customers" table:
SELECT DISTINCT Country FROM Customers;
--Syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;


--WHERE for using condition
SELECT * FROM Customers
WHERE CustomerID=1;
--Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition;


--ORDER BY keyword is used to sort the result-set in ascending or descending order.
SELECT * FROM Products
ORDER BY Price DESC;
--Syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;


--The SQL AND Operator
SELECT * FROM Customers
WHERE Country = 'Spain' AND CustomerName LIKE 'G%';
--Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;


--The SQL OR Operator
SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';
--Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;


--The NOT Operator
SELECT * FROM Customers
WHERE NOT Country = 'Spain';
--Syntax
SELECT column1, column2, ...
    FROM table_name
WHERE NOT condition;


--The INSERT INTO statement is used to insert new records in a table.
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);


--IS NULL Syntax
SELECT column_names
FROM table_name
WHERE column_name IS NULL;


--The SQL UPDATE Statement
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
--Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;


--SQL DELETE Statement
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
--Syntax
DELETE FROM table_name WHERE condition;


--The SQL SELECT TOP Clause
SELECT TOP 3 * FROM Customers;
--Syntax
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;


--The SQL MIN() and MAX() Functions
SELECT MIN/MAX(Price)
FROM Products;
--Syntax
SELECT MIN/MAX(column_name)
FROM table_name
WHERE condition;


--The SQL COUNT() Function
SELECT COUNT(*)
FROM Products;
--Syntax
SELECT COUNT(column_name)
FROM table_name
WHERE condition;


--The SQL SUM() Function
SELECT SUM(Quantity)
FROM OrderDetails;
--Syntax
SELECT SUM(column_name)
FROM table_name
WHERE condition;


--The SQL AVG() Function
SELECT AVG(Price)
FROM Products;
--Syntax
SELECT AVG(column_name)
FROM table_name
WHERE condition;


--The SQL LIKE Operator
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';
--Syntax
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;


--SQL Wildcard Characters
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';
--  %, __, [], ^, -, {};


--The SQL IN Operator
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
--Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);


--The SQL BETWEEN Operator
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
--Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;


--SQL Aliases
SELECT CustomerID AS ID
FROM Customers;
--Syntax
SELECT column_name AS alias_name
FROM table_name;


--SQL INNER JOIN
SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
--Syntax
SELECT column_name(s) FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;


--SQL LEFT JOIN
SELECT Customers.CustomerName, Orders.OrderID FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
--Syntax
SELECT column_name(s)
FROM table1 LEFT JOIN table2
ON table1.column_name = table2.column_name;


--SQL RIGHT JOIN
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
--Syntax
SELECT column_name(s) FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;


--SQL FULL OUTER JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
--Syntax
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;


--SQL Self Join
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
--Syntax
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;


--The SQL UNION Operator
--The UNION operator is used to combine the result-set of two or more SELECT statements.
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;
--UNION Syntax
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;


--The SQL GROUP BY Statement
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
--Syntax
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);


--The SQL HAVING Clause
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
--Syntax
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);


--The SQL EXISTS Operator
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products
WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);
--EXISTS Syntax
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);


--The SQL ANY Operator
SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID
FROM OrderDetails WHERE Quantity = 10);
--ANY Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);
--The SQL ALL Operator
SELECT ProductName
FROM Products
WHERE ProductID = ALL
      (SELECT ProductID
       FROM OrderDetails
       WHERE Quantity = 10);
--ALL Syntax
SELECT ALL column_name(s)
FROM table_name
WHERE condition;


--The SQL SELECT INTO Statement
--The SELECT INTO statement copies data from one table into a new table.
SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;
--Syntax
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;


--SQL INSERT INTO SELECT
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;
--Syntax
INSERT INTO table2
SELECT * FROM table1
WHERE condition;


--The SQL CASE Expression
SELECT OrderID, Quantity,
       CASE
           WHEN Quantity > 30 THEN 'The quantity is greater than 30'
           WHEN Quantity = 30 THEN 'The quantity is 30'
           ELSE 'The quantity is under 30'
           END AS QuantityText
FROM OrderDetails;
--CASE Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;


--SQL NULL Functions
--SQL NULL functions are used to perform operations on NULL values that are stored in the database tables.
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products;


--SQL Stored Procedures for SQL Server
CREATE PROCEDURE SelectAllCustomers
    AS
SELECT * FROM Customers
    GO;
--Syntax
CREATE PROCEDURE procedure_name
    AS
sql_statement
GO;


------SQL DATABASE--------

--SQL CREATE DATABASE Statement
--The CREATE DATABASE statement is used to create a new SQL database.
CREATE DATABASE databasename;


--The DROP DATABASE statement is used to drop an existing SQL database.
DROP DATABASE databasename;


--The SQL BACKUP DATABASE Statement
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;
--Syntax
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;


--The SQL CREATE TABLE Statement
CREATE TABLE Persons (
        PersonID int,
        LastName varchar(255),
        FirstName varchar(255),
        Address varchar(255),
        City varchar(255)
);
--Syntax
CREATE TABLE table_name (
                            column1 datatype,
                            column2 datatype,
                            column3 datatype,
    ....
);


--The SQL DROP TABLE Statement
DROP TABLE table_name;


--SQL ALTER TABLE Statement
--ALTER TABLE - ADD Column, DROP COLUMN, RENAME COLUMN,  ALTER/MODIFY DATATYPE
ALTER TABLE Customers
    ADD Email varchar(255);
--Syntax
ALTER TABLE table_name
    ADD column_name datatype;


--SQL Create Constraints
CREATE TABLE table_name (
                            column1 datatype constraint,
                            column2 datatype constraint,
                            column3 datatype constraint,
    ....
);


--SQL NOT NULL Constraint
CREATE TABLE Persons (
                         ID int NOT NULL,
                         LastName varchar(255) NOT NULL,
                         FirstName varchar(255) NOT NULL,
                         Age int
);


--SQL UNIQUE Constraint
--The UNIQUE constraint ensures that all values in a column are different.
CREATE TABLE Persons (
                         ID int NOT NULL,
                         LastName varchar(255) NOT NULL,
                         FirstName varchar(255),
                         Age int,
                         UNIQUE (ID)
);


--SQL PRIMARY KEY Constraint
The PRIMARY KEY constraint uniquely identifies each record in a table.
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);


--SQL FOREIGN KEY Constraint
CREATE TABLE Orders (
                        OrderID int NOT NULL,
                        OrderNumber int NOT NULL,
                        PersonID int,
                        PRIMARY KEY (OrderID),
                        FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);


--SQL CHECK Constraint
CREATE TABLE Persons (
                         ID int NOT NULL,
                         LastName varchar(255) NOT NULL,
                         FirstName varchar(255),
                         Age int,
                         CHECK (Age>=18)
);


--SQL DEFAULT on CREATE TABLE
--The default value will be added to all new records, if no other value is specified.
CREATE TABLE Persons (
                         ID int NOT NULL,
                         LastName varchar(255) NOT NULL,
                         FirstName varchar(255),
                         Age int,
                         City varchar(255) DEFAULT 'Sandnes'
);


--SQL CREATE INDEX Statement
CREATE INDEX index_name
ON table_name (column1, column2, ...);


--SQL AUTO INCREMENT
--Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
CREATE TABLE Persons (
                         Personid int NOT NULL AUTO_INCREMENT,
                         LastName varchar(255) NOT NULL,
                         FirstName varchar(255),
                         Age int,
                         PRIMARY KEY (Personid)
);


--SQL Working With Dates
DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY


--SQL CREATE VIEW Statement
--You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.
CREATE VIEW view_name AS
SELECT column1, column2, ...
        FROM table_name
        WHERE condition;


--SQL Injection
--SQL injection is a code injection technique that might destroy your database.
SELECT UserId, Name, Password FROM Users WHERE UserId = 105 or 1=1;