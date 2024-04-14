CREATE DATABASE crypto;
USE crypto;
CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(15), 
major VARCHAR(20)
);
DESCRIBE student;
SELECT *FROM student;
INSERT INTO student VALUES(1,"jack","biology");
INSERT INTO student VALUES(2,"kate","english");
INSERT INTO student VALUES(3,"megan","maths");
INSERT INTO student VALUES(4,"rekha","hindi");
UPDATE student
SET major='BIO'
WHERE major='biology';
DELETE FROM student
WHERE student_id=4;
SELECT s.name, s.major FROM student s
WHERE name="megan";
SELECT  s.name, s.major FROM student s
ORDER BY name DESC;
SELECT s.name, s.major FROM student s
WHERE major<>"bio";
SELECT*FROM student 
WHERE student_id>=2 AND name !='jack';
SELECT * FROM student
WHERE major IN('bio','maths') 
USE crypto;
CREATE TABLE employee(
emp_id INT,
first_name VARCHAR(15),
last_name VARCHAR(15),
birth_day date,
sex VARCHAR(1),
salary INT,
super_id INT,
branch_id INT,
PRIMARY KEY(emp_id)

);
SELECT * FROM employee;
USE crypto;
SELECT *FROM work_with;

CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(20),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY(mgr_id)REFERENCES employee(emp_id) ON DELETE SET NULL
);
ALTER TABLE employee
ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
;
ALTER TABLE employee
ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL
;

CREATE TABLE client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
CREATE TABLE work_with(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY (emp_id,client_id),
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
CREATE TABLE branch_supplier(
branch_id INT,
supplier_name VARCHAR(50),
supply_type VARCHAR(40),
PRIMARY KEY(branch_id,supplier_name),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
USE crypto;
SELECT * FROM employee;
SELECT * FROM branch;
INSERT INTO employee VALUES(100,"David","Wallace""1967-11-17","M",250000,NULL,NULL);
INSERT INTO branch VALUES(1,"Corporate",100,"2006-02-09");
UPDATE employee
SET branch_id=1
WHERE emp_id=100;
INSERT INTO employee VALUES(101,"JAN","Levinson","1961-05-11","F",110000,100,1);
INSERT INTO employee VALUES(102,"Michael","scott","1964-03-15","M",75000,100,NULL);
INSERT INTO branch VALUES(2,"SCRANTON",102,"1992-04-06");
UPDATE employee
SET branch_id=2
WHERE emp_id=102;
INSERT INTO employee VALUES(103,"ANGELA","MARTIN","1971-06-25","F",63000,102,2);
INSERT INTO employee VALUES(104,"KELLY","KAPOOR","1980-02-05","F",55000,102,2);
INSERT INTO employee VALUES(105,"STANLEY","HUDSON","1958-02-19","M",69000,102,2);
SELECT * FROM employee ORDER BY sex,first_name LIMIT 5;
SELECT first_name AS Forname,last_name AS surname FROM employee;
SELECT * FROM employee ORDER BY salary;
SELECT DISTINCT sex 
FROM employee;
SELECT DISTINCT super_id
FROM employee;
SELECT * FROM employee
WHERE sex="M"
ORDER BY first_name;
SELECT COUNT(emp_id) FROM employee;
SELECT * FROM employee
WHERE sex="F"
ORDER BY first_name;
SELECT COUNT(sex) from employee
WHERE sex ="f";
SELECT COUNT(birth_day) FROM employee
WHERE sex="M" AND birth_day>="1969-01-01";
SELECT AVG(salary)
FROM employee; WHERE sex="F";
SELECT SUM(salary)
FROM employee WHERE sex="m";
SELECT COUNT(sex) AS COUNT,sex
FROM employee
GROUP BY sex;
SELECT COUNT(sex) AS COUNT,branch_id
FROM employee
GROUP BY branch_id;
SELECT SUM(total_sales),client_id
FROM work_with
GROUP BY client_id;




