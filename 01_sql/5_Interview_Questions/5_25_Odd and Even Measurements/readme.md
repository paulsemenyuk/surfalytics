# Odd and Even Measurements
## Google SQL Interview Question

# Summing Odd and Even-Numbered Measurements for Each Day

## Scenario

You have a **`measurements`** table with sensor readings taken multiple times during each day. We need to compute:
- **Odd-numbered measurements** sum (1st, 3rd, 5th, … reading of the day)
- **Even-numbered measurements** sum (2nd, 4th, 6th, … reading of the day)

… all **grouped by day**.

> **Effective April 15th, 2023**, the question and solution have been revised to clarify how to separate and sum odd vs. even measurements.

---

## Table: `measurements`

| Column Name       | Type       | Description                                           |
|-------------------|------------|-------------------------------------------------------|
| measurement_id    | integer    | Unique ID for the measurement                         |
| measurement_value | decimal    | Value recorded by the sensor                          |
| measurement_time  | datetime   | Date & time the measurement was taken                |

### Example Input

| measurement_id | measurement_value | measurement_time       |
|----------------|-------------------|------------------------|
| 131233         | 1109.51          | 07/10/2022 09:00:00    |
| 135211         | 1662.74          | 07/10/2022 11:00:00    |
| 523542         | 1246.24          | 07/10/2022 13:15:00    |
| 143562         | 1124.50          | 07/11/2022 15:00:00    |
| 346462         | 1234.14          | 07/11/2022 16:45:00    |

---

## Goal

1. **Group measurements by day** (based on `measurement_time`).
2. **Rank measurements** per day in chronological order (1st, 2nd, 3rd, etc.).
3. **Sum the values** for odd and even ranks separately.
4. **Display** the day (any consistent date format), `odd_sum`, and `even_sum`.

---

## Example Output

| measurement_day        | odd_sum  | even_sum |
|------------------------|---------:|---------:|
| 07/10/2022 00:00:00    | 2355.75  | 1662.74  |
| 07/11/2022 00:00:00    | 1124.50  | 1234.14  |

### Explanation

- **07/10/2022** measurements:
  - 1st reading (odd): 1109.51
  - 2nd reading (even): 1662.74
  - 3rd reading (odd): 1246.24
  - **odd_sum** = 1109.51 + 1246.24 = **2355.75**
  - **even_sum** = 1662.74

- **07/11/2022** measurements:
  - 1st reading (odd): 1124.50
  - 2nd reading (even): 1234.14
  - **odd_sum** = 1124.50
  - **even_sum** = 1234.14

*(Your actual data may differ, so results can vary.)*
