-- Solution 1

SELECT
    e.employee_id,
    e.name AS employee_name
FROM
    employee e
JOIN
    employee m ON e.manager_id = m.employee_id
WHERE
    e.salary > m.salary;

-- Solution 2

SELECT
  emp.employee_id as employee_id,
  emp.name as employee_name
FROM employee as mgr
inner join employee as emp
    on mgr.employee_id=emp.manager_id
where
    emp.salary>mgr.salary;
