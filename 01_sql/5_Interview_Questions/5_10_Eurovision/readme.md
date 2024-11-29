# Eurovision Song Contest Project (SQL) and Google Sheets

### Table of content:
### I. Intro
### II. Resources
### III. SQL Tasks
### IV. Google Sheets Tasks

## Intro

In this project I worked with Eurovision Song Contest All-Time Finals Points dataset. I found the task on a Youtube channel of Roman Povzyk | Data Analyst Mentor and completed on my own.
Dataset is provided by JOHN CHRISTIAN AMBION and shared on Kaggle as a .CSV file.
This is the data showing all of the entries competing in the final show of every Eurovision Song Contest from 1957 to 2022, along with the points they received over their country's history.

## Resources

Google BigQuery (Google Cloud Platfor or GCP), Kaggle, Google Sheets

https://console.cloud.google.com/bigquery

https://www.kaggle.com/datasets/johnchristianambion/eurovision-song-contest-alltime-finals-points
Eurovision_AllFinals.csv(79.23 kB)
It has 8 columns.

Country - String
Year - Integer
Type - Boolean
Points - Integer
Place - String
Draw - Integer
Performer - String
Song - String

## SQL Tasks

I've added the dataset as a new table to BigQuery and followed the questions to write SQL querries.
Data is cleaned, however I was testing it for accuracy while wrighting the code to avoid duplicates, NULL, etc.

Source in Ukrainian:
https://www.youtube.com/watch?v=i-AYiadCv3o

1.	00:07:15 - SQL Task #1: Eurovision Winners Table
2.	00:11:49 - SQL Task #2: Top Countries by Number of Wins
3.	00:16:54 - SQL Task #3: Who Has Won More Than Once?
4.	00:18:29 - SQL Task #4: Largest Gap in Years Between Appearances at Eurovision

Tasks Solutions:
	•	eurovision_winners_table.sql
	•	top_countries_by_number_of_wins.sql
	•	who_has_won_more_than_once.sql
	•	largest_gap_in_years_between_appearances.sql

## Google Sheets Tasks

Added the dataset to Google Sheets and found 3 interesting topics that I can excract from dataset. My goals was to find dynamic data, not simple and static.

1. Difference in point between 1st and 2nd places over the years.
Built a Pivot table and a graph.
Cleaned the data to make sure it is accurate and years (when there were two winners) are not duplicating the score.

As a result, I was able to make a graph that helped visualize the results and easily find that Alexander Rybak, Kalush Orchestra and Salvador Sobral were the top 3.

2. Look at how the highest score grew over time for the winners.
Built a Pivot table and a graph.
As a result. In recent years, the amount of point incresed, due to voiting changes. And on a graph it is easy to spot the trend.

3. How many times Ukrainian artist were in top 3, top 5.
Built a Pivot Table.

As a result, showcased the years, performers and their scores.
