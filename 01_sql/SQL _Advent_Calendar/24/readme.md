# Day 24 of SQL Advent Calendar 🎅🎁

## Today's Question
Santa is tracking how many presents he delivers each night leading up to Christmas. He wants a **running total** to see how many gifts have been delivered so far on any given night. Using the `deliveries` table, **calculate the cumulative sum** of gifts delivered, ordered by the delivery date.

### **Table: deliveries**

| delivery_date | gifts_delivered |
|---------------|-----------------|
| 2024-12-20    | 120             |
| 2024-12-21    | 150             |
| 2024-12-22    | 200             |
| 2024-12-23    | 300             |
| 2024-12-24    | 500             |

---

### Question Level of Difficulty: **Hard**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg)

**Hard**

---

### **Hints**
1. Consider using **window functions** like `SUM(...) OVER (ORDER BY delivery_date)` to generate a running total (if supported).
2. If window functions aren’t available, you may need a **self-join** or a **correlated subquery**.

---

### **Expected Output (Example)**
| delivery_date | gifts_delivered | cumulative_delivered |
|---------------|-----------------|----------------------|
| 2024-12-20    | 120             | 120                  |
| 2024-12-21    | 150             | 270                  |
| 2024-12-22    | 200             | 470                  |
| 2024-12-23    | 300             | 770                  |
| 2024-12-24    | 500             | 1270                 |

---

Keep stacking up those gifts until Christmas Eve—ho ho ho!
