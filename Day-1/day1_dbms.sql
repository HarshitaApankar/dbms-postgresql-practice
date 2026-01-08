/*📌 SECTION A: Database & Tables

1.Create a database named college_db.
2.Create a table department with:
  dept_id → Primary Key
  dept_name

3.Create a table student with:
  student_id → Primary Key
  student_name
  dept_id*/

--1.--
CREATE DATABASE college_db;

--2.--
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

INSERT INTO Department VALUES (1, 'Marketing');
INSERT INTO Department VALUES (2, 'HR');
INSERT INTO Department VALUES (3, 'Tech');

SELECT * FROM Department;

--3.--
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    dept_id INT
);

INSERT INTO Student VALUES (11, 'Khushi', 1);
INSERT INTO Student VALUES (12, 'Saachi', 2);
INSERT INTO Student VALUES (13, 'Dhiya', 3);

SELECT * FROM Student;




