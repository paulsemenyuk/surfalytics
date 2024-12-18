# Day 18 of SQL Advent Calendar ☀️🎅

## Today's Question:
A travel agency is promoting activities for a "Summer Christmas" party. They want to identify the top 2 activities based on the average rating. Write a query to rank the activities by average rating.

### **Table: activities**
| activity_id | activity_name   |
|--------------|----------------|
| 1            | Surfing Lessons |
| 2            | Jet Skiing     |
| 3            | Sunset Yoga    |

---

### **Table: activity_ratings**
| rating_id | activity_id | rating |
|------------|-------------|---------|
| 1          | 1           | 4.7     |
| 2          | 1           | 4.8     |
| 3          | 1           | 4.9     |
| 4          | 2           | 4.6     |
| 5          | 2           | 4.7     |
| 6          | 2           | 4.8     |
| 7          | 2           | 4.9     |
| 8          | 3           | 4.8     |
| 9          | 3           | 4.7     |
| 10         | 3           | 4.9     |
| 11         | 3           | 4.8     |
| 12         | 3           | 4.9     |

---

### **Question Level of Difficulty:** **Hard**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg)

---

### **Hints:**
- Calculate the average rating for each activity by using the `AVG()` function.
- Rank the activities based on their average rating in descending order.
- Use the `LIMIT` clause to get only the top 2 activities.

---

### **Expected Output**
| activity_name   | average_rating |
|-----------------|----------------|
| Surfing Lessons  | 4.8            |
| Sunset Yoga     | 4.85           |

---

Surf into top ratings for a summer Christmas adventure! 🏄‍♂️🎁
