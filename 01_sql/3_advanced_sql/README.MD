# Advanced SQL

## Table of Content
### I. Views in SQL

	1.	Introduction to SQL Views
	2.	Creating and Using Views
	3.	Updating, Modifying, and Dropping Views
	4.	Benefits of Views

### II. Stored Procedures and Transactions

	1.	Overview of Stored Procedures
	2.	Creating and Executing Procedures
	3.	Understanding Transactions and ACID Properties
	4.	Using Transactions: Fund Transfer Example
	5.	Combining Procedures with Transactions

### III. Joins in SQL

	1.	Overview of Joins
	2.	Types of Joins (Inner, Left, Right, Full)
	3.	Joining Multiple Tables
	4.	Using Aliases
	5.	Self-Joins
	6.	Conclusion on SQL Joins

### IV. Practice Lab (JOINS)

#### Advertiser Status
#### Facebook SQL Interview Question

You're provided with two tables:

- The `advertiser` table contains information about advertisers and their respective payment status.
- The `daily_pay` table contains the current payment information for advertisers, and it only includes advertisers who have made payments.

#### Task
Write a query to update the payment status of Facebook advertisers based on the information in the `daily_pay` table. The output should include the `user_id` and their current payment status, sorted by the `user_id`.

#### Payment Status Categories
The payment status of advertisers can be classified into the following categories:

- **New**: Advertisers who are newly registered and have made their first payment.
- **Existing**: Advertisers who have made payments in the past and have recently made a current payment.
- **Churn**: Advertisers who have made payments in the past but have not made any recent payment.
- **Resurrect**: Advertisers who have not made a recent payment but may have made a previous payment and have made a payment again recently.

#### Payment Status Transitions
The possible transitions in the advertiser's status based on the payment status are summarized in the table below:

| #   | Current Status | Updated Status | Payment on Day T |
|-----|----------------|----------------|------------------|
| 1   | NEW            | EXISTING       | Paid             |
| 2   | NEW            | CHURN          | Not paid         |
| 3   | EXISTING       | EXISTING       | Paid             |
| 4   | EXISTING       | CHURN          | Not paid         |
| 5   | CHURN          | RESURRECT      | Paid             |
| 6   | CHURN          | CHURN          | Not paid         |
| 7   | RESURRECT      | EXISTING       | Paid             |
| 8   | RESURRECT      | CHURN          | Not paid         |

- **Current Status**: Represents the advertiser's current status.
- **Updated Status**: Represents the updated payment status based on the conditions.
- **Payment on Day T**: Indicates whether the advertiser made a payment on a specific day (T) or not.

#### Key Transition Rules
- **No Payment on Day T**: For rows 2, 4, 6, and 8, if an advertiser does not make a payment, their payment status transitions to "CHURN" regardless of their previous status.
- **Payment on Day T**: For rows 1, 3, 5, and 7, if an advertiser makes a payment, their status updates to either "EXISTING" or "RESURRECT" based on their previous status. If the previous status was "CHURN," the updated status is "RESURRECT." For any other previous status, the updated status is "EXISTING."

#### Tables

#### `advertiser` Table

| Column Name | Type   |
|-------------|--------|
| `user_id`   | string |
| `status`    | string |

**Example Input:**

| user_id | status   |
|---------|----------|
| bing    | NEW      |
| yahoo   | NEW      |
| alibaba | EXISTING |

#### `daily_pay` Table

| Column Name | Type    |
|-------------|---------|
| `user_id`   | string  |
| `paid`      | decimal |

**Example Input:**

| user_id | paid   |
|---------|--------|
| yahoo   | 45.00  |
| alibaba | 100.00 |
| target  | 13.00  |

#### Example Output

| user_id  | new_status |
|----------|------------|
| bing     | CHURN      |
| yahoo    | EXISTING   |
| alibaba  | EXISTING   |

#### Explanation

1. The advertiser **"bing"** is classified as "CHURN" because no payment record is found in the `daily_pay` table.
2. The advertiser **"yahoo"** is labeled as "EXISTING" since they have made a recent payment, as indicated by the presence of their payment record.
3. Similarly, the advertiser **"alibaba"** is also classified as "EXISTING" due to their recent payment.

---

> **Note**: The dataset you are querying against may have different input and output — this is just an example!

#### Solution is in practice_lab_joins.sql file

## I. Views in SQL
An Introduction to SQL Views with Practical Examples

In SQL, a view is a virtual table that represents the result of a stored query. It doesn't hold data itself but displays data stored in other tables, simplifying complex queries and enhancing data security.

What Are SQL Views?
Virtual Tables: Views act like tables but don't store data physically.
Simplify Queries: They encapsulate complex joins and calculations.
Enhance Security: Limit user access to specific data within tables.
Creating a View
Use the CREATE VIEW statement:

```sql
CREATE VIEW view_name AS
SELECT columns
FROM tables
WHERE conditions;
Example 1: Simplifying Complex Queries
Scenario: Frequently retrieve employee names with their department names.
```
Create the View:

```sql
CREATE VIEW EmployeeDepartments AS
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;
```
Use the View:

```sql
SELECT * FROM EmployeeDepartments;
Example 2: Restricting Data Access
Scenario: Allow users to see employee names but not salaries.
```
Create the View:

```sql
CREATE VIEW PublicEmployeeInfo AS
SELECT first_name, last_name, department_id
FROM Employees;
```
Grant Access:

```sql
GRANT SELECT ON PublicEmployeeInfo TO public_user_group;
```
Example 3: Presenting Aggregated Data
Scenario: Show total employees in each department.

Create the View:

```sql
CREATE VIEW DepartmentEmployeeCounts AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
```
Use the View:

```sql
SELECT * FROM DepartmentEmployeeCounts;
```
Updating Data Through Views
Some views allow data modification if they meet certain conditions (e.g., based on a single table without aggregates).

Example:

```sql
CREATE VIEW SalesTeam AS
SELECT employee_id, first_name, last_name
FROM Employees
WHERE department_id = 3;
```
Insert Data:

```sql
INSERT INTO SalesTeam (first_name, last_name)
VALUES ('Jane', 'Smith');
```
Modifying and Dropping Views
Modify a View:
```sql
CREATE OR REPLACE VIEW view_name AS
SELECT columns FROM tables WHERE conditions;
```
Drop a View:
```sql
DROP VIEW view_name;
```
Benefits of Using Views
Simplify Complex Queries
Enhance Data Security
Provide Data Abstraction
Improve Maintainability
Conclusion

SQL views are powerful tools for simplifying data retrieval and enforcing security. By using views, you can make your SQL queries cleaner and provide users with tailored access to the data they need.

## II. Stored Procedures and Transactions in SQL

A Quick Guide to Stored Procedures and Transactions in SQL

Stored procedures and transactions are essential for efficient and secure database operations. Here's a brief overview with examples.

Stored Procedures
What Are They?

Stored Procedures are named collections of SQL statements stored in the database.
They promote code reuse, improve performance, and enhance security.
Creating a Stored Procedure

Example: Retrieve employees by department.

```sql
CREATE PROCEDURE GetEmployeesByDepartment @DepartmentID INT AS
BEGIN
    SELECT employee_id, first_name, last_name, salary
    FROM Employees
    WHERE department_id = @DepartmentID;
END;
```
Executing the Procedure

```sql
EXEC GetEmployeesByDepartment @DepartmentID = 5;
```
Transactions
What Are They?

A Transaction is a group of SQL operations executed as a single unit.
Ensures data integrity using ACID properties:
Atomicity
Consistency
Isolation
Durability
Using Transactions

Example: Transfer funds between accounts.

```sql
BEGIN TRANSACTION;

UPDATE Accounts
SET balance = balance - 100
WHERE account_id = 1;

UPDATE Accounts
SET balance = balance + 100
WHERE account_id = 2;

IF @@ERROR <> 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
```
Combining Stored Procedures and Transactions
Example: Stored procedure for transferring funds safely.

```sql
CREATE PROCEDURE TransferFunds
    @FromAccountID INT,
    @ToAccountID INT,
    @Amount DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRANSACTION;

    UPDATE Accounts
    SET balance = balance - @Amount
    WHERE account_id = @FromAccountID;

    UPDATE Accounts
    SET balance = balance + @Amount
    WHERE account_id = @ToAccountID;

    IF @@ERROR <> 0
        ROLLBACK TRANSACTION;
    ELSE
        COMMIT TRANSACTION;
END;
```
Executing the Procedure

```sql
EXEC TransferFunds @FromAccountID = 1, @ToAccountID = 2, @Amount = 100.00;
```
Key Takeaways

Stored Procedures streamline and secure SQL code.
Transactions ensure data integrity during multiple operations.

## III. JOINSJoins in SQL
Mastering SQL Joins: Combining Data Across Multiple Tables

In relational databases, data is organized into tables to reduce redundancy and improve efficiency. Often, you need to retrieve data that spans multiple tables to gain meaningful insights. This is where SQL joins come into play. A join combines the rows from two or more tables based on a relationship between certain columns in these tables.

Understanding Joins
At its core, a join allows you to combine related data from different tables into a single result set. This is achieved by specifying the columns that establish the relationship between the tables.

Key Points:

Joins combine rows from two or more tables based on related columns.
To join three or more tables, you simply add additional join clauses to your SQL statement.
Types of Joins
There are two primary types of table joins in SQL: inner joins and outer joins. Outer joins are further divided into three subtypes.

Inner Join: Returns only the rows where there is a match in both tables.
Most Common Type: Inner joins are the most frequently used joins because they return only matching records, providing precise and relevant data.
Syntax Example:

```sql
SELECT *
FROM table1
INNER JOIN table2 ON table1.common_column = table2.common_column;
```
Outer Join: Returns all records from one table and the matched records from the second table. Unmatched records will show NULL for columns from the other table.
Left Outer Join: Returns all records from the left table and matched records from the right table.
```sql
SELECT *
FROM table1
LEFT OUTER JOIN table2 ON table1.common_column = table2.common_column;
```
Right Outer Join: Returns all records from the right table and matched records from the left table.
```sql
SELECT *
FROM table1
RIGHT OUTER JOIN table2 ON table1.common_column = table2.common_column;
```
Full Outer Join: Returns all records when there is a match in either left or right table.
```sql
SELECT *
FROM table1
FULL OUTER JOIN table2 ON table1.common_column = table2.common_column;
```
Joining Multiple Tables
To combine data from three or more different tables, you add additional join clauses to your SQL statement. Each join connects two tables, and you can chain as many joins as needed.

Example:

Suppose you have three tables: students, enrollments, and courses. You want to list each student along with the courses they're enrolled in.

```sql
SELECT
    s.student_name,
    c.course_name
FROM students AS s
INNER JOIN enrollments AS e ON s.student_id = e.student_id
INNER JOIN courses AS c ON e.course_id = c.course_id;
```
Explanation:

First Join: students joined with enrollments on student_id.
Second Join: enrollments joined with courses on course_id.
Using Aliases
You can use an alias as shorthand for table or column names, making your SQL queries cleaner and more readable.

Syntax Example:

```sql
SELECT
    t1.column_name,
    t2.column_name
FROM table1 AS t1
INNER JOIN table2 AS t2 ON t1.common_column = t2.common_column;
```
Benefits:

Simplifies Queries: Shorter names make complex queries easier to understand.
Clarifies Column References: Especially useful when joining tables with columns of the same name.
Self-Joins
A self-join is when a table is joined with itself to compare rows within the same table.

Example:

Find pairs of employees who work in the same department.

```sql
SELECT
    e1.employee_name AS Employee1,
    e2.employee_name AS Employee2,
    e1.department_id
FROM employees AS e1
INNER JOIN employees AS e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id < e2.employee_id;
```
Explanation:

e1 and e2 are aliases for the same employees table.
Comparison: We're looking for pairs where e1.department_id equals e2.department_id.
Condition: e1.employee_id < e2.employee_id ensures that each pair is unique and avoids duplicate combinations.
Conclusion
Understanding SQL joins is essential for effective database querying:

Joins combine rows from two or more tables based on related columns.
Inner joins return only matching rows, making them the most commonly used join.
Outer joins allow you to include unmatched rows from one or both tables.
Joining multiple tables involves adding more join clauses to your SQL statement.
Aliases simplify your queries and make them more readable.
Self-joins enable you to compare rows within the same table.
By mastering these concepts, you can efficiently retrieve and manipulate data across complex relational database structures.

## IV. Practive Lab (JOINS)
https://tinyurl.com/yjhsun8e

Author
Ramesh Sannareddy

Contribtuor
Rav Ahuja
