# Part2_20_Sql_Questions
# 📘 SQL Practice Set – Part 2

This repository contains 20 intermediate-to-advanced SQL questions designed to strengthen your query-building skills and prepare for job interviews in data-related roles.

## 🧩 What's Included

- ✅ `create_tables.sql` – Script to create and populate `employees` and `attendance` tables
- ✅ `part2_queries.sql` – 20 SQL queries with comments and solutions
- ✅ Covers subqueries, aggregations, joins, filtering, and business logic

## 📌 Key Topics
- Aggregate functions: `MAX`, `AVG`, `COUNT`
- Subqueries: `IN`, `NOT IN`, `EXISTS`, correlated subqueries
- `GROUP BY` + `HAVING` logic
- Joins with real-world employee-attendance structure
- Practical conditions like:
  - Employees with no attendance
  - Employees always present
  - Department-level stats

## 📂 Use Cases
- 💼 Data analyst interview preparation
- 🏫 College 
- 🧠 SQL learning by real-world examples

---

## 👨‍💻 Author

**Mayank Tyagi**  
Chemical Engineering, Delhi Technological University

---

## ✅ Sample Query (Q5)
> **List employees who are not assigned any attendance record**
```sql
SELECT * 
FROM employees 
WHERE emp_id NOT IN (SELECT emp_id FROM attendance);
