DELIMITER //
CREATE FUNCTION get_id_manager(f_name VARCHAR(16), l_name VARCHAR(16))
  RETURNS INT DETERMINISTIC
  BEGIN
    DECLARE id INT;
    SELECT e.emp_no
    INTO id
    FROM employees AS e
      INNER JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
    WHERE e.first_name = f_name AND e.last_name = l_name;
    RETURN id;
  END//
DELIMITER ;
