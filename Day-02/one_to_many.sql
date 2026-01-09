/*Q2. One-to-Many Relationship

Question:
Design tables Department and Employee to represent a one-to-many relationship.

Requirements:
One department can have many employees
One employee belongs to only one department
Use proper keys

👉 Write:
Table creation
Foreign key placement*/

CREATE TABLE Department11(department_no INT PRIMARY KEY,
                        department_name VARCHAR(30),
						locn VARCHAR(20));
						
CREATE TABLE Employee(employee_id INT PRIMARY KEY,
                      employee_name VARCHAR(20),
					  department_no INT,
					  FOREIGN KEY(department_no)REFERENCES Department11(department_no));

INSERT INTO Department11 VALUES(101,'Marketing','At 1st floor');
INSERT INTO Department11 VALUES(102,'Tech','At 2nd floor');
INSERT INTO Department11 VALUES(103,'Finance','At ground floor');
INSERT INTO Department11 VALUES(104,'Desinging','At 3rd floor');
INSERT INTO Department11 VALUES(105,'Chemical','At 5th floor');

INSERT INTO Employee VALUES (1,'Harshita',101);
INSERT INTO Employee VALUES (2,'Richa',101);
INSERT INTO Employee VALUES (3,'Saachi',102);
INSERT INTO Employee VALUES (4,'Anushka',103);
INSERT INTO Employee VALUES (5,'Parth',104);
INSERT INTO Employee VALUES (6,'Kunal',104);
INSERT INTO Employee VALUES (7,'Tina',105);

SELECT*FROM Department11;
SELECT*FROM Employee;
