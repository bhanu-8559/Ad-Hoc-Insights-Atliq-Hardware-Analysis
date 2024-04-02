SELECT p.product_code,p.product, m.manufacturing_cost
FROM dim_product p join fact_manufacturing_cost m on p.product_code=m.product_code 
WHERE manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
   OR manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
   order by manufacturing_cost desc;
