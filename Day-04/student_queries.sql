/*
Set B

Create a table
Student (rollno, name, age, city, course, marks)

Insert at least 10 records into the Student table.

Execute the following queries:

1. Display all the details of students.
2. Display distinct courses of students.
3. Display the details of students enrolled in course 'BBA'.
4. Display the details of students who live in Mumbai and have marks greater than 70.
5. Display the details of students whose age is between 18 and 22.
6. Display the roll number and name of students whose name starts with 'A'.
7. Display the details of students whose name contains substring "an".
8. Display the maximum marks obtained by students.
9. Display average marks of students.
10. Give the count of students having marks less than 50.
11. Display the total marks of all students.
12. Display course-wise total count of students.
*/

CREATE TABLE Student_info(rollno INT PRIMARY KEY,
                     sname VARCHAR(20),
					 sage INT,
					 scity VARCHAR(20),
					 course VARCHAR(20),
					 marks INT);

INSERT INTO Student_info VALUES(1,'Harshita',19,'Vapi','CompSCI',78);
INSERT INTO Student_info VALUES(2,'Laksh',18,'Silvassa','BBA',56);
INSERT INTO Student_info VALUES(3,'Muskan',19,'Vapi','Bcom',97);
INSERT INTO Student_info VALUES(4,'Shourya',20,'Vapi','CompSCI',67);
INSERT INTO Student_info VALUES(5,'Radhika',19,'Pune','BBA',87);
INSERT INTO Student_info VALUES(6,'Addy',21,'Silvassa','Bcom',56);
INSERT INTO Student_info VALUES(7,'Vikas',18,'Pune','BA',72);
INSERT INTO Student_info VALUES(8,'Ahana',20,'Silvassa','BBA',69);
INSERT INTO Student_info VALUES(9,'Prathmesh',21,'Pune','CompSCI',83);
INSERT INTO Student_info VALUES(10,'Saachi',18,'Vapi','BA',95);

--1.--
SELECT* FROM Student_info;

--2.--
SELECT DISTINCT(course) FROM Student_info;

--3.--
SELECT *FROM Student_info WHERE course='BBA';

--4.--
SELECT* FROM Student_info WHERE scity='Pune' AND marks>70;

--5.--
SELECT * FROM Student_info WHERE sage BETWEEN 18 AND 20;

--6.--
SELECT rollno,sname FROM Student_info WHERE sname LIKE 'A%';

--7.--
SELECT* FROM Student_info WHERE sname LIKE '%an%';

--8.--
SELECT MAX(marks) FROM Student_info;

--9.--
SELECT AVG(marks) FROM Student_info;

--10.--
SELECT COUNT(*) FROM Student_info WHERE marks<75;

--11.--
SELECT SUM(marks) FROM Student_info;

--12.--
SELECT course, COUNT(*) AS total_students
FROM Student_info
GROUP BY course;
