# FAANG Stock Min-Max (Part 1)
## Bloomberg SQL Interview Question

# FAANG Stock Analysis: Highest and Lowest Monthly Opens

## Scenario
As a Data Analyst at Bloomberg, you’re working with **FAANG** stocks (Facebook (Meta), Apple, Amazon, Netflix, Google (Alphabet)) and examining their **highest** and **lowest** opening prices **by month** over the years. Your goal is to produce a report showing, for each stock:

1. The **ticker** symbol (e.g., AAPL)
2. The month-year (e.g., `May-2023`) in which its **highest** opening price occurred
3. The corresponding **highest** opening price
4. The month-year in which its **lowest** opening price occurred
5. The corresponding **lowest** opening price

---

## Table Schema: `stock_prices`

| Column Name | Type     | Description                                                                 |
|-------------|----------|-----------------------------------------------------------------------------|
| date        | datetime | The specified date (mm/dd/yyyy) of the stock data.                          |
| ticker      | varchar  | The stock ticker symbol (e.g., AAPL).                                        |
| open        | decimal  | The opening price of the stock at the start of the trading day.             |
| high        | decimal  | The highest price reached by the stock during the trading day.              |
| low         | decimal  | The lowest price reached by the stock during the trading day.               |
| close       | decimal  | The closing price of the stock at the end of the trading day.               |

### Example Input

*(Note: The table below shows **example** Apple (AAPL) data.)*

| date                   | ticker | open    | high   | low    | close   |
|------------------------|--------|--------:|-------:|-------:|--------:|
| 01/31/2023 00:00:00    | AAPL   | 142.28  | 142.70 | 144.34 | 144.29  |
| 02/28/2023 00:00:00    | AAPL   | 146.83  | 147.05 | 149.08 | 147.41  |
| 03/31/2023 00:00:00    | AAPL   | 161.91  | 162.44 | 165.00 | 164.90  |
| 04/30/2023 00:00:00    | AAPL   | 167.88  | 168.49 | 169.85 | 169.68  |
| 05/31/2023 00:00:00    | AAPL   | 176.76  | 177.33 | 179.35 | 177.25  |

---

## Expected Output (Example)

| ticker | highest_mth | highest_open | lowest_mth | lowest_open |
|--------|-------------|-------------:|------------|------------:|
| AAPL   | May-2023    | 176.76       | Jan-2023   | 142.28      |

> **Narrative**: Apple (AAPL) achieved its **highest** opening price of \$176.76 in **May 2023** and its **lowest** opening price of \$142.28 in **January 2023**.

*(Your actual dataset may produce different results.)*

---

## Query Outline

Below is a conceptual SQL query that uses **window functions** and a **month-year format**. This approach works in many SQL dialects (e.g., PostgreSQL, MySQL 8+, SQL Server, Oracle with slight syntax variations).
