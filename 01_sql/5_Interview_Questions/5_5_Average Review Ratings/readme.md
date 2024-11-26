# Amazon SQL Interview Question

## **Objective**
Write a query to retrieve the average star rating for each product, grouped by month. The output should display:
- **Month**: as a numerical value
- **Product ID**
- **Average Star Rating**: rounded to two decimal places

Sort the output first by month and then by product ID.

---

## **reviews Table Schema**

| Column Name | Type     | Description                  |
|-------------|----------|------------------------------|
| `review_id` | integer  | Unique identifier for review |
| `user_id`   | integer  | Unique identifier for user   |
| `submit_date` | datetime | Date and time of the review |
| `product_id` | integer  | Product being reviewed      |
| `stars`     | integer  | Star rating (1-5)           |

---

## **Example Input**

| review_id | user_id | submit_date       | product_id | stars |
|-----------|---------|-------------------|------------|-------|
| 6171      | 123     | 06/08/2022 00:00 | 50001      | 4     |
| 7802      | 265     | 06/10/2022 00:00 | 69852      | 4     |
| 5293      | 362     | 06/18/2022 00:00 | 50001      | 3     |
| 6352      | 192     | 07/26/2022 00:00 | 69852      | 3     |
| 4517      | 981     | 07/05/2022 00:00 | 69852      | 2     |

---

## **Expected Output**

| mth | product  | avg_stars |
|-----|----------|-----------|
| 6   | 50001    | 3.50      |
| 6   | 69852    | 4.00      |
| 7   | 69852    | 2.50      |

---

## **Explanation**
- **Product 50001 in June (6th month)**: Ratings of 4 and 3, resulting in an average of (4 + 3) / 2 = **3.50**
- **Product 69852 in June (6th month)**: A single rating of 4, resulting in an average of **4.00**
- **Product 69852 in July (7th month)**: Ratings of 3 and 2, resulting in an average of (3 + 2) / 2 = **2.50**

---
