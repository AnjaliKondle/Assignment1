create database Asg1

use Asg1

create table clients(
Client_Id int primary key identity(1001,1),
Cname varchar(40) not null,
Address varchar(30),
Email varchar(30) unique,
Phone char(10),
Business varchar(20) not null)

create table Departments(
DeptNo int primary key identity(10,10),
DName varchar(15) not null,
Loc varchar(20))

create table Employees(
EmpNo int primary key identity(7001,1),
Ename varchar(20) not null,
Job varchar(15),
Salary int check (Salary>0),
DeptNo int references Departments(DeptNo))

create table Projects(
Project_Id int primary key identity(401,1),
Descr varchar(30) not null,
Start_Date date,
Planned_End_Date date,
Actual_End_Date date,
Budget int check (Budget>0),
ClientId int references clients (Client_Id))

create table EmpProjectTasks(
Project_Id int,
EmpNo int references Employees(EmpNo),
Start_Date date,
End_date date,
Task varchar(25) not null,
Status varchar(15) not null
)
drop table EmpProjectTasks

alter table Projects
add constraint datechk check(Actual_End_Date>Planned_End_Date)

alter table Projects
drop constraint datechk

insert into clients(Cname,Address,Email,Phone,Business) values ('ACME Utilities','Noida','contact@acmeutil.com','9567880032','Manufacturing')
insert into clients(Cname,Address,Email,Phone,Business) values ('Trackon Consultants','Mumbai','constult@trackon','8734210090','Consultant'),('MoneySaver Distributors','Kolkata','save@moneysaver','7799886655','Reseller'),
('Lawful Corp','Chennai','justice@lawful.com','9210342219','Professional')

insert into Departments(DName,Loc) values ('Design','Pune'),('Development','Pune'),('Testing','Mumbai'),('Document','Mumbai')

insert into Employees(Ename,Job,Salary,DeptNo) values ('Sandeep','Analyst',25000,10)
insert into Employees(Ename,Job,Salary,DeptNo) values ('Rajesh','Designer',30000,10),('Madhav','Developer',40000,20),('Manoj','Developer',40000,20),
('Abhay','Designer',35000,10),('Uma','Tester',30000,30),('Gita','Tech.Writer',30000,40),('Priya','Tester',35000,30),('Nutan','Developer',45000,20),
('Smita','Analyst',20000,10),('Anand','Project Mgr',65000,10)


insert into Projects(Descr,Start_Date,Planned_End_Date,Actual_End_Date,Budget,ClientId) values ('Inventory',CONVERT(datetime,'01-APR-2011'),CONVERT(datetime,'01-OCT-2011'),convert(datetime,'31-OCT-2011'),150000,1001)
insert into Projects(Descr,Start_Date,Planned_End_Date,Budget,ClientId) values ('Accounting',CONVERT(datetime,'01-AUG-2011'),CONVERT(datetime,'01-JAN-2012'),500000,1002)
insert into Projects(Descr,Start_Date,Planned_End_Date,Budget,ClientId) values ('Payroll',CONVERT(datetime,'01-OCT-2011'),CONVERT(datetime,'31-DEC-2011'),75000,1003)
insert into Projects(Descr,Start_Date,Planned_End_Date,Budget,ClientId) values ('Contact Mgmt',CONVERT(datetime,'01-NOV-2011'),CONVERT(datetime,'31-DEC-2011'),50000,1004)



insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,End_date,Task,Status) values (401,7001,CONVERT(datetime,'01-APR-2011'),convert(datetime,'20-APR-2011'),'System Analysis','Completed')
insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,End_date,Task,Status) values (401,7002,CONVERT(datetime,'21-APR-2011'),convert(datetime,'30-MAY-2011'),'System Design','Completed')
insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,End_date,Task,Status) values (401,7003,CONVERT(datetime,'01-JUN-2011'),convert(datetime,'15-JUL-2011'),'Coding','Completed'),
(401,7004,CONVERT(datetime,'18-JUL-2011'),convert(datetime,'01-SEP-2011'),'Coding','Completed'),(401,7006,CONVERT(datetime,'03-SEP-2011'),convert(datetime,'15-SEP-2011'),'Testing','Completed'),
(401,7009,CONVERT(datetime,'18-SEP-2011'),convert(datetime,'05-OCT-2011'),'Code Change','Completed'),(401,7008,CONVERT(datetime,'06-OCT-2011'),convert(datetime,'16-OCT-2011'),'Testing','Completed'),
(401,7007,CONVERT(datetime,'06-OCT-2011'),convert(datetime,'22-OCT-2011'),'Documentation','Completed'),(401,7011,CONVERT(datetime,'22-OCT-2011'),convert(datetime,'31-OCT-2011'),'Sign Off','Completed'),
(402,7010,CONVERT(datetime,'01-AUG-2011'),convert(datetime,'20-AUG-2011'),'System Analysis','Completed'),(402,7002,CONVERT(datetime,'22-AUG-2011'),convert(datetime,'30-SEP-2011'),'System Design','Completed')
insert into EmpProjectTasks(Project_Id,EmpNo,Start_Date,Task,Status) values(402,7004,CONVERT(datetime,'01-OCT-2011'),'Coding','In Progress')

select* from clients
select* from Departments
select* from Employees
select* from Projects
select* from EmpProjectTasks

