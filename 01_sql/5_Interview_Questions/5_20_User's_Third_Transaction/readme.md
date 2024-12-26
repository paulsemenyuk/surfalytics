# User's Third Transaction
## Uber SQL Interview Question

## Scenario
You are given a table **`transactions`** containing Uber transaction records with the following columns:

| Column Name      | Type      |
|------------------|-----------|
| user_id          | integer   |
| spend            | decimal   |
| transaction_date | timestamp |

---

### Example Input
| user_id | spend  | transaction_date        |
|---------|--------|-------------------------|
| 111     | 100.50 | 01/08/2022 12:00:00     |
| 111     | 55.00  | 01/10/2022 12:00:00     |
| 121     | 36.00  | 01/18/2022 12:00:00     |
| 145     | 24.99  | 01/26/2022 12:00:00     |
| 111     | 89.60  | 02/05/2022 12:00:00     |

---

### Goal
We want to **retrieve the third transaction** of every user. The desired output columns are:

- **user_id**
- **spend**
- **transaction_date**

---

### Example Output

| user_id | spend | transaction_date     |
|---------|-------|----------------------|
| 111     | 89.60 | 02/05/2022 12:00:00  |

> **Note**: The dataset you query may produce different results. The example above demonstrates the concept.

---

## SQL Query

Below is a general-purpose SQL query using a **window function** to rank transactions in chronological order per user. We then filter for the **3rd transaction** only.
