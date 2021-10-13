-- 1.2 DEFAULT Constraint

-- DEFAULT constraint at column level
DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id  INTEGER,
  hire_date    DATE         DEFAULT CURRENT_DATE,
  hourly_rate  DECIMAL(7,2) DEFAULT 22.45,
  pension      VARCHAR(1)   DEFAULT 'N' );

INSERT INTO c7_employees
VALUES (101, '2015-12-28', 26.00, 'Y'),
       (102, DEFAULT, 24.50, 'Y'),
       (103, '2015-05-20', DEFAULT, 'Y'),
       (104, '2016-04-24', 32.00, DEFAULT);

SELECT * FROM c7_employees;

INSERT INTO c7_employees
(employee_id) VALUES (105);

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- DEFAULT constraint using ALTER TABLE

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id  INTEGER,
  hire_date    DATE,
  hourly_rate  DECIMAL(7,2),
  pension      VARCHAR(1) );

ALTER TABLE c7_employees
  ALTER COLUMN hire_date
  SET DEFAULT CURRENT_DATE;

ALTER TABLE c7_employees
  ALTER COLUMN hourly_rate
  SET DEFAULT 22.45;

ALTER TABLE c7_employees
  ALTER COLUMN pension
  SET DEFAULT 'N';

INSERT INTO c7_employees
VALUES (101, '2015-12-28', 26.00, 'Y'),
       (102, DEFAULT, 24.50, 'Y'),
       (103, '2015-05-20', DEFAULT, 'Y'),
       (104, '2016-04-24', 32.00, DEFAULT);

SELECT * FROM c7_employees;

INSERT INTO c7_employees
(employee_id) VALUES (105);

SELECT * FROM c7_employees;




-- Add Column after database table is populated with data
DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id  INTEGER,
  hire_date    DATE DEFAULT CURRENT_DATE );

INSERT INTO c7_employees
VALUES (101, '2015-12-28'),
       (102, '2015-12-28'),
       (103, '2015-05-20'),
       (104, '2016-04-24');
         
SELECT * FROM c7_employees;        

ALTER TABLE c7_employees
  ADD pension VARCHAR(1) DEFAULT 'N'; -- What happens?

ALTER TABLE c7_employees
  ADD hourly_rate DECIMAL(7,2);  -- What would be the result if there is no DEFAULT specified

ALTER TABLE c7_employees
  ADD bonus DECIMAL(7,2) NOT NULL;  -- What would be the result if there is no DEFAULT specified

ALTER TABLE c7_employees
  ADD bonus DECIMAL(7,2) NOT NULL DEFAULT 5000;
  
SELECT * FROM c7_employees;


--------------------------------------------------------------
-- DROP a DEFAULT Constraint

ALTER TABLE c7_employees
  ALTER COLUMN pension
  DROP DEFAULT;

----- OR -----

ALTER TABLE c7_employees
  ALTER pension
  DROP DEFAULT;


