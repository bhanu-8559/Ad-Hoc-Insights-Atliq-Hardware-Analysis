select distinct segment,
       count(product_code) as product_count
       from dim_product
       group by segment 
       order by product_count desc;

       