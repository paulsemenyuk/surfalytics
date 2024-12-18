# Day 13 of SQL Advent Calendar 🎅

## Today's Question:
We need to make sure Santa's sleigh is properly balanced. Find the total weight of gifts for each recipient.

### **Table: gifts**
| gift_id | gift_name      | recipient | weight_kg |
|---------|----------------|-----------|-----------|
| 1       | Toy Train      | John      | 2.5       |
| 2       | Chocolate Box  | Alice     | 0.8       |
| 3       | Teddy Bear     | Sophia    | 1.2       |
| 4       | Board Game     | John      | 0.9       |

---

### **Question Level of Difficulty:**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg)

---

### **Hints:**
- Use `SUM()` to calculate the total weight of gifts for each recipient.
- Group the results by `recipient` to get totals per individual.

---

### **Expected Output:**
| recipient | total_weight_kg |
|-----------|-----------------|
| John      | 3.4             |
| Alice     | 0.8             |
| Sophia    | 1.2             |

---

Wishing you success in balancing Santa’s sleigh! 🎁
