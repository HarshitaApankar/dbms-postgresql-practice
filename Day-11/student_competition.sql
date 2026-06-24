/*--------------------------sample slip 10-----------------------------
Section II: Database Management Systems – II

[15 Marks]

Consider the following Entities and their Relationships for Student–Competition:

1. Student

Student (s_reg_no int, s_name varchar(20), s_class char(10))

2. Competition

Competition (c_no int, c_name varchar(20), c_type char(10))

Relationship between Student and Competition is many-to-many with
descriptive attributes rank and year.

Constraints:
Primary Key should be defined.
c_type should not be NULL.
c_type can be either 'sport' or 'academic'.*/

CREATE TABLE New_Student(s_reg_no int PRIMARY KEY,
                     s_name varchar(20),
					 s_class char(10));

CREATE TABLE New_Competition(c_no int PRIMARY KEY,
                             c_name varchar(20),
							 c_type char(10) NOT NULL CHECK(c_type IN('sport','academic')));
    
CREATE TABLE New_student_competition(s_reg_no int,
                                     c_no int,
									 rank INT,
									 year INT,
									 PRIMARY KEY(s_reg_no,c_no),
									 FOREIGN KEY(s_reg_no)REFERENCES New_Student(s_reg_no),
									 FOREIGN KEY(c_no)REFERENCES New_Competition(c_no));

INSERT INTO New_Student VALUES (1, 'Amit', 'FYBCA');
INSERT INTO New_Student VALUES (2, 'Neha', 'SYBCA');
INSERT INTO New_Student VALUES (3, 'Rahul', 'TYBCA');
INSERT INTO New_Student VALUES (4, 'Sneha', 'FYBCA');

INSERT INTO New_Competition VALUES (101, 'Cricket', 'sport');
INSERT INTO New_Competition VALUES (102, 'Chess', 'sport');
INSERT INTO New_Competition VALUES (103, 'Quiz', 'academic');
INSERT INTO New_Competition VALUES (104, 'Coding', 'academic');

INSERT INTO New_student_competition VALUES (1, 101, 1, 2024);
INSERT INTO New_student_competition VALUES (1, 103, 2, 2024);
INSERT INTO New_student_competition VALUES (2, 102, 1, 2023);
INSERT INTO New_student_competition VALUES (3, 104, 3, 2024);
INSERT INTO New_student_competition VALUES (4, 101, 2, 2023);
INSERT INTO New_student_competition VALUES (2, 104, 1, 2024);

/*Write a function using cursor to accept year and class to display:

Student Name
Competition Name
Rank*/

CREATE OR REPLACE FUNCTION display_name(yr int , class varchar)
RETURNS text AS $$
DECLARE
    rec RECORD;
	
	cur CURSOR FOR
    SELECT s_name,c_name,rank
	FROM New_Student,New_Competition,New_student_competition
	WHERE New_student_competition.s_reg_no= New_Student.s_reg_no
	AND New_student_competition.c_no=New_Competition.c_no
	AND yr=year
	AND class=s_class;

BEGIN
     OPEN cur;

	 LOOP
	  FETCH cur INTO rec;
	  EXIT WHEN NOT FOUND;

	  RAISE NOTICE'Student Name:%
                  Competition Name:%
                  Rank:%',rec.s_name,rec.c_name,rec.rank;
	 END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT display_name('2024' , 'FYBCA')


/*Define a trigger before updating a competition table.
Raise a notice and display message:
"competition record is being updated"*/

CREATE OR REPLACE FUNCTION trigger_competition_update()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'competition record is being updated';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_competition_update
BEFORE UPDATE
ON New_Competition
FOR EACH ROW
EXECUTE FUNCTION trigger_competition_update() ;

UPDATE New_Competition
SET c_name = 'Football'
WHERE c_no = 101;

/*Write a procedure to accept three numbers from user and 
find maximum and minimum from it.*/

CREATE OR REPLACE PROCEDURE find_max_min(
    IN num1 INT,
    IN num2 INT,
    IN num3 INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    maximum INT;
    minimum INT;
BEGIN

    -- Finding Maximum
    maximum := GREATEST(num1, num2, num3);

    -- Finding Minimum
    minimum := LEAST(num1, num2, num3);

    RAISE NOTICE 'Maximum Number: %', maximum;
    RAISE NOTICE 'Minimum Number: %', minimum;

END;
$$;

CALL find_max_min(10,4,50);



