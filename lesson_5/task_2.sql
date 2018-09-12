USE employees;
#/////////////////////
START TRANSACTION;

INSERT INTO employees VALUE (
  (SELECT @emp_no := emp_no
            FROM (SELECT max(emp_no) + 1 AS emp_no
                  FROM employees) AS e),
  '1981-04-01', 'Sergei', 'Ivanov', 'M', '2000-01-21');

INSERT INTO dept_emp VALUE (@emp_no, 'd005', '2000-01-21', '9999-01-01');

COMMIT;
#////////////////////

START TRANSACTION;

SET @salary = 4000;
UPDATE salaries AS s LEFT JOIN employees AS e ON s.emp_no = e.emp_no
SET s.salary = s.salary - @salary
WHERE last_name = 'Breugel' AND e.first_name = 'Patricia';

UPDATE salaries AS s LEFT JOIN employees AS e ON s.emp_no = e.emp_no
SET s.salary = s.salary + @salary
WHERE last_name = 'Lenart' AND e.first_name = 'Berhard';

COMMIT;