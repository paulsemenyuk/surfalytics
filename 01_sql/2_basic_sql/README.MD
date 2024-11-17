# Basic SQL

## A Beginner's Guide to Basic SQL with Examples

## Table of Contents
### Intro

### 1. Selecting Data with SELECT

### 2. Filtering Data with WHERE

### 3. Sorting Data with ORDER BY

### 4. Inserting Data with INSERT INTO

### 5. Updating Data with UPDATE

### 6. Deleting Data with DELETE

### 7. Using Aggregate Functions

### 8. Grouping Data with GROUP BY

### 9. Filtering Groups with HAVING

### 10. Next Steps

## Intro
Structured Query Language (SQL) is the standard language for interacting with relational databases. Whether you're retrieving data, inserting new records, or updating existing ones, SQL provides the tools you need. This guide introduces the basic SQL commands with practical examples to help you get started.

## 1. Selecting Data with SELECT
The SELECT statement retrieves data from one or more tables.

Syntax:

```sql
SELECT column1, column2, ...
FROM table_name;
```
Example:

Retrieve all columns from the Employees table:

```sql
SELECT * FROM Employees;
```
Retrieve specific columns:

```sql
SELECT first_name, last_name, salary FROM Employees;
```
## 2. Filtering Data with WHERE
The WHERE clause filters records based on specified conditions.

Syntax:

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```
Example:

Get employees with a salary greater than 50,000:

```sql
SELECT first_name, last_name, salary
FROM Employees
WHERE salary > 50000;
```

Better example of 5 Ways To Filter Data With WHERE in SQL
https://datalemur.com/sql-tutorial/sql-filter-data

## 3. Sorting Data with ORDER BY
The ORDER BY clause sorts the result set in ascending (ASC) or descending (DESC) order.

Syntax:

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
```
Example:

List employees by salary in descending order:

```sql
SELECT first_name, last_name, salary
FROM Employees
ORDER BY salary DESC;
```
## 4. Inserting Data with INSERT INTO
The INSERT INTO statement adds new records to a table.

Syntax:

```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```
Example:

Add a new employee:

```sql
INSERT INTO Employees (first_name, last_name, department_id, salary)
VALUES ('Jane', 'Doe', 5, 60000);
```
## 5. Updating Data with UPDATE
The UPDATE statement modifies existing records.

Syntax:

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```
Example:

Increase the salary of employee with ID 101:

```sql
UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 101;
```
## 6. Deleting Data with DELETE
The DELETE statement removes records from a table.

Syntax:

```sql
DELETE FROM table_name
WHERE condition;
```
Example:

Remove an employee who has left the company:

```sql
DELETE FROM Employees
WHERE employee_id = 102;
```
## 7. Using Aggregate Functions
Aggregate functions perform calculations on multiple values and return a single value.

COUNT(): Returns the number of rows.
SUM(): Calculates the total sum.
AVG(): Calculates the average value.
MAX(): Finds the maximum value.
MIN(): Finds the minimum value.
Example:

Count the number of employees:

```sql
SELECT COUNT(*) AS total_employees FROM Employees;
```
Calculate the average salary:

```sql
SELECT AVG(salary) AS average_salary FROM Employees;
```
## 8. Grouping Data with GROUP BY
The GROUP BY clause groups rows that have the same values in specified columns.

Syntax:

```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;
```
Example:

Get the number of employees in each department:

```sql
SELECT department_id, COUNT(*) AS employee_count
FROM Employees
GROUP BY department_id;
```
## 9. Filtering Groups with HAVING
The HAVING clause filters groups based on aggregate conditions.

Example:

Find departments with more than 5 employees:

```sql
SELECT department_id, COUNT(*) AS employee_count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) > 5;
```
## 10. Next Steps
This guide covers the fundamental SQL commands for basic data manipulation and retrieval.
For more advanced topics like joins, subqueries, and transactions follow the link to Advanced SQL: https://github.com/paulsemenyuk/surfalytics/tree/58c3eacb885538cfa5bd971f66cceb8bbe68ae92/01_sql/3_advanced_sql .

Or try
https://sqlbolt.com or https://solhsa.com/g3/

Conclusion

These basic SQL commands form the foundation for interacting with relational databases. By mastering them, you can perform essential data operations and build more complex queries as you advance.
