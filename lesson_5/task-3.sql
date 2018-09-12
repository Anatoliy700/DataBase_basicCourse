USE employees;

EXPLAIN SELECT
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


EXPLAIN SELECT COUNT(de.emp_no) AS count_emp
        FROM departments AS d
          LEFT JOIN dept_emp AS de
            ON de.dept_no = d.dept_no;

EXPLAIN SELECT
          CONCAT(e.first_name, ' ', e.last_name) AS full_name,
          MAX(s.salary)                          AS max_salary
        FROM employees e
          LEFT JOIN salaries s ON s.emp_no = e.emp_no
        #   RIGHT JOIN salaries s ON s.emp_no = e.emp_no
        # WHERE s.emp_no IS NOT NULL
        GROUP BY e.emp_no;

EXPLAIN SELECT
          d.dept_name                AS departments,
          TRUNCATE(AVG(s.salary), 0) AS AVG_salary
        FROM departments d
          LEFT JOIN dept_emp de
            ON de.dept_no = d.dept_no
          LEFT JOIN salaries s
            ON s.emp_no = de.emp_no
        GROUP BY departments;

USE geodata;
EXPLAIN SELECT
          r.title AS region,
          c.title AS cities
        FROM _regions r
          LEFT JOIN _cities c ON c.region_id = r.id
        WHERE r.title = 'Московская область';