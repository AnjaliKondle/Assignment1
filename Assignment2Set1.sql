
create assignment2

use assignment2
create table emp(
empno int primary key,
ename varchar(20),
job varchar(30),
mgrid int ,
hiredate date,
sal int,
comm int, 
deptno int 
)

select * from emp

insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7521,' WARD','SALESMAN',7698, '22-FEB-81',1250,500,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7566,'JONES','MANAGER',7839,'02-APR-81',2975,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal, deptno)values(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850, 30)
insert into emp(empno, ename, job, mgrid, hiredate, sal, deptno)values(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,10)
insert into emp(empno, ename, job, mgrid, hiredate, sal, deptno)values(7788 ,'SCOTT','ANALYST',7566 ,'19-APR-87',3000,20)
insert into emp(empno, ename, job, hiredate, sal, deptno)values(7839 ,'KING','PRESIDENT','17-NOV-81',5000,10)
insert into emp(empno, ename, job, mgrid, hiredate, sal, comm, deptno)values(7844,'TURNER','SALESMAN', 7698,'08-SEP-81',1500,0,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7876 ,'ADAMS','CLERK',7788,'23-MAY-87',1100,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7900 ,'JAMES','CLERK',7698,'03-DEC-81',950,30)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7902 , 'FORD', 'ANALYST', 7566,'03-DEC-81',3000,20)
insert into emp(empno, ename, job, mgrid, hiredate, sal,deptno)values(7934 ,'MILLER','CLERK',7782,'23-JAN-82',1300,10)


alter table  emp
add foreign key (deptno) references dept(deptno)


create table DEPT(
deptno int primary key not null,
dname varchar(30), 
loc varchar(20)
)

insert into DEPT(deptno, dname, loc)values(10,'ACCOUNTING','NEW YORK')
insert into DEPT(deptno, dname, loc)values(20,'RESEARCH', 'DALLAS')
insert into DEPT(deptno, dname, loc)values(30,'SALES','CHICAGO')
insert into DEPT(deptno, dname, loc)values(40,'OPERATIONS',' BOSTON')

select * from DEPT
--SET - I

--1. List all employees whose name begins with 'A'. 
select * from emp where ename Like 'A%'

--2. Select all those employees who don't have a manager. 
Select ename from emp where mgrid is null

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select ename,empno,sal from emp where sal between 1200 and 1400

--4.Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
select ename, sal+sal*0.1 as 'Rise in Salary' from emp where deptno=20

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select count(*) as 'No. of Clerks' from emp where job='clerk'

--6. Find the average salary for each job type and the number of people employed in each job.
select job,avg(sal) as'Average Salary' ,count(empno) from emp group by job

--7. List the employees with the lowest and highest salary. 
select * from emp where sal=(select max(sal) from emp) or sal=(select min(sal) from emp)

--8.List full details of departments that don't have any employees. 
select *from emp where job is null
select * from dept where deptno=(select deptno from emp where ename=null)

--9.Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select ename,sal from emp where (sal>1200 and deptno=20 and job='ANALYST')order by ename

--10.For each department, list its name and number together with the total salary paid to employees in that department. 
select dname,deptno from dept group by s

--11.Find out salary of both MILLER and SMITH.
select ename,sal from emp where (ename='MILLER' or ename='SMITH')

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’.
select ename from emp where ename like 'a%' or ename like 'm%'

--13. Compute yearly salary of SMITH. 
select sal*12 as 'Yearly Salary' from emp where ename='SMITH'

--14.List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename,sal from emp where sal not in (1500,2850)
