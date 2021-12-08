create database applestore;
select prime_genre from applestore.applestore group by prime_genre; -- 
select prime_genre, sum(rating_count_tot) as rating from applestore.applestore group by prime_genre order by rating Desc;
select prime_genre, count(п»їid) as Apps from applestore.applestore group by prime_genre order by Apps Desc limit 1;
select prime_genre, count(п»їid) as Apps from applestore.applestore group by prime_genre order by Apps Asc limit 1;
select track_name, prime_genre, sum(rating_count_tot) as rating from applestore.applestore group by track_name order by rating desc limit 10;
select track_name, sum(rating_count_tot) as rating, avg(user_rating) as note from applestore.applestore group by track_name order by note desc, rating desc limit 3; 
select track_name, prime_genre, sum(rating_count_tot) as rating, avg(user_rating) as note from applestore.applestore group by track_name order by rating desc limit 10;
select track_name, prime_genre, sum(rating_count_tot) as rating, avg(user_rating) as note from applestore.applestore group by track_name order by rating desc limit 3;
select track_name, sum(rating_count_tot) as rating, avg(user_rating) as note from applestore.applestore group by track_name order by note desc, rating desc limit 3; 
select prime_genre, sum(rating_count_tot) as rating, avg(price), avg(user_rating) from applestore.applestore group by prime_genre order by avg(price) asc, rating desc; 
select prime_genre, sum(rating_count_tot) as rating, price from applestore.applestore group by prime_genre order by rating desc;