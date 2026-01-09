DBMS Relationships using PostgreSQL

   -This repository contains SQL programs demonstrating different types of
    relationships in Database Management Systems using PostgreSQL and pgAdmin.

Relationship implemented :-

One-to-Many Relationship
Example: Department – Employee  
- One department can have many employees  
- Each employee belongs to only one department  
- Foreign key is placed in the Employee table  

File:  `one_to_many.sql`

---

Many-to-One Relationship
Example: Student – College  
- Many students study in one college  
- Each student belongs to only one college  
- Foreign key is placed in the Student table  

File:  `many_to_one.sql`

---

Many-to-Many Relationship
Example: Student – Course  
- One student can enroll in many courses  
- One course can have many students  
- A junction table is used with a composite primary key  

File:  `many_to_many.sql`

---

Concepts Covered
- Primary Key
- Foreign Key
- UNIQUE constraint
- Composite Primary Key
- Junction (Bridge) Table
- Referential Integrity

---

Conclusion
These programs demonstrate proper implementation of DBMS relationships
using SQL and PostgreSQL. This practice helps in understanding data
integrity and relational database design.
