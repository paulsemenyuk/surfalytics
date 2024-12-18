# Day 16 of SQL Advent Calendar 🍬

## Today's Question:
As the owner of a candy store, you want to understand which of your products are selling best. Write a query to calculate the total revenue generated from each candy category.

### **Table: candy_sales**
| sale_id | candy_name       | quantity_sold | price_per_unit | category   |
|----------|-----------------|---------------|----------------|-------------|
| 1        | Candy Cane      | 20            | 1.5            | Sweets     |
| 2        | Chocolate Bar   | 10            | 2              | Chocolate  |
| 3        | Lollipop       | 5             | 0.75           | Sweets     |
| 4        | Dark Chocolate  | 8             | 2.5           | Chocolate  |
| 5        | Gummy Bears     | 15            | 1.2            | Sweets     |
| 6        | Chocolate Fudge  | 12            | 3              | Chocolate  |

---

### **Question Level of Difficulty:**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg)

---

### **Hints:**
- Multiply `quantity_sold` by `price_per_unit` to calculate revenue for each sale.
- Group your results by the `category` column and use the `SUM()` function to get total revenue.

---

### **Expected Output:**
| category   | total_revenue |
|-------------|--------------|
| Sweets      | 60           |
| Chocolate   | 110          |

---

Sweet success in analyzing candy sales revenue! 🍭✨
