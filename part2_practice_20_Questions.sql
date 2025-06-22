create database pawan;
use pawan;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Arjun', 'Sales', 60000, '2021-01-10', 'Delhi'),
(2, 'Simran', 'IT', 85000, '2020-06-15', 'Bangalore'),
(3, 'Rahul', 'IT', 85000, '2019-03-20', 'Bangalore'),
(4, 'Neha', 'HR', 50000, '2022-11-01', 'Mumbai'),
(5, 'Kunal', 'Sales', 72000, '2018-09-18', 'Delhi'),
(6, 'Aisha', 'Finance', 65000, '2021-07-25', 'Mumbai'),
(7, 'Vikram', 'Finance', 75000, '2020-02-10', 'Delhi'),
(8, 'Anita', 'Sales', 72000, '2019-12-30', 'Bangalore'),
(9, 'Ramesh', 'IT', 92000, '2023-01-10', 'Delhi'),
(10, 'Meera', 'HR', 50000, '2020-04-01', 'Mumbai');
CREATE TABLE attendance (
    att_id INT PRIMARY KEY,
    emp_id INT,
    work_date DATE,
    status VARCHAR(10), -- 'Present' or 'Absent'
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance VALUES
(1, 1, '2023-06-01', 'Present'),
(2, 1, '2023-06-02', 'Absent'),
(3, 2, '2023-06-01', 'Present'),
(4, 3, '2023-06-01', 'Present'),
(5, 4, '2023-06-01', 'Absent'),
(6, 5, '2023-06-01', 'Present'),
(7, 6, '2023-06-01', 'Present'),
(8, 7, '2023-06-01', 'Present'),
(9, 8, '2023-06-01', 'Absent'),
(10, 9, '2023-06-01', 'Present');
-- Ques1)list all the employees who earn the same salary as another employee.-- 
select * from employees as e1 where exists( select 1 from employees as e2 where e1.salary=e2.salary and e1.emp_id<>e2.emp_id);
-- Ques2)find the highest salary paid in each department-- 
select max(salary),department from employees group by department;
-- Ques3)Display the department(s) where the average salary is greater than RS.72000-- 
select department,avg(salary) from employees group by department having avg(salary)>72000;
-- Ques4)Show employees who work in cities that have more than 2 employees.-- 
select name,city from employees where city in (select city from employees group by city having count(emp_id)>2);
-- Ques5)list all the employees who are not assignment any attendence record.-- 
select * from employees where emp_id not in ( select emp_id from attendance);
show tables;
-- Ques6)find departments with exactly 1 employee-- 
select department, count(emp_id) from employees group by department having count(emp_id) =1;
-- Ques7)List the employee(s) with the second highest salary in the company(no window/limit/top)-- 
select emp_id,name,max(salary) from employees where salary < (select max(salary) from employees); 
-- Ques8)Display employees who have not never been marked absent in the attendance table. -- 
select emp_id,name from employees where emp_id not in (select emp_id from attendance where status="absent");
-- Ques9)Get the names and departments of employees who joined before 2020 and earn more than overall avg salary-- 
select name , department,salary from employees  where join_date<"2020-01-01" and salary>(select avg(salary) from employees);
-- Ques10)Find the number of employees marked absent on 2023-06-1.-- 
select count(emp_id) from attendance where work_date ="2023-06-01" and status = "absent";
-- Ques11)Show the name of employees who belong to same department as "simaran".-- 
select name,department from employees  where department = ( select department from employees where name="Simran");
-- Ques12)List employees who have the maximum salary in their city.-- 
select max(salary),city from employees group by city;
-- Ques13)Find the total number of working days (attendence records) for each employees-- 
select count(work_date),emp_id from attendance group by emp_id;
-- Ques14)Retrieve employee(s) who joined in the same year as 'Ramesh'--  
select name,join_date from employees where year(join_date)=(select year(join_date) from employees where name="Ramesh");
-- Ques15)get all departments where no one has a salary less than Rs.60000-- 
select department,salary from employees group by department having salary>60000;
-- Ques16)List all cities where the finance department employees are posted-- 
select name,city from employees where department="Finance";
-- Ques17)Find employees who earn more than any employee in HR-- 
select name,salary from employees 
where salary > any(select salary from employees where department="HR");
-- Ques18) Display the department and total number of absent in each.-- 
select e.department,count(a.status) from attendance as a
join employees as e on e.emp_id=a.emp_id
where a.status="absent"
group by e.department;
-- Ques19) List the lastest joined employee in each department.-- 
select name,join_date,department from employees e1
where join_date=(select max(join_date) from employees e2 where e1.department=e2.department);
-- Ques20) Get the names of employees who have never been present on any day.-- 
select name from employees where emp_id not in (select emp_id from attendance where status="present");



