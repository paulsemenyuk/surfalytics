# Signup Activation Rate
## TikTok SQL Interview Question

# TikTok Signup Activation Rate

## Scenario
A senior analyst wants to know the **activation rate** for a set of specific users who signed up via email. The **activation rate** is defined as the percentage of these **email signups** that have been **confirmed** through text messages. Some important notes:

1. The **emails** table lists users who signed up with their emails (not necessarily all TikTok users).
2. The **texts** table logs text confirmations with a column `signup_action` that indicates whether a user has “Confirmed” or “Not Confirmed”.
3. A user may receive multiple text messages until they confirm or abandon the process.

**Effective April 4th, 2023**, an assumption was added:
> The analyst is only interested in activation for the **subset of users found in the emails table**, which may not match 1:1 with users in the texts table.

---

## Table Schemas

### 1. **emails**

| Column Name | Type     | Description                                           |
|-------------|----------|-------------------------------------------------------|
| email_id    | integer  | Primary key for the email record.                     |
| user_id     | integer  | Unique ID for the user.                               |
| signup_date | datetime | Date and time the user signed up with their email.    |

#### Example Input

| email_id | user_id | signup_date            |
|----------|---------|------------------------|
| 125      | 7771    | 06/14/2022 00:00:00    |
| 236      | 6950    | 07/01/2022 00:00:00    |
| 433      | 1052    | 07/09/2022 00:00:00    |

---

### 2. **texts**

| Column Name   | Type     | Description                                  |
|---------------|----------|----------------------------------------------|
| text_id       | integer  | Primary key for the text confirmation record.|
| email_id      | integer  | Foreign key mapping to the `emails` table.   |
| signup_action | varchar  | Indicates “Confirmed” or “Not Confirmed”.     |

#### Example Input

| text_id | email_id | signup_action |
|---------|----------|---------------|
| 6878    | 125      | Confirmed     |
| 6920    | 236      | Not Confirmed |
| 6994    | 236      | Confirmed     |

**Notes**:
- `'Confirmed'` means the user **activated** their account.
- `'Not Confirmed'` means the user has not yet completed their signup process.

---

## Definition: Activation Rate

\[
\text{Activation Rate} =
\dfrac{\text{Number of email signups marked as “Confirmed”}}{\text{Total number of email signups}}
\]

---

## Expected Output (Example)

| confirm_rate |
|-------------:|
| 0.67         |

*(This represents 67%, meaning 67% of email signups have been confirmed. Your actual output may vary based on the data.)*

---

## Example Explanation
- Out of 3 email signups (email_id: 125, 236, 433):
  - **125** is Confirmed (based on text_id=6878).
  - **236** is Confirmed eventually (6994) despite having an earlier “Not Confirmed” message (6920).
  - **433** has no corresponding text record, so it’s considered not confirmed.
- **2** out of **3** are confirmed → `2/3 = 0.666...` → `0.67` when rounded to two decimals.
