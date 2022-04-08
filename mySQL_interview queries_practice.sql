USE company;
SELECT * FROM employee;
SELECT * FROM emp_designation;
SELECT * FROM bonus;

#1. Write an SQL query to retreive all details where first name from employee
#table which starts with y

SELECT * FROM employee
WHERE first_name LIKE 'y%';


#2. Write an SQL query to print all details of the employees whose salary is between 20000 to 28000

SELECT * FROM employee
WHERE salary BETWEEN 20000 AND 28000;

SELECT CONCAT(first_name,' ',last_name) as employee_name, salary
FROM employee
WHERE Emp_id IN 
(SELECT Emp_id FROM employee
WHERE salary BETWEEN 20000 AND 28000);

#3.SQL query to retrive details of the employees who joined on a date

SELECT * FROM employee
WHERE year(joining_date)=2018 and month(joining_date)=12;

#4. SQL query to fetch number of employees in every department 

SELECT * FROM employee;

SELECT count(*),dept_name FROM employee
GROUP BY dept_name;


#5. SQL query to print 	details of the employee who are also executives
SELECT * FROM emp_designation;

SELECT Emp_id,first_name,last_name,designation FROM emp_designation
INNER JOIN employee
ON
emp_designation.Emp_ref_id=employee.Emp_id
and designation='manager';   
 
#OR

SELECT Emp_id,first_name,last_name,designation FROM emp_designation
INNER JOIN employee
ON
emp_designation.Emp_ref_id=employee.Emp_id
and designation IN ('Manager','executive manager');

#6. SQL query to clone a new table from another table
CREATE TABLE clone_empolyee like employee;

SELECT * FROM clone_empolyee;

#7. SQL query to show top n salary of employees

SELECT * FROM employee
ORDER BY salary DESC
LIMIT 5;

SELECT * FROM employee
ORDER BY salary ASC
LIMIT 5;

#7. SQL query to show 5th higest salary of employees

SELECT * FROM employee
ORDER BY salary DESC
LIMIT 4,1;
