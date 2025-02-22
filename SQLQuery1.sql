-- Create the database
CREATE DATABASE RetailStoreDB;

USE RetailStoreDB;


CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) ,
    RegistrationDate DATE
);


CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);
GO

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Insert sample data into Customers
INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('John', 'Doe', 'john.doe@example.com', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2023-03-22'),
('Michael', 'Brown', 'michael.brown@example.com', '2023-06-10'),
('Emily', 'Davis', 'emily.davis@example.com', '2023-09-05'),
('Chris', 'Wilson', 'chris.wilson@example.com', '2023-11-12');

insert into Customers values('salah', 'Brown', 'salah.brown@example.com', '2021-06-10');

-- Insert sample data into Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 999.99, 10),
('Phone', 'Electronics', 699.99, 20),
('Headphones', 'Accessories', 199.99, 30),
('Monitor', 'Electronics', 299.99, 15),
('Keyboard', 'Accessories', 49.99, 25);


-- Insert sample data into Orders
INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, '2024-01-10', 1),
(2, 3, '2024-01-12', 2),
(3, 2, '2024-01-15', 1),
(4, 5, '2024-01-18', 3),
(5, 4, '2024-01-20', 1);
GO

-- Query all records from each table
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
GO

-- Show customers who registered after a specific date
select* from Customers where RegistrationDate> '2023-07-01';
GO

-- Select the top 3 most expensive products

select top 4 * from Products order by Price desc;


-- Join tables to display orders with customer names and product details
SELECT O.OrderID, C.FirstName, C.LastName, P.ProductName, O.OrderDate, O.Quantity
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Products P ON O.ProductID = P.ProductID;


-- Calculate the total amount spent by each customer
SELECT C.FirstName, C.LastName, SUM(P.Price * O.Quantity) AS TotalSpent
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY C.CustomerID, C.FirstName, C.LastName;
GO

-- Find the number of orders placed by each customer
SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS OrderCount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;
GO

-- Find total sales for each product
SELECT P.ProductName, SUM(O.Quantity) AS TotalSales
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName;