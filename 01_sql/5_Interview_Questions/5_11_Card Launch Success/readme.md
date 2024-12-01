# JPMorgan Chase Credit Card Launch Analysis

## **Objective**
Write a query to determine how many credit cards were issued during the launch month for each credit card. The launch month is defined as the earliest record in the `monthly_cards_issued` table for a given card. The output should include:
- **Card Name**
- **Issued Amount** (during the launch month)

Sort the results by the issued amount in descending order.

---

## **Schema: `monthly_cards_issued` Table**

| Column Name     | Type     | Description                                   |
|------------------|----------|-----------------------------------------------|
| `issue_month`    | integer  | Month when the cards were issued (1-12)      |
| `issue_year`     | integer  | Year when the cards were issued              |
| `card_name`      | string   | Name of the credit card                      |
| `issued_amount`  | integer  | Number of cards issued in that specific month|

---

## **Example Input**

| issue_month | issue_year | card_name               | issued_amount |
|-------------|------------|-------------------------|---------------|
| 1           | 2021       | Chase Sapphire Reserve | 170000        |
| 2           | 2021       | Chase Sapphire Reserve | 175000        |
| 3           | 2021       | Chase Sapphire Reserve | 180000        |
| 3           | 2021       | Chase Freedom Flex     | 65000         |
| 4           | 2021       | Chase Freedom Flex     | 70000         |

---

## **Expected Output**

| card_name               | issued_amount |
|-------------------------|---------------|
| Chase Sapphire Reserve  | 170000        |
| Chase Freedom Flex      | 65000         |

---

## **Explanation**
1. **Chase Sapphire Reserve**:
   - Launched in **January 2021 (1/2021)** with an issued amount of **170,000 cards**.
   - Subsequent months have higher issuance, but only the launch month is considered.

2. **Chase Freedom Flex**:
   - Launched in **March 2021 (3/2021)** with an issued amount of **65,000 cards**.

The results are sorted in descending order of issued amounts.

---
