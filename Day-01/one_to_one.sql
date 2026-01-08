/*Q1. One-to-One Relationship

Question:
Design two tables Person and Passport to represent a one-to-one relationship.

Requirements:

Each person has only one passport
Each passport belongs to only one person
Use PRIMARY KEY and FOREIGN KEY*/

CREATE TABLE Person(person_id INT PRIMARY KEY,
                    pname VARCHAR(10));

CREATE TABLE Pass_port(passport_no INT PRIMARY KEY,
                      destination VARCHAR(10), 
					  person_id INT UNIQUE,
					  FOREIGN KEY(person_id) REFERENCES Person(person_id));

INSERT INTO Person VALUES (1,'Harshita');
INSERT INTO Person VALUES (2,'Vasant');
INSERT INTO Person VALUES (3,'Prathmesh');
INSERT INTO Person VALUES (4,'Sarika');
INSERT INTO Person VALUES (5,'Saachi');

INSERT INTO Pass_port VALUES (101,'spain',1);
INSERT INTO Pass_port VALUES (102,'dubai',2);
INSERT INTO Pass_port VALUES (103,'germany',3);
INSERT INTO Pass_port VALUES (104,'england',4);
INSERT INTO Pass_port VALUES (105,'nashik',5);

SELECT* FROM Person;

SELECT*FROM Pass_port;
