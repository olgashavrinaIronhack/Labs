use employees_mod;
select * from t_dept_manager limit 2;
SELECT gender, count(t_dept_manager.emp_no),YEAR(t_salaries.from_date) cal_year from t_dept_manager
join t_employees on t_employees.emp_no=t_dept_manager.emp_no
join t_salaries on t_salaries.emp_no=t_dept_manager.emp_no
group by gender, cal_year ;
use employees_mod;
select * from t_dept_manager limit 2;
SELECT gender, dept_name, count(t_dept_manager.emp_no),YEAR(t_salaries.from_date) cal_year from t_dept_manager
join t_employees on t_employees.emp_no=t_dept_manager.emp_no
join t_salaries on t_salaries.emp_no=t_dept_manager.emp_no
group by gender,dept_no, dept_no,cal_year ;
SELECT
e.gender, d.dept_name, AVG(s.salary) as salary, YEAR(s.from_date) as calendar_year
FROM
t_salaries s
JOIN t_employees e
ON s.emp_no = e.emp_no
JOIN t_dept_emp de 
ON de.emp_no = e.emp_no
JOIN t_departments d
ON d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;
SELECT min(salary) FROM t_salaries;
SELECT max(salary) FROM t_salaries;

SELECT
d.dept_name, e.gender, avg(s.salary)  as salary
FROM 
t_employees e
JOIN t_salaries s
ON e.emp_no = s.emp_no
JOIN t_dept_emp de
ON de.emp_no = e.emp_no
JOIN t_departments d
ON d.dept_no = de.dept_no
GROUP BY d.dept_name, e.gender;
DROP PROCEDURE IF EXISTS avg_salary;
DELIMITER $$
CREATE PROCEDURE avg_salary (IN param_1 FLOAT, IN param_2 FLOAT)
BEGIN
SELECT
d.dept_name, e.gender, avg(s.salary)  as salary
FROM 
t_employees e
JOIN t_salaries s
ON e.emp_no = s.emp_no
JOIN t_dept_emp de
ON de.emp_no = e.emp_no
JOIN t_departments d
ON d.dept_no = de.dept_no
WHERE s.salary BETWEEN param_1 AND param_2
GROUP BY d.dept_name, e.gender;
END $$
DELIMITER ;

CALL avg_salary(45000, 90000);