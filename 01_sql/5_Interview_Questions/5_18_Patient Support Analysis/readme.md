# Patient Support Analysis
## UnitedHealth SQL Interview Question

UnitedHealth Group (UHG) has a program called **Advocate4Me**, which allows policyholders (or members) to call an advocate and receive support for their healthcare needs. Services include:

- Claims and benefits support
- Drug coverage
- Pre- and post-authorization
- Medical records
- Emergency assistance
- Member portal services

## Query Task

Write a query to find how many UHG policyholders made **three or more calls**, assuming each call is identified by the `case_id` column.

---

## Table: callers

| Column Name         | Type       |
|---------------------|------------|
| `policy_holder_id`  | integer    |
| `case_id`           | varchar    |
| `call_category`     | varchar    |
| `call_date`         | timestamp  |
| `call_duration_secs`| integer    |

---

### Example Input:

| policy_holder_id | case_id                               | call_category         | call_date              | call_duration_secs |
|-------------------|---------------------------------------|-----------------------|------------------------|--------------------|
| 1                 | f1d012f9-9d02-4966-a968-bf6c5bc9a9fe | emergency assistance  | 2023-04-13T19:16:53Z  | 144                |
| 1                 | 41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab | authorization         | 2023-05-25T09:09:30Z  | 815                |
| 2                 | 9b1af84b-eedb-4c21-9730-6f099cc2cc5e | claims assistance     | 2023-01-26T01:21:27Z  | 992                |
| 2                 | 8471a3d4-6fc7-4
