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
