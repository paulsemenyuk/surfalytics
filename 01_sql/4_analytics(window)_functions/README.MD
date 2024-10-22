# Window Functions in SQL: A Quick Guide

## Table of Contents
1. [Introduction](#introduction)
2. [What Are Window Functions?](#what-are-window-functions)
3. [Types of Window Functions](#types-of-window-functions)
4. [Window Function Examples](#window-function-examples)
   - [ROW_NUMBER()](#1-row_number)
   - [RANK()](#2-rank)
   - [DENSE_RANK()](#3-dense_rank)
   - [SUM() with PARTITION](#4-sum-with-partition)
   - [LAG() and LEAD()](#5-lag-and-lead)
5. [Using PARTITION BY](#using-partition-by)
6. [Conclusion](#conclusion)

---

## Introduction

Window functions in SQL are powerful tools that allow users to perform calculations across a set of rows related to the current row. Unlike aggregate functions, window functions do not reduce the result set; instead, they provide additional data while preserving the original rows.

---

## What Are Window Functions?

A **window function** operates on a subset of rows, known as a "window," within the result set. The term "window" refers to the rows that the function can access to perform calculations for each row. These functions are useful for ranking, running totals, moving averages, and more.

### Key Components:
- **`PARTITION BY`**: Divides the data into subsets or partitions for analysis.
- **`ORDER BY`**: Defines the order of rows within each partition.
- **Window Frame**: Optionally limits the range of rows considered for the calculation.

---

## Types of Window Functions

1. **Ranking Functions**: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `NTILE()`
2. **Aggregate Functions**: `SUM()`, `AVG()`, `MIN()`, `MAX()`
3. **Value Functions**: `LAG()`, `LEAD()`, `FIRST_VALUE()`, `LAST_VALUE()`

---

## Window Function Examples

### 1. ROW_NUMBER()

The `ROW_NUMBER()` function assigns a unique sequential number to each row within a partition.

```sql
SELECT
    customer_id,
    order_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders;
Output:
This query assigns a unique row number to each order per customer.

2. RANK()
RANK() provides a ranking for each row within a partition. If there are ties, it skips ranks.

sql
Copy code
SELECT
    employee_id,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
FROM employees;
Output:
Employees in each department are ranked by their salary. If two employees have the same salary, they receive the same rank, but the next rank is skipped.

3. DENSE_RANK()
DENSE_RANK() works similarly to RANK() but without gaps in ranking.

sql
Copy code
SELECT
    employee_id,
    department_id,
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank
FROM employees;
Output:
Ranks employees by salary, ensuring no gaps between ranks.

4. SUM() with PARTITION
This example demonstrates calculating a running total for each partition.

sql
Copy code
SELECT
    department_id,
    salary,
    SUM(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS running_total
FROM employees;
Output:
The query shows a cumulative total of salaries within each department.

5. LAG() and LEAD()
These functions access data from previous or subsequent rows within a partition.

sql
Copy code
SELECT
    employee_id,
    department_id,
    salary,
    LAG(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS previous_salary,
    LEAD(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS next_salary
FROM employees;
Output:
LAG() retrieves the salary from the previous row within the partition, and LEAD() retrieves the salary from the next row.

Using PARTITION BY

The PARTITION BY clause is essential in window functions when you want to group or partition rows into subsets. Each partition is treated independently, meaning the window function applies only to rows within each partition.

Example Without PARTITION BY:
sql
Copy code
SELECT
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees;
Output:
All employees are ranked globally by their salary, without any grouping.

Example With PARTITION BY:
sql
Copy code
SELECT
    employee_id,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank
FROM employees;
Output:
Now employees are ranked within each department rather than across the entire company.

Conclusion

Window functions, especially with the PARTITION BY clause, allow SQL users to perform complex calculations like ranking, cumulative sums, and accessing data across rows. Mastering window functions and understanding how to partition data will empower you to extract more insights from your datasets.
