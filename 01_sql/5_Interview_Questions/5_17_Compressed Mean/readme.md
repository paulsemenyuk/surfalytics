# Compressed Mean
## Alibaba SQL Interview Question

# Calculate the Mean Number of Items per Order on Alibaba

## Problem Statement
You are tasked with finding the mean number of items per order on Alibaba, rounded to 1 decimal place. The data is contained in a table that includes the count of items in each order and the corresponding number of orders for each item count.

## Table Structure

### `items_per_order` Table:
| Column Name        | Type    |
|--------------------|---------|
| `item_count`       | integer |
| `order_occurrences`| integer |

## Example Input:
| item_count | order_occurrences |
|------------|-------------------|
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |
| 4          | 1000              |

### Explanation of Input:
- 500 orders have one item each.
- 1000 orders have two items each.
- 800 orders have three items each.
- 1000 orders have four items each.

---

## Example Output:
| mean |
|------|
| 2.7  |

---

## Explanation:
The arithmetic mean is calculated as follows:
1. **Calculate Total Items**:
   Multiply each `item_count` by its respective `order_occurrences` and sum up the results:
   \[
   (1 \times 500) + (2 \times 1000) + (3 \times 800) + (4 \times 1000) = 8900
   \]

2. **Calculate Total Orders**:
   Sum up all `order_occurrences`:
   \[
   500 + 1000 + 800 + 1000 = 3300
   \]

3. **Compute Mean**:
   Divide the total items by the total orders:
   \[
   \text{Mean} = \frac{8900}{3300} = 2.7
   \]

4. **Round to 1 Decimal Place**:
   The result is \(2.7\).

## Note:
The dataset you are querying against may have different input and output, but the approach remains the same.
