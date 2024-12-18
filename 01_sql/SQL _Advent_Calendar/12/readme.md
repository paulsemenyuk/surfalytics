# Day 12 of SQL Advent Calendar 🎄

## Today's Question:
A collector wants to identify the top 3 snow globes with the highest number of figurines. Write a query to rank them and include their `globe_name`, number of figurines, and `material`.

### **Table: snow_globes**
| globe_id | globe_name         | volume_cm3 | material |
|----------|--------------------|------------|----------|
| 1        | Winter Wonderland  | 500        | Glass    |
| 2        | Santas Workshop    | 300        | Plastic  |
| 3        | Frozen Forest      | 400        | Glass    |
| 4        | Holiday Village    | 600        | Glass    |

### **Table: figurines**
| figurine_id | globe_id | figurine_type |
|-------------|----------|---------------|
| 1           | 1        | Snowman       |
| 2           | 1        | Tree          |
| 3           | 2        | Santa Claus   |
| 4           | 2        | Elf           |
| 5           | 2        | Gift Box      |
| 6           | 3        | Reindeer      |
| 7           | 3        | Tree          |
| 8           | 4        | Snowman       |
| 9           | 4        | Santa Claus   |
| 10          | 4        | Tree          |
| 11          | 4        | Elf           |
| 12          | 4        | Gift Box      |

---

### **Question Level of Difficulty:** **Hard**
![Grinch](https://www.sqlcalendar.com/grinch.svg)![Grinch](https://www.sqlcalendar.com/grinch.svg)![Grinch](https://www.sqlcalendar.com/grinch.svg)


---

### **Hints:**
- Use `COUNT()` to calculate the number of figurines for each snow globe.
- Use a `JOIN` to combine data from the `snow_globes` and `figurines` tables.
- Use `RANK()` to determine the top 3 snow globes based on the number of figurines.

---

### **Expected Output:**
| globe_name         | figurine_count | material |
|--------------------|----------------|----------|
| Holiday Village    | 5              | Glass    |
| Santas Workshop    | 3              | Plastic  |
| Winter Wonderland  | 2              | Glass    |

---

Good luck, and may your SQL skills shine bright like a snow globe! 😊
