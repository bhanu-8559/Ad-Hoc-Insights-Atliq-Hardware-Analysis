
WITH cte1 AS
(SELECT customer_code AS A, AVG(pre_invoice_discount_pct) AS B FROM fact_pre_invoice_deductions
WHERE fiscal_year = '2021'
GROUP BY customer_code),
     cte2 AS
(SELECT customer_code AS C, customer AS D FROM dim_customer
WHERE market = 'India')

SELECT cte2.C AS customer_code, cte2.D AS customer, ROUND (cte1.B, 4) AS average_discount_percentage
FROM cte1 JOIN cte2
ON cte1.A = cte2.C
ORDER BY average_discount_percentage DESC
LIMIT 5  ;
