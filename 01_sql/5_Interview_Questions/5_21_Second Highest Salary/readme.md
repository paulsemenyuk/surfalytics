# Second Highest Salary
## FAANG SQL Interview Question

# Finding the Second Highest Salary

## Scenario

You are an HR analyst at a tech company, and your manager wants to see how salaries are distributed. In particular, they want to know the **second highest salary** among all employees in the company. If multiple employees share that second highest salary, you only need to display it **once**—that is, no duplicates.

### Employee Table Schema

| column_name   | type     | description                               |
|---------------|----------|-------------------------------------------|
| employee_id   | integer  | The unique ID of the employee.            |
| name          | string   | The name of the employee.                 |
| salary        | integer  | The salary of the employee.               |
| department_id | integer  | The department ID of the employee.        |
| manager_id    | integer  | The manager ID of the employee.           |

---

### Example Input

| employee_id | name             | salary | department_id | manager_id |
|-------------|------------------|--------|---------------|------------|
| 1           | Emma Thompson    | 3800   | 1             | 6          |
| 2           | Daniel Rodriguez | 2230   | 1             | 7          |
| 3           | Olivia Smith     | 2000   | 1             | 8          |

In this sample dataset:
- The highest salary is **\$3,800** (Emma Thompson).
- The second highest salary is **\$2,230** (Daniel Rodriguez).
- The third salary is **\$2,000** (Olivia Smith).

---

### Example Output

| second_highest_salary |
|-----------------------|
| 2230                  |

Here, **\$2,230** is the second highest salary among all employees.

*The actual output will depend on the data in the table you’re querying.*

---
