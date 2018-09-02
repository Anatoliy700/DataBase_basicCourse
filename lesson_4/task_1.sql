CREATE VIEW info_сity AS
  SELECT
    cc.title AS city,
    r.title  AS region,
    c.title  AS country
  FROM _cities AS cc
    LEFT JOIN _regions AS r ON cc.region_id = r.id
    LEFT JOIN _countries AS c ON cc.country_id = c.id;


CREATE VIEW cities_from_region AS
  SELECT
    r.title AS region,
    c.title AS cities
  FROM _regions AS r
    LEFT JOIN _cities AS c ON c.region_id = r.id;


CREATE VIEW avg_salary_dept AS
  SELECT
    d.dept_name                AS departments,
    TRUNCATE(AVG(s.salary), 0) AS AVG_salary
  FROM departments AS d
    LEFT JOIN dept_emp AS de ON de.dept_no = d.dept_no
    LEFT JOIN salaries AS s ON s.emp_no = de.emp_no
  GROUP BY departments;

CREATE VIEW max_salary_emp AS
  SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    MAX(s.salary)                          AS max_salary
  FROM employees AS e
    LEFT JOIN salaries AS s ON s.emp_no = e.emp_no
  GROUP BY e.emp_no;

CREATE VIEW emp_max_wage AS
  SELECT t.emp_no
  FROM (SELECT
          e.emp_no,
          MAX(s.salary) AS max_salary
        FROM employees AS e
          LEFT JOIN salaries AS s ON s.emp_no = e.emp_no
        GROUP BY e.emp_no
        ORDER BY max_salary DESC
        LIMIT 1) AS t;

CREATE VIEW count_emp AS
  SELECT COUNT(de.emp_no) AS count_emp
  FROM departments AS d
    LEFT JOIN dept_emp AS de ON de.dept_no = d.dept_no;

CREATE VIEW total_salary_dept AS
  SELECT
    d.dept_name      AS departments,
    COUNT(de.emp_no) AS count_emp,
    SUM(s.salary)    AS total_salary
  FROM departments AS d
    LEFT JOIN dept_emp AS de ON d.dept_no = de.dept_no
    LEFT JOIN (SELECT
                 emp_no,
                 CEIL(AVG(salary)) AS salary
               FROM salaries
               GROUP BY emp_no
              ) AS s ON s.emp_no = de.emp_no
  GROUP BY d.dept_name;
