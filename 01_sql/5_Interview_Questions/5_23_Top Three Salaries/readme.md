# Top Three Salaries
## FAANG SQL Interview Question

# Identifying High Earners by Department

## Scenario
Your manager wants a report listing the **top three earners** in each department. A "high earner" is defined as an employee whose salary **ranks among the top three** within that department. When there are **duplicate** salaries, each employee with that salary should appear, and the ordering rules should handle duplicates gracefully.

### **Key Requirements**:
1. Use an **appropriate ranking window function** to find the **top three salaries** per department.
2. **Sort Results**:
   - **Primary**: `department_name` in ascending order
   - **Secondary**: `salary` in descending order
   - **Tertiary**: employee `name` alphabetically if the same salary

*(Note: As of June 18th, we no longer require unique salaries, and the sorting order has been revised.)*

---

## Table Schemas

### **employee**
| column_name   | type    | description                             |
|---------------|---------|-----------------------------------------|
| employee_id   | integer | The unique ID of the employee.          |
| name          | string  | The name of the employee.               |
| salary        | integer | The salary of the employee.             |
| department_id | integer | The department ID of the employee.      |
| manager_id    | integer | The manager ID of the employee.         |

#### Example Input
| employee_id | name            | salary | department_id | manager_id |
|-------------|-----------------|--------|---------------|-----------|
| 1           | Emma Thompson   | 3800   | 1             | 6         |
| 2           | Daniel Rodriguez| 2230   | 1             | 7         |
| 3           | Olivia Smith    | 2000   | 1             | 8         |
| 4           | Noah Johnson    | 6800   | 2             | 9         |
| 5           | Sophia Martinez | 1750   | 1             | 11        |
| 6           | Liam Brown      | 13000  | 3             | *(null)*  |
| 7           | Ava Garcia      | 12500  | 3             | *(null)*  |
| 8           | William Davis   | 6800   | 2             | *(null)*  |
| 9           | Isabella Wilson | 11000  | 3             | *(null)*  |
| 10          | James Anderson  | 4000   | 1             | 11        |

---

### **department**
| column_name     | type    | description                  |
|-----------------|---------|------------------------------|
| department_id   | integer | The department ID (joins to `employee.department_id`). |
| department_name | string  | The name of the department.  |

#### Example Input
| department_id | department_name  |
|---------------|------------------|
| 1             | Data Analytics   |
| 2             | Data Science     |

---

## Expected Output (Example)
| department_name | name            | salary |
|-----------------|-----------------|--------|
| Data Analytics  | James Anderson  | 4000   |
| Data Analytics  | Emma Thompson   | 3800   |
| Data Analytics  | Daniel Rodriguez| 2230   |
| Data Science    | Noah Johnson    | 6800   |
| Data Science    | William Davis   | 6800   |

- In **Data Analytics**, the top three salaries are \$4,000, \$3,800, and \$2,230 (James, Emma, and Daniel, respectively).
- In **Data Science**, Noah Johnson and William Davis both earn \$6,800. Noah appears before William because **Noah** < **William** alphabetically.

*(The actual data in your tables may differ, so your output might not match exactly.)*
