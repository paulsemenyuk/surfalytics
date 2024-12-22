-- Solution

SELECT
    recipient_type,
    SUM(weight_kg) AS total_weight,
    ROUND(SUM(weight_kg) * 100.0 / (SELECT SUM(weight_kg) FROM gifts), 2) AS weight_percentage
FROM
    gifts
GROUP BY
    recipient_type;

/*ROUND(SUM(weight_kg) * 100.0 / (SELECT SUM(weight_kg) FROM gifts), 2) AS weight_percentage.

# Breaking Down the Query Step by Step

## 1. `SUM(weight_kg)`
- **What it does**: Calculates the total weight of gifts for each `recipient_type`.
- **Example for “good”**:
  - Add the weights of all rows where `recipient_type = 'good'`:
    ```
    2.5 + 1.2 + 0.3 = 4.0 kg
    ```
- **Example for “naughty”**:
  - Add the weights of all rows where `recipient_type = 'naughty'`:
    ```
    1.5 + 1.8 = 3.3 kg
    ```

## 2. `SELECT SUM(weight_kg) FROM gifts`
- **What it does**: Calculates the total weight of **all gifts** across both recipient types.
- **Example from your table**:
  - Add all the `weight_kg` values:
    ```
    2.5 + 1.5 + 1.2 + 0.3 + 1.8 = 7.3 kg
    ```

## 3. `SUM(weight_kg) * 100.0 / (SELECT SUM(weight_kg) FROM gifts)`
- **What it does**: Calculates the percentage of the total weight allocated to each recipient type.
- **Formula**:
  ```
  Weight Percentage = (Weight for a Recipient Type / Total Weight) * 100
  ```
- **For “good”**:
  ```
  (4.0 / 7.3) * 100 = 54.79%
  ```
- **For “naughty”**:
  ```
  (3.3 / 7.3) * 100 = 45.21%
  ```

## 4. `ROUND(..., 2)`
- **What it does**: Rounds the calculated percentage to 2 decimal places for better readability.
- **Example**:
  - For “good”: `54.7945205` becomes `54.79`.
  - For “naughty”: `45.2054795` becomes `45.21`.

## 5. Alias: `AS weight_percentage`
- **What it does**: Gives the calculated column a name (`weight_percentage`) so it appears labeled in the result.

---

## Full Calculation for Each `recipient_type`:

| recipient_type | total_weight | weight_percentage (calculation) |
|----------------|--------------|----------------------------------|
| good           | 4.0          | \( (4.0 / 7.3) 	imes 100 = 54.79\% \) |
| naughty        | 3.3          | \( (3.3 / 7.3) 	imes 100 = 45.21\% \) |

---

## Final Output:

| recipient_type | total_weight | weight_percentage |
|----------------|--------------|-------------------|
| good           | 4.0          | 54.79            |
| naughty        | 3.3          | 45.21            |
*/
