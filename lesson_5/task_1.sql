#/////////////////user1
LOCK TABLES departments READ;

SELECT *
FROM departments;

UNLOCK TABLES;

SHOW PROCESSLIST;

#///////////////user2
SELECT *
FROM departments;

INSERT INTO departments VALUE ('q777', 'test');

DELETE FROM departments
WHERE dept_no = 'q777';
