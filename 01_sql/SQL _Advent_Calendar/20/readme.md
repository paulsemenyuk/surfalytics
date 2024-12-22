# Day 20 of SQL Advent Calendar 🎁

## Today's Question:
We are looking for cheap gifts at the market. Which vendors are selling items priced below \$10? List the **unique** (i.e., remove duplicates) vendor names.

### **Table: vendors**
| vendor_id | vendor_name     | market_location |
|-----------|-----------------|-----------------|
| 1         | Cozy Crafts     | Downtown Square |
| 2         | Sweet Treats    | Central Park    |
| 3         | Winter Warmers  | Downtown Square |

### **Table: item_prices**
| item_id | vendor_id | item_name          | price_usd |
|---------|----------|---------------------|-----------|
| 1       | 1        | Knitted Scarf      | 25        |
| 2       | 2        | Hot Chocolate      | 5         |
| 3       | 2        | Gingerbread Cookie | 3.5       |
| 4       | 3        | Wool Hat           | 18        |
| 5       | 3        | Santa Pin          | 2         |

---

### Question Level of Difficulty: **Easy**
![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg)



---

### **Hints:**
- Join the `vendors` table with the `item_prices` table on `vendor_id`.
- Filter to items priced below \$10.
- Select unique vendor names, so no duplicates.

---

### **Expected Output:**
| vendor_name   |
|---------------|
| Sweet Treats  |
| Winter Warmers|

---

Happy bargain hunting! 🛍️
