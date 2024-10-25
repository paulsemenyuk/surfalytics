Task 1. Event Participation by Athlete (Sports Industry)

Problem Statement
You are tracking athletes and their participation in sporting events. The company wants to analyze the number of events each athlete has participated in over time. You have the following tables:

athletes table:

athlete_id | name      | sport       | country
-----------|-----------|-------------|---------
1          | Athlete A | tennis      | USA
2          | Athlete B | soccer      | Spain
3          | Athlete C | basketball  | USA
4          | Athlete D | tennis      | UK
5          | Athlete E | soccer      | Brazil

events table:

event_id  | athlete_id | event_date  | event_name
----------|------------|-------------|----------------
201       | 1          | 2023-01-10  | Grand Slam A
202       | 2          | 2023-02-15  | Soccer League
203       | 3          | 2023-03-05  | NBA Finals
204       | 4          | 2023-03-20  | Grand Slam B
205       | 1          | 2023-04-10  | Grand Slam C
206       | 2          | 2023-05-25  | Soccer League Finals

Question
For each athlete, calculate the cumulative number of events they have participated in, ordered by event date.


SELECT A.name, E.event_id, count(E.event_id) OVER (PARTITION BY athlete_id ORDER BY event_date), E.event_date FROM athletes as A left join events as E on A.athlete_id=E.athlete_id
GPT:

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

Task 2: Average Purchase Value and Most Recent Purchase by Customer (E-commerce Industry)
Problem Statement
You work for an e-commerce fashion retailer, and the company wants to analyze customer behavior in more detail. Specifically, they want to:

- Calculate the average purchase value for each customer.
- Identify the most recent purchase date for each customer.

purchases table:

purchase_id | customer_id | purchase_date | purchase_amount
------------|-------------|---------------|----------------
101         | 1           | 2023-01-10    | 100.00
102         | 2           | 2023-02-20    | 150.00
103         | 3           | 2023-03-15    | 50.00
104         | 1           | 2023-04-05    | 200.00
105         | 5           | 2023-06-25    | 75.00

Question
For each customer, calculate:

- The average purchase value (total amount spent divided by total purchases).
- The most recent purchase date for each customer.
- Display the results ordered by average purchase value in descending order.

Solution:
SEELECT
    customer_id,
    AVG(purchase_amount) as AVG_purchs,
    MAX(purchase_date) as recent_purchase
FROM purchases
GROUP BY customer_id
ORDER BY AVG_purchs DESC


Task 3.

Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

pages Table:

Column Name	Type
page_id	integer
page_name	varchar
pages Example Input:

page_id	page_name
20001	SQL Solutions
20045	Brain Exercises
20701	Tips for Data Analysts
page_likes Table:

Column Name	Type
user_id	integer
page_id	integer
liked_date	datetime
page_likes Example Input:

user_id	page_id	liked_date
111	20001	04/08/2022 00:00:00
121	20045	03/12/2022 00:00:00
156	20001	07/25/2022 00:00:00

Solution:
SELECT
  p.page_id
FROM pages p
FULL OUTER JOIN page_likes pl
  on p.page_id=pl.page_id
where liked_date is NULL
ORDER BY p.page_id
LIMIT 5;
