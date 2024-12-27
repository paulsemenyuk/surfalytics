# Sending vs. Opening Snaps
## Snapchat SQL Interview Question

### Snapchat User Activities by Age Group

## Scenario
You have two tables:

1. **`activities`** – Tracks how users spend time on Snapchat (sending, opening, chatting).
2. **`age_breakdown`** – Associates each user with an **age bucket** (e.g., `21-25`, `26-30`).

Your goal is to **calculate** the percentage of time spent *sending* snaps and *opening* snaps **by age group**, ignoring other activities like chatting. The percentages should be rounded to **2 decimal places**.

---

## Tables

### 1. `activities`

| Column Name    | Type     | Description                             |
|----------------|----------|-----------------------------------------|
| activity_id    | integer  | Unique ID for each activity             |
| user_id        | integer  | ID linking to the user                  |
| activity_type  | string   | 'send', 'open', 'chat'                  |
| time_spent     | float    | Amount of time (in minutes) spent       |
| activity_date  | datetime | When the activity occurred              |

#### Example Input:
| activity_id | user_id | activity_type | time_spent | activity_date            |
|-------------|---------|---------------|------------|--------------------------|
| 7274        | 123     | open          | 4.50       | 06/22/2022 12:00:00      |
| 2425        | 123     | send          | 3.50       | 06/22/2022 12:00:00      |
| 1413        | 456     | send          | 5.67       | 06/23/2022 12:00:00      |
| 1414        | 789     | chat          | 11.00      | 06/25/2022 12:00:00      |
| 2536        | 456     | open          | 3.00       | 06/25/2022 12:00:00      |

---

### 2. `age_breakdown`

| Column Name | Type     | Description                              |
|-------------|----------|------------------------------------------|
| user_id     | integer  | The same user_id as in `activities`      |
| age_bucket  | string   | One of '21-25', '26-30', '31-35', etc.    |

#### Example Input:
| user_id | age_bucket |
|---------|-----------|
| 123     | 31-35     |
| 456     | 26-30     |
| 789     | 21-25     |

---

## Required Output

We want:

| age_bucket | send_perc | open_perc |
|------------|-----------|-----------|

Where:

- **`send_perc`** =
  \(
  \dfrac{\text{Total time spent sending}}{\text{Total time spent sending} + \text{Total time spent opening}}
  \times 100.0
  \)

- **`open_perc`** =
  \(
  \dfrac{\text{Total time spent opening}}{\text{Total time spent sending} + \text{Total time spent opening}}
  \times 100.0
  \)

- The **result** should be grouped by `age_bucket`.
- **Round** both percentages to **2 decimal places**.

---

## Example Output

| age_bucket | send_perc | open_perc |
|------------|----------:|----------:|
| 26-30      | 65.40     | 34.60     |
| 31-35      | 43.75     | 56.25     |

*(Values above match the example inputs given and may differ from your actual data.)*
