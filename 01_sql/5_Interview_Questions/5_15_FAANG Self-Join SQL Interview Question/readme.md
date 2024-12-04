# Well Paid Employees
## FAANG SQL Interview Question


## Problem Statement
Given a table of salary data, identify all employees who earn more than their direct managers. The table contains the following columns:

| Column         | Type    |
|----------------|---------|
| employee_id    | integer |
| name           | text    |
| salary         | decimal |
| department_id  | integer |
| manager_id     | integer |

### Example Input:

| employee_id | name             | salary | department_id | manager_id |
|-------------|------------------|--------|---------------|------------|
| 1           | Emma Thompson    | 3800   | 1             | 6          |
| 2           | Daniel Rodriguez | 2230   | 1             | 7          |
| 3           | Olivia Smith     | 7000   | 1             | 8          |
| 4           | Noah Johnson     | 6800   | 2             | 9          |
| 5           | Sophia Martinez  | 1750   | 1             | 11         |
| 6           | Liam Brown       | 13000  | 3             | NULL       |
| 7           | Ava Garcia       | 12500  | 3             | NULL       |
| 8           | William Davis    | 6800   | 2             | NULL       |

### Expected Output:

| employee_id | employee_name |
|-------------|---------------|
| 3           | Olivia Smith  |

**Explanation**: Olivia Smith earns $7,000, which is more than her manager William Davis, who earns $6,800.

---
