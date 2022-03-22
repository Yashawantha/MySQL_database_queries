SHOW DATABASES;
USE customer;
SELECT * FROM student;


CALL get_student_info(@records,29);
SELECT @records AS Totalrecords;	

