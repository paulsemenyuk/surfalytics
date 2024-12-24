# Day 23 of SQL Advent Calendar

## Today's Question:
The Grinch tracked his weight every day in December to analyze how it changed daily. Write a query to return the **weight change (in pounds)** for each day, calculated as the **difference from the previous day's weight**.

### **Table: grinch_weight_log**
| log_id | day_of_month | weight |
|--------|-------------|--------|
| 1      | 1           | 250    |
| 2      | 2           | 248    |
| 3      | 3           | 249    |
| 4      | 4           | 247    |
| 5      | 5           | 246    |
| 6      | 6           | 248    |

---

### Question Level of Difficulty: **Medium**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg)

---

### **Hints:**
- Use a **window function** like `LAG()` (in databases that support window functions) to subtract the previous day's weight from the current day's weight.
- Alternatively, you could **self-join** the table on `day_of_month = previous_day_of_month` if window functions aren’t available.
- Consider how to handle the **first day** (no previous day).

---

### **Expected Output (Example):**
| day_of_month | weight | daily_change |
|--------------|--------|-------------:|
| 1            | 250    | (null)       |
| 2            | 248    | -2           |
| 3            | 249    | +1           |
| 4            | 247    | -2           |
| 5            | 246    | -1           |
| 6            | 248    | +2           |

---

Cheers to a healthy holiday season, Grinch or not!
