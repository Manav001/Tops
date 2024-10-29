-- Assessment 1:
-- Q1) Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
SELECT * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- Q2) Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');

-- Q3) Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h';

-- Q4) Write an SQL query to print details of the Workers whose SALARY lies between 1.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

-- Q5) Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT first_name, last_name, COUNT(*) FROM worker GROUP BY salary HAVING COUNT(*) > 100000;

-- Q6) Write an SQL query to show the top 6 records of a table.
SELECT * FROM Worker LIMIT 6;

-- Q7) Write an SQL query to fetch the departments that have less than five people in them.
SELECT DEPARTMENT, COUNT(*) as num_people FROM Worker GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

-- Q8) Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(*) as num_people FROM Worker GROUP BY DEPARTMENT;

-- Q9) Write an SQL query to print the name of employees having the highest salary in each department.
 SELECT DEPARTMENT, FIRST_NAME, SALARY FROM Worker w1 WHERE SALARY = (SELECT MAX(SALARY) FROM Worker w2 WHERE w2.DEPARTMENT = w1.DEPARTMENT);
 
-- Assessment 2:
-- Q1) To display all the records form STUDENT table. 
SELECT * FROM student;

-- Q2) To display any name and date of birth from the table STUDENT.
SELECT StdName, DOB FROM student ;

-- Q3) To display all students record where percentage is greater of equal to 80 FROM student table.
SELECT * FROM student WHERE percentage >= 80;

-- Q4) To display student name, stream and percentage where percentage of student is more than 80.
SELECT StdName, Stream, Percentage WHERE percentage > 80;

-- Q5) To display all records of science students whose percentage is more than 75 form student table.
SELECT * FROM student WHERE stream = ‘Science’ AND percentage > 75; 