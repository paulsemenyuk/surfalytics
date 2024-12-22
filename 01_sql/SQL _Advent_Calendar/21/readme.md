# Day 21 of SQL Advent Calendar 🎅🎄

## Today's Question:
Santa needs to optimize his sleigh for Christmas deliveries. Write a query to calculate the total weight of gifts for each recipient type (**good** or **naughty**) and determine what percentage of the total weight is allocated to each type. Include the `recipient_type`, `total_weight`, and `weight_percentage` in the result.

### **Table: gifts**

| gift_id | gift_name      | recipient_type | weight_kg |
|---------|----------------|----------------|-----------|
| 1       | Toy Train      | good           | 2.5       |
| 2       | Lumps of Coal  | naughty        | 1.5       |
| 3       | Teddy Bear     | good           | 1.2       |
| 4       | Chocolate Bar  | good           | 0.3       |
| 5       | Board Game     | naughty        | 1.8       |

---

### **Question Level of Difficulty:** **Hard**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg)

---

### **Hints:**

1. **Sum the total weights** for each recipient type using `GROUP BY`.
2. To get the **overall total**, consider using a **CTE** or subquery.
3. **Calculate the percentage** by dividing each type’s total weight by the overall total weight, then multiplying by 100.

---

### **Expected Output (Example):**

| recipient_type | total_weight | weight_percentage |
|----------------|-------------:|------------------:|
| good           | 4.0          | 72.73            |
| naughty        | 3.3          | 27.27            |

*(Values shown here are for illustration; actual calculations depend on the data.)*

---

Happy sleigh-optimizing! May Santa’s deliveries be swift and well-balanced. ✨
