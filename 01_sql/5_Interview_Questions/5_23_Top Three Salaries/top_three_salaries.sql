-- Solution

WITH ranked_salary AS (
  SELECT
    name,
    salary,
    department_id,
    DENSE_RANK() OVER (
      PARTITION BY department_id ORDER BY salary DESC) AS ranking
  FROM employee
)

SELECT
  d.department_name,
  rs.name,
  rs.salary
FROM ranked_salary AS rs
INNER JOIN department AS d
  ON rs.department_id = d.department_id
WHERE rs.ranking <= 3
ORDER BY
   d.department_name,
   rs.salary DESC,
  rs.name;

  -- Solution with Subquery

  SELECT
    d.department_name,
    e.name,
    e.salary
FROM (
    SELECT
        employee_id,
        name,
        salary,
        department_id,
        RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC, name ASC
        ) AS salary_rank
    FROM employee
) AS ranked
JOIN department d ON ranked.department_id = d.department_id
JOIN employee e   ON ranked.employee_id = e.employee_id
WHERE salary_rank <= 3
ORDER BY
    d.department_name ASC,
    salary DESC,
    name ASC;
