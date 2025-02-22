
/* Question Set-1 */

/* Q1:- Fetch the employee number, first name and last name of those employees who are working as Sales Rep reporting to employee with employeenumber 1102 (Refer employee table) */

select * from employees;
select employeeNumber,firstName,lastName from employees where jobTitle = "Sales Rep" AND reportsTo = 1102;

/* Q2:- Show the unique productline values containing the word cars at the end from the products table. */

select * from productlines;
select productLine from productlines where productLine like "%Cars";

/*  Question Set-2 */

/*Q1:- Using a CASE statement, segment customers into three categories based on their country:(Refer Customers table)
                        "North America" for customers from USA or Canada
                        "Europe" for customers from UK, France, or Germany
                        "Other" for all remaining countries
     Select the customerNumber, customerName, and the assigned region as "CustomerSegment".
                                                                                            */
select customerNumber,customerName,country, case
when country = "USA"then "North America"
when country = "Canada" then "North America"
when country = "UK"then "Europe" 
when country = "France" then "Europe"
when country =  "Germany" then "Europe"
else "Other" end as Country from customers;


/*Question Set-3 */

/*Q1:- Using the OrderDetails table, identify the top 10 products (by productCode) with the highest total order quantity across all orders.*/

select * from orderdetails;
with sample as
(select productCode, sum(quantityOrdered) as Quantity_Order from orderdetails group by productCode) select * from sample order by Quantity_Order desc limit 10;

/*Q2:- Company wants to analyse payment frequency by month. Extract the month name from the payment date to count the total number of payments for each month and include only those months with a payment count exceeding 20. Sort the results by total number of payments in descending order.  (Refer Payments table). */

create table sample2 as select monthname(paymentDate) as Month_name from payments;
with sampl3 as
(select month_name,count(month_name) as num_payments from sample2 group by month_name) select * from sampl3 where num_payments > 20 order by num_payments desc;


/*Question Set-4  CONSTRAINTS: Primary, key, foreign key, Unique, check, not null, default*/

/*Q1:- Create a table named Customers to store customer information. Include the following columns:

customer_id: This should be an integer set as the PRIMARY KEY and AUTO_INCREMENT.
first_name: This should be a VARCHAR(50) to store the customer's first name.
last_name: This should be a VARCHAR(50) to store the customer's last name.
email: This should be a VARCHAR(255) set as UNIQUE to ensure no duplicate email addresses exist.
phone_number: This can be a VARCHAR(20) to allow for different phone number formats.

Add a NOT NULL constraint to the first_name and last_name columns to ensure they always have a value
*/


create table customers(customers_id int primary key auto_increment,first_name varchar(50) not null,last_name varchar(50) not null,email varchar(255) unique, phone_number varchar(20) unique);



/*Q2:-	Create a table named Orders to store information about customer orders. Include the following columns:

    	order_id: This should be an integer set as the PRIMARY KEY and AUTO_INCREMENT.
customer_id: This should be an integer referencing the customer_id in the Customers table  (FOREIGN KEY).
order_date: This should be a DATE data type to store the order date.
total_amount: This should be a DECIMAL(10,2) to store the total order amount.
     	
Constraints:
a)	Set a FOREIGN KEY constraint on customer_id to reference the Customers table.
b)	Add a CHECK constraint to ensure the total_amount is always a positive value.

*/

create table Orders(order_id int primary key auto_increment,Order_Date date, total_amount decimal(10,2) check(total_amount > 0),customers_id int, foreign key (customers_id) references customers(customers_id) on update cascade on delete cascade);


/*Question Set-5 JOINS*/

/*Q1:-  . List the top 5 countries (by order count) that Classic Models ships to. (Use the Customers and Orders tables)*/

with sample4 as
((select c.country as Country, count(o.status) as Order_Count from customers C left join orders o on c.customerNumber = o.customerNumber group by c.country)
union 
(select c.country as Country, count(o.status) as Order_Count from customers C right join orders o on c.customerNumber = o.customerNumber group by c.country)) select * from sample4 order by order_count desc limit 5;

/*Question Set-6 SELF JOIN*/

/*Q1:- . Create a table project with below fields.


●	EmployeeID : integer set as the PRIMARY KEY and AUTO_INCREMENT.
●	FullName: varchar(50) with no null values
●	Gender : Values should be only ‘Male’  or ‘Female’
●	ManagerID: integer 
*/

create table project(EmployeeID int  primary key auto_increment, FullName varchar(50), Gender enum("Male","Female"), ManegerID int);

insert into project(FullName,Gender,ManegerID) values("Pranaya",1,3);
insert into project(FullName,Gender,ManegerID) values("Priyanka","Female",1);
insert into project(FullName,Gender) values("Preety","Female");
insert into project(FullName,Gender,ManegerID) values("Anurag","Male",1),("Sambit","Male",1),("Rajesh","Male",3),("Hina","Female",3);
select * from project;

select E.fullname as Manager_Name,M.fullname as Employee_Name from project M inner join project E on E.employeeid = M.ManegerID;


/*Question Set-7 . DDL Commands: Create, Alter, Rename*/

/*Q1:- Create table facility. Add the below fields into it.
●	Facility_ID
●	Name
●	State
●	Country

i) Alter the table by adding the primary key and auto increment to Facility_ID column.
ii) Add a new column city after name with data type as varchar which should not accept any null values.
*/

create table facility(Facility_ID int primary key auto_increment,Name varchar(100),City varchar(100) not null, State varchar(100),Country varchar(100));
desc facility;


/*Question Set-8 Views in SQL*/

/*Q1:- Create a view named product_category_sales that provides insights into sales performance by product category. This view should include the following information:
productLine: The category name of the product (from the ProductLines table).

total_sales: The total revenue generated by products within that category (calculated by summing the orderDetails.quantity * orderDetails.priceEach for each product in the category).

number_of_orders: The total number of orders containing products from that category.
*/

create view sample1 as select pl.productline as Product_line,sum(od.quantityOrdered*od.priceEach) as Total_Sales, count(distinct od.orderNumber) as Number_of_order from productlines pl inner join products pr on pr.productLine = pl.productLine inner join orderdetails od on od.productCode = pr.productCode inner join orders ore on ore.orderNumber = od.orderNumber group by pl.productline;
select * from sample1;

/*Question Set-9 Stored Procedures in SQL with parameters*/

/*Q1:- a. Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output. Format the total amount to nearest thousand unit (K)
Tables: Customers, Payments
*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `Country_payment`(in year_date_in int,in country_in varchar(50))
BEGIN
select year(py.paymentDate) as Year_date,c.country as Country, concat(round(sum(py.amount) / 1000,0),"k") as Total from customers c inner join payments py on py.customerNumber = c.customerNumber where year(py.paymentDate) = year_date_in AND c.country = country_in group by year(py.paymentDate);
END
call Country_payment(2003,"France");

/*Question Set-10 Window functions - Rank, dense_rank, lead and lag*/

/*Q1:- Using customers and orders tables, rank the customers based on their order frequency*/
select cu.customerName as CustomerName, count(od.orderNumber) as Order_Count, dense_rank() over(order by count(od.orderNumber) desc) as Order_frequen_rnk from customers cu inner join orders od on cu.customerNumber = od.customerNumber group by  cu.customerName order by count(od.orderNumber) desc;

/*Q2:- Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. Format the YoY values in no decimals and show in % sign.
Table: Orders
*/
with sample as
(select year(orderDate) as Year_Date,monthname(orderDate) as Month_Name,count(orderNumber) as Total_Orders,lag(count(orderNumber),1) over() as Previous_Order from orders group by  year(orderDate),monthname(orderDate)) select year_Date,Month_Name,Total_orders,concat(round((total_orders - Previous_order)/Previous_order*100),"%") as YOY_Change from sample;

/*Question Set-11 Subqueries and their applications*/

/*Q1:- Find out how many product lines are there for which the buy price value is greater than the average of buy price value. Show the output as product line and its count*/
with sample as
(select productLine,buyprice from products where buyPrice > (select avg(buyPrice) from products)) select productLine,count(buyprice) as Total from sample group by productLine;


/*Question Set-12 ERROR HANDLING in SQL*/

/*Q1:- Create the table Emp_EH. Below are its fields.
●	EmpID (Primary Key)
●	EmpName
●	EmailAddress
Create a procedure to accept the values for the columns in Emp_EH. Handle the error using exception handling concept. Show the message as “Error occurred” in case of anything wrong.
*/
BEGIN
declare continue handler for sqlexception
begin
 select "Error Occurred" as Result;
End;
 insert into emp_eh values(empid,empname,email);
END
create table Emp_EH(EMPID int primary key,EmpName varchar(50),EmailAddress varchar(50));
call error_handler(1,"Rahul","rahul@123.com");
call error_handler(null,"Sitanshu","sitanshu123@gmail.com");
select * from emp_eh;

/*Question Set-13 TRIGGERS*/

/*Q1:- Create the table Emp_BIT. Add below fields in it.
●	Name
●	Occupation
●	Working_date
●	Working_hours

Insert the data as shown in below query.
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  
 
Create before insert trigger to make sure any new value of Working_hours, if it is negative, then it should be inserted as positive.
*/


if new.Working_Hour < 0 then
set new.Working_Hour = -(new.Working_Hour);
end if;
create table Emp_BIT(Name Varchar(50), Occupation varchar(50), Working_Date Date,Working_Hour int);

insert into Emp_BIT values("Robin","Scientist","2020-10,04",12),
("Warner","Engineer","2020-10-04",10),
("Peter","Actor","2020-10-04",-13),
("Marco","Doctor","2020-10-04",14),
("Brayden","Teacher","2020-10-04",12),
("Antonio","Business","2020-10-04",-11);
select * from emp_bit;