# Day 22 of SQL Advent Calendar 🎁

## Today's Question:
We are hosting a gift party and need to ensure every guest receives a gift. Using the `guests` and `guest_gifts` tables, write a query to identify the guest(s) who **have not** been assigned a gift (i.e., they are not listed in the `guest_gifts` table).

### **Table: guests**
| guest_id | guest_name    |
|----------|---------------|
| 1        | Cindy Lou     |
| 2        | The Grinch    |
| 3        | Max the Dog   |
| 4        | Mayor May Who |

### **Table: guest_gifts**
| gift_id | guest_id | gift_name    |
|---------|----------|--------------|
| 1       | 1        | Toy Train    |
| 2       | 1        | Plush Bear   |
| 3       | 2        | Bag of Coal  |
| 4       | 2        | Sleigh Bell  |
| 5       | 3        | Dog Treats   |

---

### Question Level of Difficulty: **Medium**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg)


---

### **Hints:**
1. Consider using a `LEFT JOIN` from the `guests` table to `guest_gifts` and filter where there’s no matching gift record.
2. Alternatively, use a `NOT IN` or `NOT EXISTS` approach to identify guests who aren’t in the `guest_gifts` table.

---

### **Expected Output:**
| guest_name     |
|----------------|
| Mayor May Who  |

*(Since “Mayor May Who” does not appear in `guest_gifts`, they have no assigned gift.)*

---

Time to ensure every guest gets a gift, so no one is left out in the cold!
