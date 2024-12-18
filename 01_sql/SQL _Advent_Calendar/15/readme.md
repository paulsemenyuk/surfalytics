# Day 15 of SQL Advent Calendar 👨‍👩‍👧‍👦

## Today's Question:
A family reunion is being planned, and the organizer wants to identify the three family members with the most children. Write a query to calculate the total number of children for each parent and rank them. Include the parent’s name and their total number of children in the result.

### **Table: family_members**
| member_id | name   | age |
|------------|---------|-----|
| 1          | Alice   | 30  |
| 2          | Bob     | 58  |
| 3          | Charlie | 33  |
| 4          | Diana   | 55  |
| 5          | Eve     | 5   |
| 6          | Frank   | 60  |
| 7          | Grace   | 32  |
| 8          | Hannah  | 8   |
| 9          | Ian      | 12  |
| 10         | Jack     | 3   |

### **Table: parent_child_relationships**
| parent_id | child_id |
|------------|----------|
| 2          | 1        |
| 3          | 5        |
| 4          | 1        |
| 6          | 7        |
| 6          | 8        |
| 7          | 9        |
| 7          | 10       |
| 4          | 8        |

---

### **Question Level of Difficulty:** **Hard**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg)

---

### **Hints:**
- Join the `family_members` table with the `parent_child_relationships` table to associate parents with their children.
- Use `COUNT()` to calculate the number of children each parent has.
- Use `RANK()` or `ORDER BY` to rank parents by the number of children.

---

### **Expected Output:**
| parent_name | total_children |
|--------------|----------------|
| Bob          | 1              |
| Diana         | 2              |
| Frank         | 2              |

---

Happy querying and enjoy the reunion planning! 🧑‍👩‍👧‍👦✨
