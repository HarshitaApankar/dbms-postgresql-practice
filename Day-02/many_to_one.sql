/*Q3. Many-to-One Relationship

Question:
Design tables Student and College to represent a many-to-one relationship.

Requirements:
Many students study in one college
One student studies in only one college

👉 Write:
Tables
Explain briefly why it is many-to-one
(Hint: structure looks similar to one-to-many but explanation matters)*/


CREATE TABLE College(college_id INT PRIMARY KEY, 
                     college_name VARCHAR(20),
					 city VARCHAR(10));

CREATE TABLE Students3(student_id INT PRIMARY KEY, 
                      student_name VARCHAR(20),
					  course VARCHAR(20),
					  college_id INT,
					  FOREIGN KEY (college_id) REFERENCES College(college_id));

INSERT INTO College VALUES(101,'Symbiases','Mumbai');
INSERT INTO College VALUES(102,'SSR College','Andheri');
INSERT INTO College VALUES(103,'Devkiba','Silvassa');
INSERT INTO College VALUES(104,'DY.Patil','Pune');
INSERT INTO College VALUES(105,'HINDU','Bandra');

INSERT INTO Students3 VALUES(11,'Harshit','comp',101);
INSERT INTO Students3 VALUES(12,'Nidhi','bcom',101);
INSERT INTO Students3 VALUES(13,'Saachi','bba',102);
INSERT INTO Students3 VALUES(14,'Honey','fba',103);
INSERT INTO Students3 VALUES(15,'Raju','bsc',103);
INSERT INTO Students3 VALUES(16,'Anushka','chem',104);
INSERT INTO Students3 VALUES(17,'Unnati','bio',105);

SELECT* FROM College;
SELECT* FROM Students3;
















