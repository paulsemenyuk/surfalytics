# SQL Advent Calendar 🎄
### Day 1: Multiple Activity Rentals

---

#### **Today's Question:**
A ski resort company wants to know which customers rented ski equipment for more than one type of activity (e.g., skiing and snowboarding).
List the **customer names** and the **number of distinct activities** they rented equipment for.

---

#### **Table Name: `rentals`**

| rental_id | customer_name | activity       | rental_date |
|-----------|---------------|----------------|-------------|
| 1         | Emily         | Skiing         | 2024-01-01  |
| 2         | Michael       | Snowboarding   | 2024-01-02  |
| 3         | Emily         | Snowboarding   | 2024-01-03  |
| 4         | Sarah         | Skiing         | 2024-01-01  |
| 5         | Michael       | Skiing         | 2024-01-02  |
| 6         | Michael       | Snowtubing     | 2024-01-02  |

---

#### **Expected Output:**

| customer_name | distinct_activities |
|---------------|---------------------|
| Emily         | 2                   |
| Michael       | 3                   |

---

#### **Difficulty Level:** **Medium**
![Grinch](https://www.sqlcalendar.com/grinch.svg)![Grinch](https://www.sqlcalendar.com/grinch.svg)![GrayGrinch](https://www.sqlcalendar.com/grinchGray.svg)
