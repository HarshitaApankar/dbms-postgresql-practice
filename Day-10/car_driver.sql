------------------------------sample slip 9-------------------------------
/*Section II: Database Management Systems–II

Consider the following database:
Car
Car (c_no int, owner varchar(20), model varchar(10), color varchar(10))

Driver
Driver (driver_no int, driver_name varchar(20), license_no int, d_age int, salary float)

Car and Driver are related with many to many relationship.*/

CREATE TABLE Car(c_no int PRIMARY KEY,
                  owner varchar(20),
				  model varchar(10),
				  color varchar(10));

CREATE TABLE Driver(driver_no int PRIMARY KEY,
                     driver_name varchar(20), 
					 license_no int, 
					 d_age int, 
					 salary float);

CREATE TABLE Car_Driver(c_no INT,
                        driver_no int,
						PRIMARY KEY(c_no,driver_no),
						FOREIGN KEY(c_no)REFERENCES Car(c_no),
						FOREIGN KEY (driver_no)REFERENCES Driver(driver_no));

INSERT INTO Car VALUES
(1, 'Raj', 'Swift', 'Red'),
(2, 'Amit', 'i20', 'White'),
(3, 'Sneha', 'City', 'Black'),
(4, 'Kiran', 'Baleno', 'Blue');

INSERT INTO Driver VALUES
(101, 'Rahul', 12345, 25, 20000),
(102, 'Meena', 23456, 30, 25000),
(103, 'Arjun', 34567, 22, 18000);

INSERT INTO Car_Driver VALUES
(1, 101),
(2, 101),
(3, 102),
(4, 103),
(2, 103);

SELECT * FROM Car;
SELECT * FROM Driver;
SELECT * FROM Car_Driver;

/*Q2) Using above Database Solve the following

[10 Marks]

Write a cursor which accepts the driver name and prints the details of all cars that this driver has driven.
If the driver name is invalid, print an appropriate message.*/

CREATE OR REPLACE FUNCTION car_details_by_driver(dname VARCHAR)
RETURNS VOID AS $$
DECLARE
    rec RECORD;
    count_driver INT;

    cur CURSOR FOR
    SELECT Car.c_no, Car.owner, Car.model, Car.color
    FROM Car, Driver, Car_Driver
    WHERE Driver.driver_no = Car_Driver.driver_no
      AND Car.c_no = Car_Driver.c_no
      AND driver_name = dname;

BEGIN
    -- Check if driver exists
    SELECT COUNT(*) INTO count_driver
    FROM Driver
    WHERE driver_name = dname;

    IF count_driver = 0 THEN
        RAISE NOTICE 'Invalid Driver Name';
        RETURN;
    END IF;

    OPEN cur;

    LOOP
        FETCH cur INTO rec;
        EXIT WHEN NOT FOUND;

        RAISE NOTICE 'Car No: %, Owner: %, Model: %, Color: %',
                     rec.c_no, rec.owner, rec.model, rec.color;
    END LOOP;

    CLOSE cur;
END;
$$
LANGUAGE plpgsql;

SELECT* FROM car_details_by_driver('Rahul')

--Write a trigger before insert/update on Driver.
--Raise exception if driver age is < 21.

CREATE OR REPLACE FUNCTION trigger_driver_age() 
RETURNS TRIGGER AS $$
BEGIN
     IF (NEW.d_age>21) THEN 
	 RAISE EXCEPTION 'driver age is MORE THAN 21';
	 END IF;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER tri_driver_age
BEFORE INSERT OR UPDATE ON Driver
FOR EACH ROW
EXECUTE FUNCTION trigger_driver_age()

INSERT INTO Driver VALUES(109, 'Saachi', 98755, 26, 20700);

--Write a procedure to find sum of first 100 numbers.

CREATE OR REPLACE PROCEDURE sum_first_100()
LANGUAGE plpgsql 
AS $$
DECLARE
     i INT:=1;
	 total INT:=0;
BEGIN
     WHILE i<=100 LOOP
	 total:=total+i;
	 i:=i+1;
	 END LOOP;

	 RAISE INFO 'Sum of first 100 numberrs is %',total;
END;
$$;

CALL sum_first_100()
