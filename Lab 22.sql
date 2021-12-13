use publications;
select id, advance_paid, royalty_paid  from
(select titles.title_id, price as price, au_id id, advance, royaltyper,royalty, sum(qty) qty, advance*royaltyper/100 advance_paid, price*qty*royalty/100 royalty_paid
from titleauthor 
left join titles on titleauthor.title_id=titles.title_id
left join sales on titleauthor.title_id=sales.title_id
group by  title_id, id) as output
group by id;
select * from roysched where title_id='BU1032' ;
select * from titleauthor where title_id='BU1032';
select * from titles where title_id='BU1032';
select * from sales where title_id='BU1032';
select title_id, advance from profiting_author output
group by title_id;
