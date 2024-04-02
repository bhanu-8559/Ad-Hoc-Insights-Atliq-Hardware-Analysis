WITH Output AS
(
SELECT c.channel,
       ROUND(SUM(g.gross_price*s.sold_quantity/1000000), 2) AS Gross_sales_mln
FROM fact_sales_monthly s JOIN dim_customer c ON s.customer_code = c.customer_code
						   JOIN fact_gross_price g ON s.product_code = g.product_code
WHERE s.fiscal_year = 2021
GROUP BY channel
)
SELECT channel, CONCAT(Gross_sales_mln,' M') AS Gross_sales_mln , CONCAT(ROUND(Gross_sales_mln*100/total , 2), ' %') AS percentage
FROM
(
(SELECT SUM(Gross_sales_mln) AS total FROM Output) A,
(SELECT * FROM Output) B
)
ORDER BY percentage DESC 