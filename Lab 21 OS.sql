create database publications;
Select pubs.pub_name, COUNT(titles.title_id) AS Titles
From publications.publishers pubs
LEFT JOIN publications.titles titles
ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;
Select *
From publications.employee emp
LEFT JOIN publications.jobs job
ON emp.job_id = job.job_id
UNION 
Select *
From publications.employee emp
RIGHT JOIN publications.jobs job
ON emp.job_id = job.job_id;
Select pubs.pub_name, COUNT(titles.title_id) AS Titles
From publications.publishers pubs
INNER JOIN publications.titles titles
ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;
select authors.au_id id, au_lname surname ,au_fname firstname, titles.title_id,title,pub_name
from  publications.authors authors  
inner join publications.titleauthor titles on authors.au_id=titles.au_id
left join publications.titles pub_tit on titles.title_id=pub_tit.title_id
left join publications.publishers pubs on pub_tit.pub_id=pubs.pub_id
group by authors.au_id;
-- challenge 2
select authors.au_id id,count(titles.title_id) 
from  publications.authors authors
inner join publications.titleauthor titles on authors.au_id=titles.au_id
left join publications.titles pub_tit on titles.title_id=pub_tit.title_id
left join publications.publishers pubs on pub_tit.pub_id=pubs.pub_id;
-- group by id;
select count(title_id) from publications.titleauthor;
-- challenge 3
select authors.au_id id, au_lname surname ,au_fname firstname, sum(qty) as total
from  publications.authors authors  
inner join publications.titleauthor titles on authors.au_id=titles.au_id
left join publications.titles pub_tit on titles.title_id=pub_tit.title_id
left join publications.sales sales on titles.title_id=sales.title_id
group by authors.au_id order by total desc limit 3;
-- challenge 4
select authors.au_id id, au_lname surname ,au_fname firstname,  sum(qty) as total  
from  publications.authors authors  
left join publications.titleauthor titles on authors.au_id=titles.au_id
left join publications.titles pub_tit on titles.title_id=pub_tit.title_id
left join publications.sales sales on titles.title_id=sales.title_id
group by authors.au_id order by total desc;