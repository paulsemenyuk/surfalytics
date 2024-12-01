# Identify Top Two Highest-Grossing Products Per Category in 2022

## **Objective**
Write a query to find the top two highest-grossing products within each category for the year 2022. The output should include:
- **Category**
- **Product**
- **Total Spend**

---

## **Schema: `product_spend` Table**

| Column Name       | Type     | Description                                      |
|--------------------|----------|--------------------------------------------------|
| `category`         | string   | Product category                                 |
| `product`          | string   | Product name                                    |
| `user_id`          | integer  | User identifier                                 |
| `spend`            | decimal  | Amount spent on the product                     |
| `transaction_date` | timestamp| Date and time of the transaction                |

---

## **Example Input**

| category     | product           | user_id | spend   | transaction_date       |
|--------------|-------------------|---------|---------|------------------------|
| appliance    | refrigerator      | 165     | 246.00  | 12/26/2021 12:00:00   |
| appliance    | refrigerator      | 123     | 299.99  | 03/02/2022 12:00:00   |
| appliance    | washing machine   | 123     | 219.80  | 03/02/2022 12:00:00   |
| electronics  | vacuum            | 178     | 152.00  | 04/05/2022 12:00:00   |
| electronics  | wireless headset  | 156     | 249.90  | 07/08/2022 12:00:00   |
| electronics  | vacuum            | 145     | 189.00  | 07/15/2022 12:00:00   |

---

## **Expected Output**

| category     | product           | total_spend |
|--------------|-------------------|-------------|
| appliance    | refrigerator      | 299.99      |
| appliance    | washing machine   | 219.80      |
| electronics  | vacuum            | 341.00      |
| electronics  | wireless headset  | 249.90      |

---

## **Explanation**
1. **Filter Data for 2022**:
   - Only include transactions occurring in the year 2022.

2. **Aggregate Spending by Product**:
   - Calculate the total spending for each product within a category.

3. **Identify Top Two Products Per Category**:
   - Select the top two products with the highest total spend for each category.

---
