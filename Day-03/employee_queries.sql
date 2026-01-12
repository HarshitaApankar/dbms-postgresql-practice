
/*
Set A

Create a table
Employee (empno, name, age, address, salary, deptno)
Insert at least 10 records into the Employee table.

Execute the following queries:

1. Display all the details of employee.
2. Display distinct department numbers of employees.
3. Display the details of employee of deptno 105.
4. Display the details of employee who lives in Pune and having salary greater than 50000.
5. Display the details of employee whose age is between 20 and 25.
6. Display the employee number and employee name whose name start with S.
7. Display the details of employee whose name contain substring "nit".
8. Display the maximum salary of employee.
9. Display average salary of employees.
10. Give the count of employees having age less than 35.
11. Display the total expenditure paid on employee salary.
12. Display the department wise total count of employees.

---*/

CREATE TABLE Employee_new(empno INT PRIMARY KEY,
                      empname VARCHAR(20),
					  age INT,
					  address VARCHAR(50),
					  salary INT,
					  deptno INT);

INSERT INTO Employee_new VALUES(1,'Harshita',19,'Silvsa',50500,101);
INSERT INTO Employee_new VALUES(2,'Liara',23,'Pune',67000,101);
INSERT INTO Employee_new VALUES(3,'Anita',20,'Vapi',45000,102);
INSERT INTO Employee_new VALUES(4,'Sam',19,'Silvassa',67000,102);
INSERT INTO Employee_new VALUES(5,'Rajesh',21,'Pune',45600,102);
INSERT INTO Employee_new VALUES(6,'Saachi',20,'Vapi',43550,103);
INSERT INTO Employee_new VALUES(7,'Mayur',22,'Jaipur',50500,103);
INSERT INTO Employee_new VALUES(8,'Anirudh',20,'Silvassa',78000,104);
INSERT INTO Employee_new VALUES(9,'Saachi',19,'Jaipur',76540,104);
INSERT INTO Employee_new VALUES(19,'Anaya',21,'Vapi',34500,105);

--1.--
SELECT* FROM Employee_new;

--2.--
SELECT DISTINCT deptno FROM Employee_new;

--3.--
SELECT * FROM Employee_new WHERE deptno=105;

--4.--
SELECT* FROM Employee_new WHERE address='Pune' AND salary>50000;

--5.--
SELECT * FROM Employee_new WHERE age BETWEEN 20 AND 25;

--6.--
SELECT empno,empname FROM Employee_new WHERE empname LIKE'S%';

--7.--
SELECT * FROM Employee_new WHERE empname LIKE '%nit%';

--8.--
SELECT MAX(salary) FROM Employee_new;

--9.--
SELECT AVG(salary) FROM Employee_new;

--10.--
SELECT COUNT(*) FROM Employee_new WHERE age < 21;

--11.--
SELECT SUM(salary) AS total_salary FROM Employee_new;

--12.--
SELECT deptno, COUNT(*) AS total_employees
FROM Employee_new
GROUP BY deptno;


