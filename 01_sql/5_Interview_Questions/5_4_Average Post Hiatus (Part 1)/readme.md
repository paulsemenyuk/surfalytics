# Task 4. Average Post Hiatus (Part 1)

Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.

p.s. If you've read the Ace the Data Science Interview and liked it, consider writing us a review?

posts Table:

Column Name	Type
user_id	integer
post_id	integer
post_content	text
post_date	timestamp
posts Example Input:

user_id	post_id	post_content	post_date
151652	599415	Need a hug	07/10/2021 12:00:00
661093	624356	Bed. Class 8-12. Work 12-3. Gym 3-5 or 6. Then class 6-10. Another day that's gonna fly by. I miss my girlfriend	07/29/2021 13:00:00
004239	784254	Happy 4th of July!	07/04/2021 11:00:00
661093	442560	Just going to cry myself to sleep after watching Marley and Me.	07/08/2021 14:00:00
151652	111766	I'm so done with covid - need travelling ASAP!	07/12/2021 19:00:00
Example Output:

user_id	days_between
151652	2
661093	21
The dataset you are querying against may have different input & output - this is just an example!

Hint #1

Do you know how to obtain the last and first post per user? Try using the MIN and MAX functions, and then substract one from another.

Find more info about MAX and MIN functions.

Hint #2
First, DATE_PART is a useful function to extract a part of a date (e.g. day, month, year) from a given input date. Read more here

Check the code snippet below and replace 'part' with the desired granularity.

DATE_PART('part', post_date)
Psst, note that we can't use DATEDIFF and TIMESTAMPDIFF functions as these are MySQL's functions.

Hint #3
To focus on the users who have posted more than once, you can COUNT the number of posts and exclude users with 1 post only. What do you think, should you use HAVING or WHERE for this?

To offer some background, HAVING clause applies to the group as whole, while WHERE applies to individual rows.

What should I find?
--find first post: MIN()
--find last post: MAX()
--count days between max and min (2 options)
--filter by year 2021 extract(year from post_date)
--output used_id and days_between ()
--user should have at least 2 post or >1.

Output
user_id	days_between
151652	307
661093	206
