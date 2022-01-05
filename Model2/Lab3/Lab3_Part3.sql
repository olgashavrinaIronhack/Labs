create database lab3;
use lab3;
create table students_score (id int, score int);
INSERT INTO students_score (id, score) VALUES 
(1,91),
(2,72),
(3,98),
(4,62),
(5,62),
(6,95),
(7,83),
(8,86),
(9,56),
(10,97),
(11,58),
(12,71),
(13,87),
(14,83),
(15,98);
select avg(score), min(score), max(score), sum(score), stddev(score), variance(score) from students_score ;