create schema Mobile;
use Mobile ;
select * from Mobile;

-- Check mobile features and  price list--
select phone_name, price from Mobile; 

-- 2. find out the price of 5 most expensive phones. 
select * from mobile order by price desc limit 5; 

-- 2. find out the price of 5 most cheapest phones. 
select * from mobile order by price asc limit 5;

-- List of top 5 Samsung phones with price and all features. 
select * from mobile where Brands='samsung'  order by price desc limit 5;

-- Must have android phone list then top 5 high price andriod phones--
select * from mobile where operating_system_type ='android' order by price desc limit 5;

-- Must have android phone list then top 5 lower price andriod phones--
select * from mobile where operating_system_type ='android' order by price asc limit 5;

-- Must have ios phone list then top 5 high price ios phones.
select * from mobile where operating_system_type ='ios' order by price desc limit 5;
 
-- Must have ios phone list then top 5 low price ios phones. 
select * from mobile where operating_system_type ='ios' order by price asc limit 5;

-- write a query which phone support 5g and  also top 5 phone with 5g support.
select * from mobile where 5g_availability='yes' order by price desc limit 5;

-- Total price of all mobiles is to be found with brand name .
select brands,sum(price) from mobile group by brands;  
 select * from mobile;