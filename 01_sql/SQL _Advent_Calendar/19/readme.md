# Day 19 of SQL Advent Calendar 🐻❄️

## Today's Question:

Scientists are studying the diets of polar bears. Write a query to find the maximum amount of food (in kilograms) consumed by each polar bear in a single meal in December 2024. Include the `bear_name` and `biggest_meal_kg`, and sort the results in descending order of the largest meal consumed.

### Table: polar_bears
| bear_id | bear_name | age |
|---------|-----------|-----|
| 1       | Snowball  | 10  |
| 2       | Frosty    | 7   |
| 3       | Iceberg   | 15  |

### Table: meal_log
| log_id | bear_id | food_type | food_weight_kg | date         |
|--------|----------|-----------|----------------|--------------|
| 1      | 1        | Seal      | 30             | 2024-12-01   |
| 2      | 2        | Fish      | 15             | 2024-12-02   |
| 3      | 1        | Fish      | 10             | 2024-12-03   |
| 4      | 3        | Seal      | 25             | 2024-12-04   |
| 5      | 2        | Seal      | 20             | 2024-12-05   |
| 6      | 3        | Fish      | 18             | 2024-12-06   |

---

### Question Level of Difficulty: **Medium**
![Grinch](https://www.sqlcalendar.com/grinch.svg) ![Grinch](https://www.sqlcalendar.com/grinch.svg) ![GrinchGray](https://www.sqlcalendar.com/grinchGray.svg)


---

### Hints:
- Filter meals by December 2024 (`WHERE date >= '2024-12-01' AND date < '2025-01-01'`).
- Use `MAX()` to find the largest meal per bear.
- Join `polar_bears` with `meal_log` on `bear_id`.
- Order results by the largest meal weight descending.

---

### Expected Output:
| bear_name | biggest_meal_kg |
|-----------|-----------------|
| Snowball  | 30              |
| Iceberg   | 25              |
| Frosty    | 20              |

---

Keep your queries chill and your results solid as ice! ❄️
