select order_id, order_item_id, max(price) from olist.order_items order by price desc;
select order_id, order_item_id, min(price) from olist.order_items order by price desc;
select customer_state, count(customer_unique_id) as customers from olist.customers group by customer_state order by customers desc;
select customer_state, count(customer_unique_id) as customers,customer_city from olist.customers where customer_state like "SP" group by customer_city order by customers desc;
select  count(DISTINCT business_segment)  as segment from olist.closed_deals where business_segment not like "NULL";
select * from olist.closed_deals limit 30;
select business_segment, sum(declared_monthly_revenue) as revenue from olist.closed_deals where declared_monthly_revenue>0 group by business_segment order by revenue desc limit 3;
select * from olist.order_reviews limit 10;

 
select  review_score, count(review_score) as reviews from olist.order_reviews group by review_score order by reviews desc; 
alter table olist.order_reviews add review_category varchar (255);
select * from olist.order_reviews limit 10;
update olist.order_reviews set review_category = "Top" where review_score=5; 
select * from olist.order_reviews limit 10;
SELECT review_score, count(review_score), 
   CASE review_score
      WHEN 1 THEN 'Bad'
      WHEN 2 THEN 'Poor'
      WHEN 3 THEN 'Satisfactory'
	WHEN 4 THEN 'Good'
      WHEN 5 THEN 'Perfect'
   END AS review_categ
 FROM olist.order_reviews group by review_categ order by count(review_score) desc;
select review_score, review_categ, count(review_score) as reviews from olist.order_reviews group by review_categ  order by reviews desc; 
select  review_score, count(review_score) as reviews from olist.order_reviews group by review_score order by reviews desc limit 1;