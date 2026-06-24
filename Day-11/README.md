# DBMS-II 

This repository contains DBMS-II practical programs implemented using **PostgreSQL / PLpgSQL**. The programs are based on database concepts such as **table creation, many-to-many relationships, functions using cursors, triggers, and stored procedures**.

## Programs Included

### 1. Student–Competition Database
This program is based on a **Student–Competition** database where students and competitions are connected through a **many-to-many relationship** with attributes like **rank** and **year**.

It includes:
- Creation of `Student`, `Competition`, and relationship tables
- Constraints such as primary keys, NOT NULL, and CHECK
- A **cursor-based function** to display student name, competition name, and rank for a given year and class
- A **trigger** that displays a notice before updating a competition record
- A **procedure** to find the maximum and minimum among three numbers

### 2. Student–Subject Database
This program is based on a **Student–Subject** database where students and subjects are connected through a **many-to-many relationship** with the attribute **marks_scored**.

It includes:
- Creation of `Student`, `Subject`, and relationship tables
- A **cursor-based function** to display student details for a given class
- A **trigger** to prevent insertion or update of negative marks
- A **procedure** to perform addition, subtraction, and division of two numbers
- Exception handling for **division by zero**

## Concepts Used
- SQL table creation
- Primary key and foreign key constraints
- Many-to-many relationships
- PL/pgSQL functions
- Cursors
- Triggers
- Stored procedures
- Exception handling

## Technologies Used
- SQL
- PostgreSQL
- PL/pgSQL

## Purpose
These programs were created for DBMS-II practical learning and help in understanding how database relationships, cursor functions, triggers, and procedures are implemented in PostgreSQL.
