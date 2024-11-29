-- Solution

SELECT
  Performer,
  min(Year) as olders_performance,
  max(Year) as latest_performance,
  max(Year)-min(Year) as time_difference
FROM `mythical-runner-358116.november24_test_eurovision.eurovision_1`
group by Performer
having time_difference > 0
order by time_difference desc;
