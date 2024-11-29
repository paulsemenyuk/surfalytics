-- Bad code formatting example:

SELECT A.name, E.event_id, count(E.event_id) OVER (PARTITION BY athlete_id ORDER BY event_date), E.event_date FROM athletes as A left join events as E on A.athlete_id=E.athlete_id


--Good code formatting example:

SELECT
    a.athlete_id,
    a.name,
    e.event_date,
    e.event_name,
    COUNT(e.event_id) OVER (PARTITION BY a.athlete_id ORDER BY e.event_date) AS cumulative_event_count
FROM
    athletes a
JOIN
    events e
ON
    a.athlete_id = e.athlete_id
ORDER BY
    a.athlete_id, e.event_date;
