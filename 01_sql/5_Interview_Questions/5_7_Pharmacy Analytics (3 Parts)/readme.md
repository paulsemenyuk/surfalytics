# Pharmacy Analytics

## Part 1: Top 3 Most Profitable Drugs

### Task
CVS Health aims to analyze its pharmacy sales data to identify the top 3 most profitable drugs and their respective profits. Profit is calculated using the formula:

**Total Profit = Total Sales - Cost of Goods Sold (COGS)**

### Table: `pharmacy_sales`
| Column Name | Data Type |
|-------------|-----------|
| product_id  | integer   |
| units_sold  | integer   |
| total_sales | decimal   |
| cogs        | decimal   |
| manufacturer| varchar   |
| drug        | varchar   |

### Query
```sql
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;
```

Example Input

product_id	units_sold	total_sales	cogs	manufacturer	drug
9	37410	293452.54	208876.01	Eli Lilly	Zyprexa
34	94698	600997.19	521182.16	AstraZeneca	Surmontil
61	77023	500101.61	419174.97	Biogen	Varicose Relief
136	144814	1084258.00	1006447.73	Biogen	Burkhart

Example Output

drug	total_profit
Zyprexa	84576.53
Varicose Relief	80926.64
Surmontil	79815.03

Part 2: Loss-Making Drugs by Manufacturer

Task

Identify the manufacturers associated with drugs that resulted in losses and calculate:
	1.	The number of loss-making drugs.
	2.	Total losses (absolute value).

Query
```sql
SELECT
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;
```
Example Input

product_id	units_sold	total_sales	cogs	manufacturer	drug
156	89514	3130097.00	3427421.73	Biogen	Acyclovir
25	222331	2753546.00	2974975.36	AbbVie	Lamivudine and Zidovudine
50	90484	2521023.73	2742445.90	Eli Lilly	Dermasorb TA Complete Kit
98	110746	813188.82	140422.87	Biogen	Medi-Chord

Example Output

manufacturer	drug_count	total_loss
Biogen	1	297324.73
AbbVie	1	221429.36
Eli Lilly	1	221422.17

Part 3: Total Sales by Manufacturer

Task

Calculate total sales for each manufacturer, rounded to the nearest million, and format the results for dashboard display.

Query
```sql
SELECT
  manufacturer,
  CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million') AS sales_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer ASC;
```
Example Input

product_id	units_sold	total_sales	cogs	manufacturer	drug
94	132362	2041758.41	1373721.70	Biogen	UP and UP
9	37410	293452.54	208876.01	Eli Lilly	Zyprexa
50	90484	2521023.73	2742445.90	Eli Lilly	Dermasorb
61	77023	500101.61	419174.97	Biogen	Varicose Relief
136	144814	1084258.00	1006447.73	Biogen	Burkhart

Example Output

manufacturer	sales
Biogen	$4 million
Eli Lilly	$3 million
