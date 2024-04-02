SELECT CONCAT(MONTHNAME(s.date), ' (', YEAR(s.date), ')') AS 'Month', s.fiscal_year,
       ROUND(SUM(g.gross_price*s.sold_quantity), 2) AS Gross_sales_Amount
FROM fact_sales_monthly s JOIN dim_customer c ON s.customer_code = c.customer_code
						   JOIN fact_gross_price g ON s.product_code = g.product_code
WHERE c.customer = 'Atliq Exclusive'
GROUP BY  Month, s.fiscal_year 
ORDER BY s.fiscal_year ;