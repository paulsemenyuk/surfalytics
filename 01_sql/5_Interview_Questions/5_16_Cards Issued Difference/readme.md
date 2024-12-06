# Cards Issued Difference
## JP Morgan SQL Interview Question

# SQL Query: Analyze Credit Card Issuance Disparity

## Problem Statement
Your team at JPMorgan Chase is preparing to launch a new credit card. To gain insights, you're analyzing how many credit cards were issued each month. The task is to output the name of each credit card and the difference in the number of issued cards between the month with the highest and lowest issuance. Arrange the results based on the largest disparity.

## Table Schema
**Table Name**: `monthly_cards_issued`

| Column Name     | Data Type |
|------------------|-----------|
| `card_name`      | string    |
| `issued_amount`  | integer   |
| `issue_month`    | integer   |
| `issue_year`     | integer   |

## Example Input
| card_name              | issued_amount | issue_month | issue_year |
|-------------------------|---------------|-------------|------------|
| Chase Freedom Flex      | 55000         | 1           | 2021       |
| Chase Freedom Flex      | 60000         | 2           | 2021       |
| Chase Freedom Flex      | 65000         | 3           | 2021       |
| Chase Freedom Flex      | 70000         | 4           | 2021       |
| Chase Sapphire Reserve  | 170000        | 1           | 2021       |
| Chase Sapphire Reserve  | 175000        | 2           | 2021       |
| Chase Sapphire Reserve  | 180000        | 3           | 2021       |

## Expected Output
| card_name              | difference |
|-------------------------|------------|
| Chase Freedom Flex      | 15000      |
| Chase Sapphire Reserve  | 10000      |

Chase Sapphire Reserve’s best month was 180k cards issued and the worst month was 170k cards, so the difference is 10k cards.

The dataset you are querying against may have different input & output - this is just an example!
