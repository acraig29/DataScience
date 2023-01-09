--Projec 5 Dashboard Queries for the northwind database

--1.Get a list of current products (Product ID and name).
SELECT Distinct productid,productname
FROM public.products
ORDER BY productname ASC;


--2.Get a list of the most and least expensive products (name and unit price).

SELECT productid,productname, unitprice
FROM public.products
ORDER BY productname ASC;



--3.Get products that cost less than $20.

SELECT Distinct productid,productname, unitprice
FROM public.products
Where unitprice < 20
ORDER BY unitprice DESC;


--4.Get products that cost between $15 and $25.

SELECT Distinct productid,productname, unitprice
FROM public.products
Where  unitprice BETWEEN 15 AND 25
ORDER BY unitprice DESC;

--5.Get products above average price.

--Select AVG(unitprice) FROM public.products

SELECT Distinct productid,productname, unitprice
FROM public.products
Where  unitprice > (Select AVG(unitprice) FROM public.products)
ORDER BY unitprice DESC;


--6.Find the ten most expensive products.
SELECT Distinct productid,productname, unitprice,
DENSE_RANK() OVER ( ORDER BY unitprice DESC) as rank
FROM public.products
ORDER BY unitprice DESC fetch first 10 rows only;



--7.Get a list of discontinued products (Product ID and name).
SELECT  productid,productname
FROM public.products
WHERE discontinued = 1
ORDER BY productname ASC;


--8.Count current and discontinued products.

select Discontinued_Count, Current_Count
  from (SELECT  1 as Join_ID, COUNT(productid) as Discontinued_Count
FROM public.products
WHERE discontinued = 1) dis
inner join (SELECT  1 as Join_ID, COUNT(productid) as Current_Count
FROM public.products
WHERE discontinued = 0) cur
  on (dis.Join_ID = cur.Join_ID );
  
--9.Find products with less units in stock than the quantity on order.

SELECT  productid,productname,unitsinstock,  unitsonorder
FROM public.products
WHERE unitsinstock  < unitsonorder
ORDER BY productname ASC;

--10.Find the customer who had the highest order amount

SELECT cust.customerid ,cust.customername, ord.orderid, ord_d.orderdetailid,
ord_d.productid,ord_d.unitprice,ord_d.quantity,ord_d.discount,
(ord_d.unitprice * ord_d.quantity)  - ((ord_d.unitprice * ord_d.quantity )* ord_d.discount )
as Amount

FROM  public.customers  cust  
INNER JOIN public.orders ord on cust.customerid = ord.customerid
INNER JOIN public.orderdetails ord_d on ord.orderid = ord_d.orderid
ORDER BY Amount DESC fetch first 1 rows only;

--Select * from  public.orders Limit 20;
--11.Get orders for a given employee and the according customer


--DECLARE cust_id VARCHAR(200)

set myvar foo 
SELECT customerid FROM public.customers WHERE customerid = :foo


SELECT cust.customerid ,cust.customername, ord.orderid, ord_d.orderdetailid,
ord_d.productid,ord_d.unitprice,ord_d.quantity,ord_d.discount,
(ord_d.unitprice * ord_d.quantity)  - ((ord_d.unitprice * ord_d.quantity )* ord_d.discount )
as Amount
FROM  public.customers  cust  
INNER JOIN public.orders ord on cust.customerid = ord.customerid
INNER JOIN public.orderdetails ord_d on ord.orderid = ord_d.orderid
WHERE cust.customerid = :foo
ORDER BY Amount DESC fetch first 1 rows only;

--SELECT DISTINCT customerid FROM public.customers;


--12.Find the hiring age of each employee based on a given customer

--Projec 5 Dashboard Queries for the northwind database

--1.Get a list of current products (Product ID and name).
SELECT Distinct productid,productname
FROM public.products
ORDER BY productname ASC;


--2.Get a list of the most and least expensive products (name and unit price).

SELECT productid,productname, unitprice
FROM public.products
ORDER BY productname ASC;



--3.Get products that cost less than $20.

SELECT Distinct productid,productname, unitprice
FROM public.products
Where unitprice < 20
ORDER BY unitprice DESC;


--4.Get products that cost between $15 and $25.

SELECT Distinct productid,productname, unitprice
FROM public.products
Where  unitprice BETWEEN 15 AND 25
ORDER BY unitprice DESC;

--5.Get products above average price.

--Select AVG(unitprice) FROM public.products

SELECT Distinct productid,productname, unitprice
FROM public.products
Where  unitprice > (Select AVG(unitprice) FROM public.products)
ORDER BY unitprice DESC;


--6.Find the ten most expensive products.
SELECT Distinct productid,productname, unitprice,
DENSE_RANK() OVER ( ORDER BY unitprice DESC) as rank
FROM public.products
ORDER BY unitprice DESC fetch first 10 rows only;



--7.Get a list of discontinued products (Product ID and name).
SELECT  productid,productname
FROM public.products
WHERE discontinued = 1
ORDER BY productname ASC;


--8.Count current and discontinued products.

select Discontinued_Count, Current_Count
  from (SELECT  1 as Join_ID, COUNT(productid) as Discontinued_Count
FROM public.products
WHERE discontinued = 1) dis
inner join (SELECT  1 as Join_ID, COUNT(productid) as Current_Count
FROM public.products
WHERE discontinued = 0) cur
  on (dis.Join_ID = cur.Join_ID );
  
--9.Find products with less units in stock than the quantity on order.

SELECT  productid,productname,unitsinstock,  unitsonorder
FROM public.products
WHERE unitsinstock  < unitsonorder
ORDER BY productname ASC;

--10.Find the customer who had the highest order amount

SELECT cust.customerid ,cust.customername, ord.orderid, ord_d.orderdetailid,
ord_d.productid,ord_d.unitprice,ord_d.quantity,ord_d.discount
FROM  public.customers  cust  
INNER JOIN public.orders ord on cust.customerid = ord.customerid
INNER JOIN public.orderdetails ord_d on ord.orderid = ord_d.orderid



;

--Select * from  public.orders Limit 20;
--11.Get orders for a given employee and the according Customer

--use command line to ask for the Customer Id;
--\prompt 'enter abc here: ' x
--select ('abc' = :'x') as is_abc \gset
--\if :is_abc
--  \echo you can read
--\else
--  \echo you are illiterate or impertinent
--\endif



SELECT  productid,productname,unitsinstock,  unitsonorder
FROM public.products
WHERE unitsinstock  < unitsonorder
ORDER BY productname ASC;

--10.Find the customer who had the highest order amount

SELECT cust.customerid ,cust.customername, ord.orderid, ord_d.orderdetailid,
ord_d.productid,ord_d.unitprice,ord_d.quantity,ord_d.discount
FROM  public.customers  cust  
INNER JOIN public.orders ord on cust.customerid = ord.customerid
INNER JOIN public.orderdetails ord_d on ord.orderid = ord_d.orderid
WHERE  cust.customerid   = :'x'




--12.Find the hiring age of each employee



--Create views and/or named queries for some of these queries




--Create views and/or named queries for some of these queries








