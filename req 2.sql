with cte1 as
(
select count(distinct product_code) as unique_products_2020 
from fact_sales_monthly
where fiscal_year=2020
) ,

cte2 as
(
select count(distinct product_code) as unique_products_2021 
from fact_sales_monthly
where fiscal_year=2021 
)
select *,
       round(((unique_products_2021 - unique_products_2020)*100)/unique_products_2020,2) as percentage_chg 
       from cte1 
       cross join cte2; 
       
       