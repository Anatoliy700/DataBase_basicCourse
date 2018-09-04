CREATE TABLE IF NOT EXISTS salary (
  emp_no INT      NOT NULL,
  salary INT      NOT NULL,
  date   DATETIME NOT NULL DEFAULT NOW()
);

ALTER TABLE salary
  ADD PRIMARY KEY (emp_no, date),
  ADD CONSTRAINT salary_emp_fk FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  ADD INDEX (emp_no);

DELIMITER //
CREATE TRIGGER add_emp
AFTER INSERT ON employees
FOR EACH ROW
  BEGIN
    INSERT INTO salary
    SET emp_no = NEW.emp_no, salary = 5000;
  END //
DELIMITER ;