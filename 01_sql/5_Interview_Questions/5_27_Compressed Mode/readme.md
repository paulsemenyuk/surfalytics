# Compressed Mode
## Alibaba SQL Interview Question

# Finding the Mode of Alibaba Orders

## Scenario
You have an **`items_per_order`** table that tracks how many items were sold in each order and how frequently (how many orders) that particular item count occurred. Your goal is to **retrieve the mode**—that is, **the item_count with the highest order_occurrences**. If multiple item counts share the same highest frequency, **they should all appear**, ordered by **item_count** ascending.

> **Effective June 14th, 2023**: The problem statement was updated with additional clarifications.

---

## Table: `items_per_order`

| Column Name       | Type    | Description                                                                 |
|-------------------|---------|-----------------------------------------------------------------------------|
| item_count        | integer | The number of items sold in each order.                                     |
| order_occurrences | integer | The frequency of orders that have that **item_count**.                      |

### Example Input

| item_count | order_occurrences |
|------------|-------------------|
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |

---

## Expected Output (Example)

| mode |
|-----:|
| 2    |

**Explanation**
- **item_count = 1** has 500 occurrences.
- **item_count = 2** has 1000 occurrences.
- **item_count = 3** has 800 occurrences.

Here, **2** is the **mode** because its frequency (1000) is higher than the others. If the data included ties (e.g., **2** and **3** both had 1000 occurrences), you would list both 2 and 3, in ascending order, each on its own row.
