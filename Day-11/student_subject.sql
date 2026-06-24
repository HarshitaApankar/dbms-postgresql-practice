------------------------------sample slip 11-------------------------------------------

**Section II: Database Management Systems II**
**[15 Marks]**

Consider the following database:

**Student** (rollno integer, name varchar(30), class varchar(10))
**Subject** (Scode varchar(10), subject name varchar(20))

Student and Subject are related with M-M (Many-to-Many) relationship with attribute **marks_scored**.

---

*Q2) Using above Database solve the following:**
**[10 Marks]**

1. Write a stored function using cursors, to accept class from the user and display the details of the students of that class.

**OR**

1. Write a trigger before insert/update the marks_scored. Raise exception if marks are negative.

2. Write a procedure to accept and display addition, subtraction and division of two numbers. Handle division by zero error for division operation. (Use raise).

**[5 Marks]**

---

**Q3) Viva**
**[5 Marks]**

---

If you want, I can also give you the SQL/PLSQL programs for this question.*/

CREATE TABLE SStudent(rollno INT PRIMARY KEY,
                      name VARCHAR(30),
					  class VARCHAR(20))

CREATE TABLE SSubject(scode INT PRIMARY KEY,
                      subject_name VARCHAR(20))

CREATE TABLE SStudent_SSubject(rollno INT,
                                scode INT,
								marks_scored INT,
								PRIMARY KEY(rollno,scode),
								FOREIGN KEY(rollno) REFERENCES SStudent(rollno),
								FOREIGN KEY(scode) REFERENCES SSubject(scode));

INSERT INTO SStudent VALUES (1, 'Amit', 'FYBSc');
INSERT INTO SStudent VALUES (2, 'Priya', 'FYBSc');
INSERT INTO SStudent VALUES (3, 'Rahul', 'SYBSc');
INSERT INTO SStudent VALUES (4, 'Sneha', 'TYBSc');

INSERT INTO SSubject VALUES (101, 'Maths');
INSERT INTO SSubject VALUES (102, 'Physics');
INSERT INTO SSubject VALUES (103, 'Chemistry');
INSERT INTO SSubject VALUES (104, 'Computer');

INSERT INTO SStudent_SSubject VALUES (1, 101, 85);
INSERT INTO SStudent_SSubject VALUES (1, 102, 78);
INSERT INTO SStudent_SSubject VALUES (2, 101, 90);
INSERT INTO SStudent_SSubject VALUES (2, 103, 88);
INSERT INTO SStudent_SSubject VALUES (3, 102, 70);
INSERT INTO SStudent_SSubject VALUES (3, 104, 92);
INSERT INTO SStudent_SSubject VALUES (4, 101, 60);
INSERT INTO SStudent_SSubject VALUES (4, 104, 75);

SELECT*FROM SStudent;
SELECT*FROM SSubject;
SELECT*FROM SStudent_SSubject;

/*Write a stored function using cursors, to accept class 
from the user and display the details of the students of that class.*/

CREATE OR REPLACE FUNCTION details_class(get_class text)
RETURNS TEXT AS $$
DECLARE
    rec RECORD;
	cur CURSOR FOR
	SELECT rollno,name
	FROM SStudent 
	WHERE class=get_class;

BEGIN
   OPEN cur;

   LOOP
   FETCH cur INTO rec;
   EXIT WHEN NOT FOUND;

   RAISE NOTICE'The details of the students of that class: ROLL NO:%, NAME:%',rec.rollno,rec.name;
   END LOOP;
   CLOSE cur;

   RETURN 'Details Displayed Successfully';
END;
$$
LANGUAGE plpgsql;

SELECT details_class('SYBSc')

/*Write a trigger before insert/update the marks_scored.
Raise exception if marks are negative.*/

CREATE OR REPLACE FUNCTION trigger_marks_scored()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.marks_scored<0 THEN
	RAISE EXCEPTION 'Marks cannot be negative!';
	END IF;

RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_marks
BEFORE INSERT OR UPDATE ON SStudent_SSubject
FOR EACH ROW
EXECUTE FUNCTION trigger_marks_scored()

INSERT INTO SStudent_SSubject VALUES (1,102,-10);

/*Write a procedure to accept and display addition, subtraction
and division of two numbers. Handle division
by zero error for division operation. (Use raise).*/

CREATE OR REPLACE PROCEDURE add_sub_div(a int,b int)
LANGUAGE plpgsql AS $$
DECLARE
result_add INT;
result_sub INT;
result_div INT;
BEGIN
result_add:=a+b;
RAISE NOTICE'Addition of two numbers % and % is:%',a,b,result_add;
result_sub:=a-b;
RAISE NOTICE'Subtraction of two numbers % and % is:%',a,b,result_sub;
IF b=0 THEN
RAISE EXCEPTION 'zero error for division';
ELSE 
result_div:=a/b;
RAISE NOTICE'Division of two numbers % and % is:%',a,b,result_div;
END IF;
END;
$$;

CALL add_sub_div(6,3)
