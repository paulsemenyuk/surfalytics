-- Task 1 Solution

SELECT
  Year,
  Country,
  Performer,
  Place
FROM `*.november24_test_eurovision.eurovision_1`
order by place
;

-- Task 2 Solution

SELECT
  Year,
  Country,
  Performer,
  Points,
  Place
FROM `*.november24_test_eurovision.eurovision_1`
WHERE Place NOT LIKE '1 %'
ORDER BY Points DESC
LIMIT 5;
