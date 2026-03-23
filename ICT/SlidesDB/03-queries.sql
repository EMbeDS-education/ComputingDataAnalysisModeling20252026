use foodmart

-- 1) list of products with name containing "sa"
SELECT product_id, product_name
from product p
where p.product_name like '%sa%'
order by product_name


-- 1a) list of purhased products  with name 
-- containing "sa"
SELECT p.product_id, p.product_name
from product p join  sales_fact sf 
on p.product_id = sf.product_id 
where p.product_name like '%sa%'
order by p.product_name


-- 2)list of sales related to stores in Acapulco
select sf.*, s.store_city 
from sales_fact sf join store s on s.store_id =sf.store_id 
where s.store_city = 'Acapulco'
-- 3)for each store return the total sales in USA 
SELECT sf.store_id, sum(sf.store_sales) as tot_sales, 
sum(sf.unit_sales) as total_store_units
from sales_fact sf join store s on s.store_id = sf.store_id 
where s.store_country = 'USA'
group by sf.store_id
order by sf.store_id DESC 

SELECT *
from store 


-- 4)for each store return the  average sales 
-- of stores in USA only if its total store 
-- is at least 1000$ 

SELECT sf.store_id, avg(sf.store_sales) as tot_sales, 
sum(sf.unit_sales) as total_store_units
from sales_fact sf join store s on s.store_id = sf.store_id 
where s.store_country = 'USA'
group by sf.store_id
having sum(sf.store_sales) >= 1000
order by sf.store_id DESC 

