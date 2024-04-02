with cte1 as
(
	   select distinct p.segment,
       count(p.product_code) as product_count_2020
       from dim_product p
       join fact_sales_monthly s
       on p.product_code=s.product_code 
       where fiscal_year=2020
       group by p.segment 
       order by product_count_2020 desc
       ),
cte2 as
(
       select distinct p.segment,
       count(p.product_code) as product_count_2021
       from dim_product p
       join fact_sales_monthly s
       on p.product_code=s.product_code 
       where fiscal_year=2021
       group by p.segment 
       order by product_count_2021 desc
       )
       select cte1.segment,
			  cte1.product_count_2020,
              cte2.product_count_2021,
              product_count_2021-product_count_2020 as difference
              from cte1 
              join cte2 
              on cte1.segment=cte2.segment
              group by cte1.segment
              order by difference desc;
              
              
              
       