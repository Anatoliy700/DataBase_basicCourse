#/////Task 1////////
SELECT
  cc.title AS city,
  r.title  AS region,
  c.title  AS country
FROM _cities cc
  LEFT JOIN _regions r ON cc.region_id = r.id
  LEFT JOIN _countries c ON cc.country_id = c.id
WHERE cc.title = 'Кострома';

#/////Task 2////////
SELECT
  r.title AS region,
  c.title AS cities
FROM _regions r
  LEFT JOIN _cities c ON c.region_id = r.id
WHERE r.title = 'Московская область';

#/////Task 3////////
SELECT
  d.dept_name                AS departments,
  TRUNCATE(AVG(s.salary), 0) AS AVG_salary
FROM departments d
  LEFT JOIN dept_emp de
    ON de.dept_no = d.dept_no
  LEFT JOIN salaries s
    ON s.emp_no = de.emp_no
GROUP BY departments;

#/////Task 4////////
SELECT
  CONCAT(e.first_name, ' ', e.last_name) AS full_name,
  MAX(s.salary)                          AS max_salary
FROM employees e
  LEFT JOIN salaries s ON s.emp_no = e.emp_no
#   RIGHT JOIN salaries s ON s.emp_no = e.emp_no
# WHERE s.emp_no IS NOT NULL
GROUP BY e.emp_no;

#/////Task 5////////


#/////Task 6////////
SELECT COUNT(de.emp_no) AS count_emp
FROM departments AS d
  LEFT JOIN dept_emp AS de
    ON de.dept_no = d.dept_no;
