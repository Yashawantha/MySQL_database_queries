SHOW DATABASES;

USE world;

SHOW TABLES;

SELECT * FROM city;

CREATE DATABASE customer;

DROP DATABASE customer;

CREATE DATABASE customer;

# create table in database

USE customer;

CREATE TABLE customer_info (
id INTEGER,
first_name VARCHAR(15),
last_name VARCHAR(15));

SHOW TABLES;

SELECT * FROM customer_info;

INSERT INTO customer_info(id,first_name,last_name)
VALUES(1,'Yash','Gowda');

INSERT INTO customer_info(id,first_name,last_name)
VALUES(2,'Honisha	','Gowda');

DROP TABLE customer_info;

DROP DATABASE customer;

CREATE DATABASE customer;

SHOW DATABASES;

USE customer;

CREATE TABLE customer_info (
id INTEGER AUTO_INCREMENT,
first_name VARCHAR(15),
last_name VARCHAR(15),
salary INTEGER,
PRIMARY KEY (id)
);

INSERT INTO customer_info(first_name,last_name,salary)
VALUES
('Jhon','Daniel',50000),
('Krish','Naik',60000),
('Darius','Bengali',70000),
('Chandan','Kumar',40000),
('Deepak','Sharma',NULL);

# SQL NULL values

SELECT * FROM customer_info
WHERE salary IS null;

SELECT * FROM customer_info
WHERE salary IS NOT null;

#SQL update statement to replace null values
 UPDATE customer_info 
 SET salary=75000
 WHERE id=5;

SELECT * FROM customer_info;

#SQL delete statement

DELETE FROM customer_info
WHERE id=5;

SELECT * FROM customer_info;

#SQL alter statement
-- Add column in existing column

ALTER TABLE customer_info
ADD email VARCHAR(25);

ALTER TABLE customer_info
ADD DOB DATE;

-- ALter table and Modify column

ALTER TABLE customer_info
MODIFY DOB YEAR;

SELECT * FROM customer_info;

DESC customer_info;

-- ALter Table to Drop column


ALTER TABLE customer_info
DROP COLUMN email;

show databases;

USE customer;

CREATE TABLE student(
id INTEGER NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INTEGER);

DESC student;

ALTER TABLE student
MODIFY age INT NOT NULL;

CREATE TABLE person(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT NOT NULL,
UNIQUE(id)
);

INSERT INTO person
VALUES(2,'Harini','Gowda',31); 

ALTER TABLE person
ADD UNIQUE(first_name);

DESC person;
USE customer;
ALTER TABLE person
ADD CONSTRAINT uc_person UNIQUE(age,first_name);
DESC person;

DESC person;


ALTER TABLE person
DROP INDEX uc_person;

DESC person;


# Primary key

CREATE TABLE person1(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25),
age INT,
CONSTRAINT pk_person PRIMARY KEY(id,last_name)
);


DESC person;

ALTER TABLE person1
DROP PRIMARY KEY;

SELECT * FROM person1;

ALTER TABLE person1
ADD PRIMARY KEY(id);

USE customer;
DROP TABLE person;
DROP TABLE person1;
SHOW TABLES;



-- Foreign key

CREATE TABLE person(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT,
Salary INT,
PRIMARY KEY (id)
);


desc person;


CREATE TABLE department(
id INT NOT NULL,
dept_id INT NOT NULL,
dept_name VARCHAR(25) NOT NULL,
PRIMARY KEY(dept_id),
CONSTRAINT fk_pd FOREIGN KEY(id) REFERENCES person(id)
);

DESC department;


-- Update the foreign key-- 

 DROP TABLE department ;
 
 
 
 CREATE TABLE department(
id INT NOT NULL,
dept_id INT NOT NULL,
dept_name VARCHAR(25) NOT NULL,
PRIMARY KEY(dept_id)
);

ALTER TABLE department
add FOREIGN KEY(id) REFERENCES person(id);



-- Check constraint  

CREATE TABLE person_1(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT,
salary INT,
PRIMARY KEY(id),
CHECK(salary<50000)
);







INSERT INTO person_1
VALUES
( '1','Yash','Gowda', 33, 40000);


-- Defalut constraint

CREATE TABLE student_1(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
city_name VARCHAR(25) DEFAULT 'Bengaluru'
);

SELECT * FROM student_1;

DESC student_1;

ALTER TABLE student_1
ALTER city_name DROP DEFAULT;

DESC student_1;

SHOW DATABASES;

USE customer;

/* MY SQL Indexes
CREATE INDEX statement in SQL is used to create indexes in tables.
The indexes are used to retrive data from the database more quickly than others.
The user can not see the indexes, and they are just used to speed up queries/searches.
Note: Updating the table with indexes takes a lot of time than updating a table without indexes.
It is because the indexes also need an update.
so, only create indexes on those columns that will be frequently searched against. 
*/ 


SELECT * FROM department;

CREATE INDEX index_dept_name
ON department(dept_name);
 
DESC department;

ALTER TABLE department
ADD COLUMN books_name VARCHAR(25);

DESC department;

ALTER TABLE department
MODIFY books_name VARCHAR(25) NOT NULL;


CREATE INDEX index_dept_name_books_name 
ON department(dept_id,books_name);

DESC department;

ALTER TABLE department
DROP INDEX index_dept_name_books_name;

/* VIEWS
Virtual table based on the result of set of an SQL query
*/

CREATE TABLE customer_data (
customer_id INT AUTO_INCREMENT,
first_name VARCHAR(24) NOT NULL,
last_name VARCHAR(24) NOT NULL,
quantity INT NOT NULL,
cost INT NOT NULL,
PRIMARY KEY(customer_id)
);

INSERT INTO customer_data 
VALUES
(1,'Yash','Gowda',10,5000),
(2,'Kishore','Dhora',5,500),
(3,'Khirod','Kumar',20,10000);

SELECT * FROM customer_data;

CREATE TABLE customer_adress (
customer_id INT AUTO_INCREMENT,
City VARCHAR(24) NOT NULL,
State VARCHAR(24) NOT NULL,
FOREIGN KEY(customer_id) REFERENCES customer_data(customer_id)
);

INSERT INTO customer_adress 
VALUES 
(1,'Bengaluru','Karnataka'),
(2,'Warangal','Telengana'),
(3,'Vizak','Andra pradesh');

SELECT * FROM customer_adress;
SELECT * FROM customer_data;


SELECT * FROM customer_data 
INNER JOIN customer_adress
USING (customer_id);

CREATE VIEW customer_information as 
SELECT * FROM customer_data 
INNER JOIN customer_adress
USING (customer_id);


SELECT * FROM customer_information ;


DROP VIEW customer_information;






SHOW DATABASES;

USE customer;

SHOW TABLES;


SELECT * FROM student;

INSERT INTO student
VALUES
(01,'Yash','Gowda',33),
(02, 'Khirod', 'Kumar',29),
(03,'Kishore','Dhora',27),
(04, 'Abihesk','Kumar',34);

INSERT INTO student
VALUES
(05,'Nivi','Gowda',28),
(06, 'Haini', 'Gowda',31),
(07,'Pallavi','M S',29),
(08,'Suprithe','R',29),
(09,'Mohan','D P',35),
(10,'Shareef','Raja',35);


SELECT * FROM student;

DESC student;

ALTER TABLE student 
ADD PRIMARY KEY(id); 

CREATE TABLE department(
student_id INT AUTO_INCREMENT,
department_name VARCHAR(25) NOT NULL,
FOREIGN KEY(student_id) REFERENCES student(id)
);

DESC department;

SELECT * FROM student;

SELECT * FROM department;


INSERT INTO department
VALUES
(01,'Mechanical Engineering'),
(02,'Mechanical Engineering'),
(03,'Chemical Engineering'),
(04, 'Chemical Engineering'),
(06, 'Electronics'),
(07, 'Computer science'),
(08, 'Computer science'),
(10,'Nanotechnology');

#SQL JOIN

#INNER JOINT
SELECT * FROM student INNER JOIN department
ON student.id=department.student_id;

SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
INNER JOIN department
ON student.id=department.student_id;

#LEFT JOIN

SELECT * FROM student LEFT JOIN department
ON student.id=department.student_id;

SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
LEFT JOIN department
ON student.id=department.student_id;

#RIGHT JOIN

SELECT * FROM student RIGHT JOIN department
ON student.id=department.student_id;

SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
RIGHT JOIN department
ON student.id=department.student_id;


# FULL OUTER JOIN
SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
LEFT JOIN department
ON student.id=department.student_id

UNION 

SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
RIGHT JOIN department
ON student.id=department.student_id;





# CROSS JOIN

SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
CROSS JOIN department;

# NATURAL JOIN

SELECT id, student.first_name, student.last_name, student.age, department.department_name 
FROM student 
NATURAL JOIN department;


DESC student;


