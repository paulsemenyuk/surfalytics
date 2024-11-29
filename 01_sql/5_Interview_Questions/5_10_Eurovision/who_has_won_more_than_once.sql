-- Solution

SELECT
  Year,
  Country,
  Performer,
  Place
FROM `mythical-runner-358116.november24_test_eurovision.eurovision_1`
where Place like  '1 %'
order by Year desc
;
