create database Assignment3
use Assignment3

--1. book with author name ending with er

create table book(
id int primary key identity,
title varchar(20),
author varchar(50),
isbn numeric(12) unique,
published_date datetime
)

insert into book values('My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17')
insert into book values('My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45')
insert into book values('My Third SQL book','Cary Fint',523120967812,'2015-10-18 14:05:44')

select * from book

select * from book where author like '%er'

--2.Review

create table review(
id int primary key identity,
book_id int foreign key references book(id),
reviewer_name varchar(50),
content varchar(80),
rating int,
published_date datetime
)

insert into review values(1,'John Smith','My first review',4,'2017-12-10 05:50:11')
insert into review values(2,'John Smith','My second review',5,'2017-10-13 15:05:12')
insert into review values(2,'Alice Walker','Another review',1,'2017-10-22 23:47:10')

select * from review

select title,author,reviewer_name from book join review on book.id=review.id 

--3. Display the reviewer name who reviewed more than one book
select reviewer_name from review group by reviewer_name having count(reviewer_name)>1 

--4.customers with o in the address

create table customers(
id int primary key identity,
name varchar(50),
age int,
address varchar(50),
salary float
)

insert into customers values ('Ramesh',32,'Ahmedabad',2000)
insert into customers values ('Khilan',25,'Delhi',1500)
insert into customers values ('Kaushik',23,'Kota',2000)
insert into customers values ('Chaitali',25,'Mumbai',6500)
insert into customers values ('Hardik',27,'Bhopal',8500)
insert into customers values ('Komal',22,'MP',4500)
insert into customers values ('Muffy',24,'Indore',10000)

select * from customers

select name from customers where address like'%o%'

--5.orders on same date

create table orders(
oid int primary key,
date datetime,
customer_id int  foreign key references customers(id),
amount int)

insert into orders values (102 ,'2009-10-08',3,3000)
insert into orders values (100 ,'2009-10-08',3,1500)
insert into orders values (101 ,'2009-11-20',2,1560)
insert into orders values (103 ,'2008-05-20',4,2060)
select * from orders

select date,count(customer_id) as 'Total customers' from orders group by date having count(date)>1

--6. Employee whose salary is null

create table employee(
id int primary key identity,
name varchar(50),
age int,
address varchar(50),
salary int
)

insert into employee values ('Ramesh',32,'Ahmedabad',2000)
insert into employee values ('Khilan',25,'Delhi',1500)
insert into employee values ('Kaushik',23,'Kota',2000)
insert into employee values ('Chaitali',25,'Mumbai',6500)
insert into employee values ('Hardik',27,'Bhopal',8500)
insert into employee values ('Komal',22,'MP',null)
insert into employee values ('Muffy',24,'Indore',null)
 select * from employee

 select name from employee where salary is null

 --7 Studentdetails

 create table studentdetails(
 id int primary key,
 registerNo int,
 name varchar(30),
 age int,
 qualification varchar(10),
 mobileno numeric(10),
 mail_Id varchar(20),
 location varchar(30),
 gender char
 )

 insert into studentdetails values(1,2,'Sai',22,'B.E','9952836777','Sai@gmail.com','Chennai','M')
 insert into studentdetails values(2,3,'Kumar',20,'BSC','7890125648','Kumar@gmail.com','Madurai','M')
 insert into studentdetails values(3,4,'Selvi',22,'B.Tech','8904567342','selvi@gmail.com','selam','F')
 insert into studentdetails values(4,5,'Nisha',25,'M.E','7834672310','Nisha@gmail.com','Theni','F')
 insert into studentdetails values(5,6,'SaiSaran',21,'B.A','7890345678','saran@gmail.com','Madurai','F')
 insert into studentdetails values(6,7,'Tom',23,'BCA','8901234675','Tom@gamil.com','Pune','M')

 select * from studentdetails

 select gender ,count('M') as 'No Of Male',count('F') as 'No Of Female' from studentdetails group by gender

 --8.coursedetails  and courseRegistration

 create table courseDetails(
 C_id varchar(10) primary key,
 C_Name varchar(50),
 Start_Date date,
 End_Date date,
 Fee int)

 insert into courseDetails values ('DN003','DotNet','2018-02-01','2018-02-28',15000)
 insert into courseDetails values ('DV004','DataVisualization','2018-03-01','2018-04-15',15000)
 insert into courseDetails values ('JA002','AdvancedJava','2018-01-02','2018-01-20',10000)
 insert into courseDetails values ('JC001','CoreJava','2018-01-02','2018-01-12',3000)

 select * from courseDetails

 create table courseRegistration(
 RegisterNo int,
 Cid varchar(10) foreign key references courseDetails(C_id),
 Batch char(3)
 )

 insert into courseRegistration values (2,'DN003','FN')
 insert into courseRegistration values (3,'DV004','AN')
 insert into courseRegistration values (4,'JA002','FN')
 insert into courseRegistration values (2,'JA002','AN')
 insert into courseRegistration values (5,'JC001','FN')

select * from courseRegistration
 
select c_name, (select count(*)from CourseRegistration  where cid = c.C_id) 'Number of students registered' 
from Coursedetails c where start_date > '2018-01-02' and end_date <= '2018-02-28'

--9.customer table

create table customer(
customer_id int primary key identity,
first_name varchar(50),
last_name varchar(50)
)

insert into customer values ('George','Washington'),('John','Adams'),('Thomas','Jefferson'),('James','Madison'),('James','Monroe')

select * from customer

create table orders1(
order_id int primary key identity,
order_date date,
amount varchar(50),
customer_id int 
)


insert into orders1 values ('1776-07-04','$234.56',1)
insert into orders1 values ('1760-03-14','$78.50',3)
insert into orders1 values ('1784-05-23','$124.00',2)
insert into orders1 values ('1790-03-09','$65.50',3)
insert into orders1 values ('1795-07-21','$25.50',10)
insert into orders1 values ('1787-11-27','$14.40',9)

select * from orders1

select * from customer c where (select count(*) from orders1 where customer_id = c.customer_id)  = 2;

--10. Student Details in desc

select name,upper(location) from studentdetails order by name desc 

--11. view

create table order2(
Id int primary key,
Orderdate date,
OrderNumber int,
CustomerId int,
TotalAmount int)

create table orderitem(
Id int primary key,
OrderId int,
ProductId int,
UnitPrice int,
Quantity int)

create table Product(
Id int primary key,
ProductName varchar(50),
SupplierId int,
UnitPrice int,
Package varchar(10),
IsDiscontinued char(1)
)

create view VWTable
as 
select ProductName,Quantity,OrderNumber from order2  o join orderitem oi on o.Id=oi.Id join Product p on oi.ProductId=p.Id 
select * from VWTable

select * from order2
select * from orderitem
select * from Product

--12.Nisha Course name

select c_name from courseDetails cd
inner join courseRegistration cr on cd.c_id=cr.Cid
inner join studentdetails sd on cr.RegisterNo=sd.registerNo
where name='Nisha'