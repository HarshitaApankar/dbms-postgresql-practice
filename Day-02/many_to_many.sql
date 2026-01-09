/*🔹 Q4. Many-to-Many Relationship

Question:
Design tables Student and Course to represent a many-to-many relationship.

Requirements:
One student can enroll in many courses
One course can have many students
Use a junction (bridge) table

👉 Write:
Three tables
Composite primary key in junction table*/

CREATE TABLE Student_new(student_id INT PRIMARY KEY,
                         student_name VARCHAR(20));

CREATE TABLE Course(course_id INT PRIMARY KEY,
                    course_name VARCHAR(20));

CREATE TABLE Stud_Cou(student_id INT,
                      course_id INT,
					  PRIMARY KEY(student_id,course_id),
					  FOREIGN KEY(student_id) REFERENCES Student_new(student_id),
				      FOREIGN KEY(course_id) REFERENCES Course(course_id));

INSERT INTO Student_new VALUES(1,'Riya');
INSERT INTO Student_new VALUES(2,'Kajal');
INSERT INTO Student_new VALUES(3,'Anirudh');
INSERT INTO Student_new VALUES(4,'Sakshi');

INSERT INTO Course VALUES(101,'sci');
INSERT INTO Course VALUES(102,'ss');
INSERT INTO Course VALUES(103,'pe');
INSERT INTO Course VALUES(104,'com');

INSERT INTO Stud_Cou VALUES(1,101);
INSERT INTO Stud_Cou VALUES(1,102);
INSERT INTO Stud_Cou VALUES(2,102);
INSERT INTO Stud_Cou VALUES(2,103);
INSERT INTO Stud_Cou VALUES(3,104);

SELECT* FROM Student_new;
SELECT* FROM Course;
SELECT* FROM Stud_Cou;






