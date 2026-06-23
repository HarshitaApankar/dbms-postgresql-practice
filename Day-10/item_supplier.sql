------------------------------sample slip 8-------------------------------------------
/*Section II: Database Management Systems II [15 Marks]
Consider the following Item-Supplier database
Item (itemno integer, itemname varchar(20))
Supplier (supplier_no integer, supplier_name varchar(20), city varchar(20))

The relationship is as,

Item-Supplier: M-M relationship with rate (money) and quantity (integer) as
descriptive attributes.*/

CREATE TABLE Items(itemno INT PRIMARY KEY,
                  itemname VARCHAR(20));

CREATE TABLE Suppliers(supplier_no INT PRIMARY KEY,
                      supplier_name VARCHAR(20),
					  city VARCHAR(20));

CREATE TABLE Items_Suppliers(itemno INT,
                           supplier_no INT,
						   PRIMARY KEY(itemno,supplier_no),
						   FOREIGN KEY(itemno) REFERENCES Items(itemno),
						   FOREIGN KEY(supplier_no) REFERENCES Suppliers(supplier_no),
						   rate money,
						   quantity int);

INSERT INTO Items VALUES
(1, 'Pen'),
(2, 'Notebook'),
(3, 'Marker');

INSERT INTO Suppliers VALUES
(101, 'Raj Traders', 'Ahmedabad'),
(102, 'Shree Suppliers', 'Surat'),
(103, 'Patel Stationers', 'Vadodara');

INSERT INTO Items_Suppliers VALUES
(1, 101, '50', 100),
(2, 101, '120', 50),
(3, 102, '80', 70),
(1, 103, '55', 200);

SELECT* FROM Items;
SELECT*FROM Suppliers;
SELECT *FROM Items_Suppliers;

--Write a cursor to display the names of items whose rate is more than 500.
CREATE OR REPLACE FUNCTION name_item_price()
RETURNS TEXT AS $$
DECLARE
      rec RECORD;
	  
	  cur CURSOR FOR
	  SELECT itemname FROM Items 
	  WHERE itemno IN
     (SELECT itemno from Items_Suppliers WHERE rate>'100');

BEGIN
     OPEN cur;
	 LOOP
	   FETCH cur INTO rec;
	   EXIT WHEN NOT FOUND;
                 RAISE INFO 'Item Name: %', rec.itemname;
      END LOOP;
	 CLOSE cur;

END;
$$
LANGUAGE plpgsql;

SELECT name_item_price();

--Write a trigger before insert or update on rate field.
--If the rate is less than 50 then raise appropriate exception.

CREATE OR REPLACE FUNCTION trigger_rate_less()
RETURNS TRIGGER AS $$
BEGIN
      IF NEW.rate<'50' THEN
	  RAISE EXCEPTION'The rate is less than 50';
	  END IF;
	  
	  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_rates
BEFORE INSERT OR UPDATE ON Items_Suppliers
FOR EACH ROW
EXECUTE FUNCTION trigger_rate_less();

UPDATE Items_Suppliers SET rate = 40 WHERE itemno = 1;
UPDATE Items_Suppliers SET rate = 60 WHERE itemno = 1;

--Write a trigger before insert or update on rate field.
--If the rate is less than 50 then raise appropriate exception.

CREATE OR REPLACE FUNCTION trigger_rate_less()
RETURNS TRIGGER AS $$
BEGIN
      IF NEW.rate<50 THEN
	  RAISE EXCEPTION'The rate is less than 50';
	  END IF;
	  
	  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_rate
BEFORE INSERT OR UPDATE ON Items_Suppliers
FOR EACH ROW
EXECUTE FUNCTION trigger_rate_less();

UPDATE Items_Suppliers SET rate = 40 WHERE itemno = 1;
UPDATE Items_Suppliers SET rate = 60 WHERE itemno = 1;

/*Write a procedure to accept three numbers and find
the maximum number from it.*/

CREATE OR REPLACE PROCEDURE maximum_three_number(a int,b int,c int)
LANGUAGE plpgsql AS $$

BEGIN
   IF(a>b) AND (a>c)THEN 
   RAISE INFO'a is maximum';
   
   ELSEIF (b>a)AND(b>c)THEN 
   RAISE INFO'b is maximum';
   
   ELSEIF (c>a)AND(c>b)THEN 
   RAISE INFO'c is maximum';

   ELSE
        RAISE INFO 'Some numbers are equal';
   END IF;
END;
$$;

CALL maximum_three_number(10,20,30)

