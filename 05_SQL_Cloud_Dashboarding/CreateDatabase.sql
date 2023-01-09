DROP DATABASE northwind;
CREATE DATABASE northwind;
\c northwind;


CREATE TABLE IF NOT EXISTS Categories
(      
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(25),
    Description VARCHAR(255),
    Picture bytea
);
TRUNCATE TABLE Categories ;

\copy Categories FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\categories.csv' DELIMITER ','  CSV HEADER;
select 'Categories complete';



CREATE TABLE  IF NOT EXISTS  Customers
(      
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    Address  VARCHAR(150),
    City VARCHAR(20),
    Region VARCHAR(20),
    PostalCode VARCHAR(10),
    Country VARCHAR(35),
    Phone VARCHAR(60),
    Fax VARCHAR(60)
);
--TRUNCATE TABLE Customers ;
\copy Customers FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\customers.csv' DELIMITER ','  CSV HEADER;
select 'Customers complete';


CREATE TABLE IF NOT EXISTS   Employees
(
    EmployeeID SERIAL PRIMARY KEY,
    LastName VARCHAR(35),
    FirstName VARCHAR(35),
    Title VARCHAR(40),
    TitleOfCourtesy VARCHAR(10),
    BirthDate date,
    HireDate date,
    Address VARCHAR(150),
    City VARCHAR(50),
    Region VARCHAR(10),
    PostalCode VARCHAR(20),
    Country VARCHAR(30),
    HomePhone  VARCHAR(60),
    Extension VARCHAR(15),
    Photo bytea ,
    Notes VARCHAR(1024),
    ReportsTo VARCHAR(10),
    Photopath VARCHAR(300)

);
--TRUNCATE TABLE Employees ;
\copy Employees FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\employees.csv' DELIMITER ','  CSV HEADER;
select 'employees complete';


CREATE TABLE  IF NOT EXISTS  Shippers(
    ShipperID SERIAL PRIMARY KEY,
    ShipperName VARCHAR(25),
    Phone VARCHAR(15)
);
--TRUNCATE TABLE Shippers ;
\copy Shippers FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\shippers.csv' DELIMITER ','  CSV HEADER;
select 'Shippers complete';


CREATE TABLE  IF NOT EXISTS  Suppliers(
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(200),
    ContactName VARCHAR(200),
    ContactTitle VARCHAR(100),
    Address VARCHAR(150),
    City VARCHAR(40),
    Region VARCHAR(30),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(35),
    Fax VARCHAR(35),
    HomePage VARCHAR(250)
);
--TRUNCATE TABLE Suppliers  ;
\copy Suppliers FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\suppliers.csv' DELIMITER ','  CSV HEADER;
select 'Suppliers complete';



CREATE TABLE IF NOT EXISTS Regions 
(
  RegionID            SERIAL primary key,
  RegionDescription   VARCHAR(50) NOT NULL
  --CONSTRAINT PK_Region PRIMARY KEY (RegionID)
);

--TRUNCATE TABLE Regions  CASCADE;
\copy Regions  FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\regions.csv' DELIMITER ','  CSV HEADER;
select 'Regions complete';

-----create foreign key tables-------------------------------------------------------


--create ""territories.csv           territories.csv

CREATE TABLE  IF NOT EXISTS  Territories(
    TerritoryID INTEGER PRIMARY KEY,
    TerritoryDescription VARCHAR(100),
    RegionID INTEGER,
    
    FOREIGN KEY (RegionID) REFERENCES Regions (RegionID)
);
--TRUNCATE TABLE Territories   ;
\copy Territories FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\territories.csv' DELIMITER ','  CSV HEADER;
select 'Territories complete';



CREATE TABLE  IF NOT EXISTS  Employee_Territories(
    EmployeeID SERIAL,
    TerritoryID INTEGER,
    PRIMARY KEY(EmployeeID, TerritoryID),
    
    FOREIGN KEY (TerritoryID) REFERENCES Territories (TerritoryID)
);
--TRUNCATE TABLE Employee_Territories   ;
\copy Employee_Territories FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\employee_territories.csv' DELIMITER ','  CSV HEADER;
select 'Employee_Territories complete';



CREATE TABLE  IF NOT EXISTS   Products(
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INTEGER,
    CategoryID INTEGER,
    UnitPrice NUMERIC(5, 2), 
    QuantityPerUnit VARCHAR(200),
    UnitsInStock INTEGER,
    UnitsOnOrder INTEGER,
    ReorderLevel INTEGER,
    Discontinued INTEGER,
	FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)  
);
--TRUNCATE TABLE Products ;
\copy Products FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\products.csv' DELIMITER ','  CSV HEADER;
select 'Products complete';


CREATE TABLE  IF NOT EXISTS   Orders(
    OrderID SERIAL PRIMARY KEY,
    CustomerID VARCHAR(40),
    EmployeeID INTEGER,
    OrderDate date, 
    RequiredDate     date,   
	ShippedDate date ,
    ShipVia	 INTEGER,
    Freight	NUMERIC(10,2),
    ShipperName VARCHAR(60),	
    ShipAddress VARCHAR(150),
    ShipCity VARCHAR(80),
    ShipRegion VARCHAR(40) ,
    ShipPostalCode VARCHAR(20)	,
    ShipCountry VARCHAR(80),

    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers (ShipperID )
);
--TRUNCATE TABLE Orders   ;

\copy Orders FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\orders.csv' DELIMITER ','  CSV HEADER;
select 'Orders complete';



CREATE TABLE  IF NOT EXISTS  OrderDetails(
    OrderDetailID SERIAL,
    OrderID INTEGER ,
    ProductID INTEGER,
    UnitPrice NUMERIC(5,2),
    Quantity INTEGER,
    Discount NUMERIC(5,2),
    PRIMARY KEY(OrderDetailID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
--TRUNCATE TABLE OrderDetails   ;
\copy OrderDetails FROM 'C:\Users\lisbo\OneDrive\AC Career\Spiced_Academy_DS\spiced_projects\cascabel-curve-student-code\cascabel-curve-student-code\week_05\data\order_details.csv' DELIMITER ','  CSV HEADER;
select 'Order Details complete';

--create "" employee_territories.csv           territories.csv







