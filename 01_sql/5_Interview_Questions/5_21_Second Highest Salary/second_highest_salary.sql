-- Simple solution

SELECT
  DISTINCT salary as second_highest_salary
FROM
  employee
ORDER BY
  salary DESC
LIMIT 1 OFFSET 1;

-- Solution Using Subquery

SELECT
    MAX(salary) AS second_highest_salary
FROM
    employee
WHERE
    salary < (
        SELECT MAX(salary)
        FROM employee
);
