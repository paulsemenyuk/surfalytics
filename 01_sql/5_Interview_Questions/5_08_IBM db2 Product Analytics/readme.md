# IBM Db2 Query Usage Analysis

## Objective
IBM aims to analyze how employees are utilizing the Db2 database by:
1. Generating data for a histogram showing the number of **unique queries** run by employees during **Q3 2023 (July to September)**.
2. Counting the number of employees who did not run any queries during this period.

The histogram categories represent the number of unique queries, and the corresponding values indicate the count of employees who ran that many unique queries.

---

## Input Tables

### Table: `queries`
| Column Name       | Data Type   | Description                                  |
|--------------------|-------------|----------------------------------------------|
| employee_id        | integer     | The ID of the employee who executed the query. |
| query_id           | integer     | The unique identifier for each query (Primary Key). |
| query_starttime    | datetime    | The timestamp when the query started.       |
| execution_time     | integer     | The duration of the query execution in seconds. |

#### Example Input: `queries`
| employee_id | query_id | query_starttime     | execution_time |
|-------------|----------|---------------------|----------------|
| 226         | 856987   | 07/01/2023 01:04:43 | 2698           |
| 132         | 286115   | 07/01/2023 03:25:12 | 2705           |
| 221         | 33683    | 07/01/2023 04:34:38 | 91             |
| 240         | 17745    | 07/01/2023 14:33:47 | 2093           |
| 110         | 413477   | 07/02/2023 10:55:14 | 470            |

---

### Table: `employees`
| Column Name | Data Type   | Description                        |
|-------------|-------------|------------------------------------|
| employee_id | integer     | The ID of the employee.            |
| full_name   | string      | The full name of the employee.     |
| gender      | string      | The gender of the employee.        |

#### Example Input: `employees`

| employee_id | full_name          | gender  |
|-------------|--------------------|---------|
| 1           | Judas Beardon      | Male    |
| 2           | Lainey Franciotti  | Female  |
| 3           | Ashbey Strahan     | Male    |

---
## Example Output

| unique_queries | employee_count |
|----------------|----------------|
| 0              | 191            |
| 1              | 46             |
| 2              | 12             |
| 3              | 1              |

### Description of the Output
- **0 unique queries**: 191 employees did not run any queries during the period.
- **1 unique query**: 46 employees executed exactly one unique query.
- **2 unique queries**: 12 employees executed two unique queries.
- **3 unique queries**: 1 employee executed three unique queries.
