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
