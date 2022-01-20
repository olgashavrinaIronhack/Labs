use employees_mod;
DELIMITER $$
CREATE PROCEDURE avg_sal()
BEGIN
SELECT avg(salary) FROM t_salaries;
END$$ DELIMITER ;
CALL avg_sal();

select * from t_employees limit10;
-- emp info
DELIMITER $$
CREATE PROCEDURE emp_info4(in fname text, in lname text)  
BEGIN
SELECT emp_no FROM t_employees
where fname=first_name and lname=last_name;
END$$ DELIMITER ;
call emp_info4 ('Saniya','Kalloufi');
DELIMITER $$ 
CREATE FUNCTION emp_info9 (fname VARCHAR(255), lname VARCHAR(255)) RETURNS INT 
DETERMINISTIC
BEGIN 
	DECLARE v_salary INT;
	declare v_max_date DATE; 
	SELECT max(s.from_date) into v_max_date from t_employees as e
    join t_salaries as s on e.emp_no=s.emp_no where e.first_name=fname and e.last_name=lname;
	select s.salary into v_salary from t_employees as e
    join t_salaries as s ON e.emp_no=s.emp_no
    where e.first_name=fname and e.last_name=lname and s.from_date=v_max_date;
    RETURN v_salary;
END$$ 

select emp_info9('Mary',"Sluis");
DELIMITER $$
CREATE TRIGGER check_hire_date
BEFORE UPDATE ON t_employees 
FOR EACH ROW
BEGIN
	IF NEW.hire_date > sysdate() THEN
		SET NEW.hire_date = sysdate();
    END IF;
END $$
CREATE INDEX i_hire_date1 ON t_employees (hire_date);
END$$ 
DROP INDEX i_hire_date1 ON t_employees; 
END$$
select * from t_salaries where salary>'89000';
-- CREATE INDEX i_salary ON t_salaries (salary);
END$$
select e.emp_no, e.first_name, e.last_name , 
CASE WHEN e.emp_no in (select emp_no from t_dept_manager) 
THEN "Manager" ELSE "Regular"
END AS Category from t_employees e left join t_dept_manager dm
on e.emp_no=dm.emp_no
where e.emp_no>109990;
END$$ 
select dm.emp_no, first_name, last_name, max(salary)-min(salary) as diff, 
CASE WHEN (max(salary)-min(salary))>30000
then "significant" else 'ns'
END AS "Raise"
from t_dept_manager dm 
join t_employees e on e.emp_no=dm.emp_no
join t_salaries s on s.emp_no=dm.emp_no
group by s.emp_no;
END$$
select * from t_dept_emp limit 20;
END$$
select e.emp_no, first_name, last_name, 
CASE WHEN  tde.to_date like '9999%'
then "still employed" else 'left'
END AS "Current status"
from t_employees e 
join t_dept_emp tde on e.emp_no=tde.emp_no;
group by e.emp_no, max(from_date) limit 100;
end$$