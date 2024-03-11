 /*--a. Get all the details from the person table including email ID, phone
number and phone number type
b. Get the details of the sales header order made in May 2011
c. Get the details of the sales details order made in the month of May
2011
d. Get the total sales made in May 2011
e. Get the total sales made in the year 2011 by month order by
increasing sales
f. GET DETAILS FROM PERSON TABLE WHERE FirstName starts with 'G' */
------------------------------------------------------------------------------------------------------
/*a. Get all the details from the person table including email ID, phone
number and phone number type*/

Select * from Person.PhoneNumberType
Select * from Person.PersonPhone
Select * from person.Person
select * from person.EmailAddress

Select * from person.ContactType

Select F.FirstName,F.LastName,F.BusinessEntityID,A.EmailAddress,B.PhoneNumber,C.PhoneNumberTypeID,C.Name 
from person.Person as F
Inner join 
person.EmailAddress as A 
on F.BusinessEntityID=A.BusinessEntityID 
INNER JOIN 
Person.PersonPhone as B
ON F.BusinessEntityID=B.BusinessEntityID 
INNER JOIN 
Person.PhoneNumberType AS C
ON B.PhoneNumberTypeID=C.PhoneNumberTypeID

ORDER BY FirstName, LastName

--b. Get the details of the sales header order made in May 2011--

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 05

--C.--Get the details of the sales details order made in the month of May 2011--

SELECT A.*,B.OrderDate FROM [Sales].[SalesOrderDetail] AS A 
INNER JOIN 
[Sales].[SalesOrderHeader] AS B ON A.SalesOrderID=B.SalesOrderID
where  YEAR(B.OrderDate) = 2011 AND MONTH(B.OrderDate) = 05
ORDER BY SalesOrderID DESC

--Get the total sales made in May 2011--

SELECT sum(a.linetotal) Total_sales FROM 
[Sales].[SalesOrderDetail] AS A 
INNER JOIN 
[Sales].[SalesOrderHeader] AS B
ON 
A.SalesOrderID=B.SalesOrderID
WHERE YEAR(B.OrderDate) = 2011 AND MONTH(B.OrderDate) = 05

--E. Get the total sales made in the year 2011 by month order by increasing sales

SELECT SUM(a.linetotal) Total_sales , MONTH (B.ORDERDATE) as orderdate FROM 
[Sales].[SalesOrderDetail] AS A 
INNER JOIN 
[Sales].[SalesOrderHeader] AS B
ON 
A.SalesOrderID=B.SalesOrderID
WHERE YEAR(B.OrderDate) = 2011 

group by MONTH (B.ORDERDATE)
order by Total_sales

--GET DETAILS FROM PERSON TABLE WHERE FirstName starts with 'G'

select * from person.person 
where firstname like 'G%'

