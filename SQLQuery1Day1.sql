create database FISDB
use FISDB

create table tblDepartment(
DeptId int primary key,
DeptName varchar(20)not null,
DeptLocation nvarchar(30) --default Hyderabad while creating the table
)
create table tblEmployee(
EmpId int primary key,
EmpName varchar(50),
Gender char(7),
Salary float,
DeptId int references tblDepartment(DeptId), --Foriegn key declaration /* */
)
select * from tblDepartment
select * from tblEmployee

/*insert into tblDepartment values(1,'IT','')*/ --Gives error
insert into tblDepartment(DeptId,DeptName) values(1,'IT') --Doesnt give error as we have mentioned locations for data and takes up null for missing value
insert into tblDepartment values (2,'HR',null) --We can insert null value
insert into tblDepartment values (3,'Sales','Mumbai'), (4,'Management','Thane')

insert into tblEmployee values(100,'Anjali Kondle','Female', 50000, 1)
insert into tblEmployee values(101,'Vaishali Badakh','Female', 50000, 2)
insert into tblEmployee values(102,'Ashwini A','Female', 50000, null)
insert into tblEmployee values(103,'Shivay Sharma','Male', 50000, 3)

--altering the table and adding a column
alter table tblEmployee
/*add Phone varchar(50) unique : Gives error as we have 4 Employee, Everone gets null value which is not acceptable , It would have worked if we did this before adding data to this table*/
add Phone varchar(50)

update tblEmployee set Phone = '9876543210' where EmpId=100
update tblEmployee set Phone = '3344556677' where EmpId=101
update tblEmployee set Phone = '9087654321' where EmpId=102
update tblEmployee set Phone = '9076656780' where EmpId=103

--alter table and add constraint
alter table tblEmployee 
add constraint unqPhone unique(Phone)

insert into tblEmployee values(104,'Sahil D','Male',45000,2,null)
--insert into tblEmployee values(105,'Trisha Jain','Female',35000,4,null) : Gives error as phone is unique and we already have one null
insert into tblEmployee values(105,'Trisha Jain','Female',35000,4,'8907788956') 

--add check constraint
alter table tblEmployee 
add constraint salarycheck check(Salary>=20000) 

update tblDepartment set DeptLocation='Pune' where DeptId=1
update tblDepartment set DeptLocation='Noida' where DeptName='HR'
update tblEmployee set DeptId=2 where EmpId=102
update tblEmployee set Phone='9087798721' where EmpId=104


--Enabling or Diabling a constraint
--alter table tblEmployee
--nocheck constraint salarycheck
--check constraint salarycheck
 
alter table tblDepartment
add constraint deflocation default 'Hyderabad' for DeptLocation

--adding a column 
alter table tblEmployee
add Empmail varchar(60)

--dropping a column
alter table tblEmployee
drop column Empmail

--truncate syntax:
create table dummytable
(dummyid int identity(1,2), dummyname varchar(20),dummycity varchar(20)) -- Identity is like Arithmetic progression a=first term, d=difference : identity(a,d)

select* from dummytable

insert into dummytable values(45,'Aryan','Pune'),(46,'Aradhya','Orissa'),(47,'Piyu','Lukhnow') --without identity
insert into dummytable values ('Savni','Patna'),('Aryan','Pune'),('Aradhya','Orissa')


delete from dummytable where dummyid=7
delete from dummytable where dummyid=9

--setting the implicit transactions
set implicit_transactions off

begin transaction
select* from dummytable
delete from dummytable
select* from dummytable
rollback

select* from dummytable

/*
set implicit_transactions off

begin transaction
select* from dummytable
delete from dummytable
select* from dummytable
commit

select* from dummytable
*/



--truncate table dummytable
--drop table dummytable

insert into tblDepartment(DeptId,DeptName) values (5,'Operations') --here we skip so they take up default value
sp_help tblEmployee
sp_help tblDepartment


--column level constraint or table level constraint
create table orders
(orderId int primary key, orderDate date not null, CustomerId int foreign key references Customers(CustId))

--table level
/*create table orders
(orderId int, orderDate date not null,orderamount int, CustomerId int primary key(orderId) constraint fkconstant foreign key(CustomerId) references Customers(CustId))
*/

--selection and projection
select EmpID,Empname, Salary from tblEmployee
where DeptId=3

--alias names to columns
select EmpId as EmployeeId, EmpName as EmployeeName,salary as ' Employee Salary' from tblEmployee

--top few records
select top 3 * from tblEmployee

--top percentage of records
select top 2 percent* from tblEmployee

--Relational Operayors (<,>,<=,>=,=,!=,<>)
select* from tblEmployee where Salary<>45000 --Excluding

--Logical Operators
select* from tblEmployee where Salary>20000 and Salary<=45000

--between Operators
select* from tblEmployee where Salary between 20000 and 45000

--negative operators
select* from tblEmployee where Salary not between 20000 and 45000

--null values
select* from tblEmployee where DeptId is null
select* from tblEmployee where DeptId is not null

--logical operator OR
select * from tblEmployee where DeptId=2 or DeptId=3

--the above can also be done by using in
select* from tblEmployee where DeptId in(2,3)
select* from tblEmployee where DeptId not in(2,3)

--Arithmetic operators (*,/,+,-)
select EmpName, DeptId, Salary, Salary +1000 as 'New Salary' from tblEmployee --just view not changed
select EmpName, DeptId, Salary, Salary*12 as 'Annual Salary' from tblEmployee
update tblEmployee set Salary=(Salary+3000) where salary<46000
select * from tblEmployee

--Aggregate Functions
select avg(Salary) as 'Average' from tblEmployee
select sum(Salary) as'Sum' from tblEmployee
select min(Salary) as'Minimum' from tblEmployee
select max(Salary) as'Maximum' from tblEmployee

select count(EmpId) from tblEmployee