-- Solution

SELECT
  Country,
  Performer,
  count(distinct Performer) as wins
FROM `*.november24_test_eurovision.eurovision_1`
where Place like  '1 %'
group by Country, Performer
having wins > 1
order by wins desc
;
