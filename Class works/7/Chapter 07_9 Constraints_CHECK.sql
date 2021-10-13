-----------------------------------------------------------
-- Limit Check
-- Method 1 - CHECK constraint at column level

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER      NOT NULL,
  first_name  VARCHAR (15) NOT NULL,
  last_name   VARCHAR (15) NOT NULL,
  salary      DECIMAL(7,0) CHECK ( salary < 92000.00 ),
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

-- View constraint name

--------------------------------------------------------------
-- Method 2 - CHECK constraint at table level

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER      NOT NULL,
  first_name  VARCHAR (15) NOT NULL,
  last_name   VARCHAR (15) NOT NULL,
  salary      DECIMAL(7,0),
CONSTRAINT c7_employees_pk
  PRIMARY KEY( employee_id ),
  CHECK ( salary < 92000.00 ) );    -- No constraint name

--------------------------------------------------------------
-- Method 3 - CHECK constraint at table level with constraint name

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER      NOT NULL,
  first_name  VARCHAR (15) NOT NULL,
  last_name   VARCHAR (15) NOT NULL,
  salary      DECIMAL(7,0),
CONSTRAINT c7_employees_pk
  PRIMARY KEY( employee_id ),
CONSTRAINT c7_employees_salary_ck
  CHECK ( salary < 92000.00 ) );

--------------------------------------------------------------
-- Method 4 - CHECK constraint using ALTER TABLE

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER      NOT NULL,
  first_name  VARCHAR (15) NOT NULL,
  last_name   VARCHAR (15) NOT NULL,
  salary      DECIMAL(7,0),
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_salary_ck
  CHECK ( salary < 92000.00 );

INSERT INTO c7_employees
VALUES ( 101, 'Sally', 'Jones', 74500 ),
       ( 102, 'Peter', 'Allen', 42000 );

INSERT INTO c7_employees
VALUES ( 103, 'Betty', 'Jackson', 92500 ); -- Invalid salary
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- Adding a constraint that violates existing rows

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER     NOT NULL,
  first_name  VARCHAR(15) NOT NULL,
  last_name   VARCHAR(15) NOT NULL,
  salary      DECIMAL(7,0),
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

INSERT INTO c7_employees
VALUES ( 101, 'Sally', 'Jones', 150000 ),
       ( 102, 'Peter', 'Allen', 42000  );

SELECT * FROM c7_employees;

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_salary_ck
  CHECK ( salary <= 92000.00 ); -- table contains a value > 92000.00
-- [SQL0544] CHECK constraint c7_employees_SALARY_CK cannot be added.

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- Limit Check - 2nd Example

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER NOT NULL,
  birth_date  DATE    NOT NULL,
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_birth_date_ck
  CHECK ( birth_date > '1985-01-01' );

-- Constraint testing
INSERT INTO c7_employees -- valid
  VALUES ( 101, '1990-05-01' ),
         ( 102, '2000-09-15' );

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 103, '1980-05-15' ); -- Invalid birth date
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- Range Check

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER      NOT NULL,
  hourly_rate DECIMAL(7,2) NOT NULL,
CONSTRAINT c7_employees_employee_id_pk
PRIMARY KEY( employee_id ) );

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_hourly_rate_ck
  CHECK ( hourly_rate BETWEEN 15.75 AND 46.75 );

INSERT INTO c7_employees
  VALUES ( 101, 15.75 ),
         ( 102, 46.75 ),
         ( 103, 42.00 );

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 104, 46.80 ); -- hourly_rate outside range
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

--------------------------------------------------------------
-- Compare Two Columns

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER NOT NULL,
  birth_date  DATE    NOT NULL,
  hire_date   DATE    NOT NULL,
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_birth_hire_dates_ck
  CHECK ( hire_date > birth_date );

INSERT INTO c7_employees
  VALUES ( 101, '1990-05-01', '2005-12-15' ),
         ( 102, '1995-09-15', '2015-08-10' );

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 103, '2000-05-15', '1980-04-18' ); -- Dates are reversed
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

-- 2nd Example - Compare Two Columns

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_comm_salary_ck
  CHECK ( salary > commission );

--------------------------------------------------------------
-- Compare to list of values

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER    NOT NULL,
  job_class   VARCHAR(1) DEFAULT 'T',
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id )
);

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_job_class_ck
  CHECK ( job_class IN ( 'T', 'J', 'C', 'M') );

INSERT INTO c7_employees
  VALUES ( 101, 'T' ),
         ( 102, 'J' ),
         ( 103, 'C' ),
         ( 104, 'M' );

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 105, 'A' ); -- Invalid job class
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

INSERT INTO c7_employees
  VALUES ( 105, 't' ); -- Invalid job class
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- 2nd Example - Compare to list of values

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_sex_ck
  CHECK ( sex IN ( 'F', 'M' ) );

--------------------------------------------------------------
-- Boolean Data Type - Using INTEGER data type

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER NOT NULL,
  status      INTEGER DEFAULT 1,
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id )
);

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_status_ck
  CHECK ( status IN ( 0, 1 ) );

INSERT INTO c7_employees
  VALUES (101, 1), -- Active employee
         (102, 0), -- Inactive employee
         (103, DEFAULT); -- Just hired, and defaults to active

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- Boolean Data Type - Using CHAR data type

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER    NOT NULL,
  status      VARCHAR(1) DEFAULT 'Y',
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id )
);

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_status_ck
  CHECK ( status IN ( 'Y', 'N' ) );

INSERT INTO c7_employees
  VALUES ( 101, 'Y' ), -- Active employee
         ( 102, 'N' ), -- Inactive employee
         ( 103, DEFAULT ); -- Just hired, and defaults to active

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 104, 'y' ); -- Lower case 'y' is not allowed
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

--------------------------------------------------------------
-- Must be a value for one of two columns

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id    INTEGER     NOT NULL,
  commission     DECIMAL(5)  NOT NULL DEFAULT 0,
  bonus          DECIMAL(5)  NOT NULL DEFAULT 0,
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id )
);

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_comm_bonus_ck
  CHECK ( commission > 0 OR bonus > 0 );

INSERT INTO c7_employees
  VALUES ( 101, 555, DEFAULT ),  -- Commission only
         ( 102,DEFAULT, 1555 );  -- Bonus only

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 103, 0, 0 );  -- Constraint violation
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;  


INSERT INTO c7_employees
  VALUES ( 103, 555, 1555 );  -- Inserting values in both columns - Is this what we want?
  
SELECT * FROM c7_employees; 
  
--------------------------------------------------------------
-- Check more than two columns for a combination of values

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER    NOT NULL,
  commission  DECIMAL(5) NOT NULL DEFAULT 0,
  bonus       DECIMAL(5) NOT NULL DEFAULT 0,
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id )
);

ALTER TABLE c7_employees
  ADD CONSTRAINT comm_bonus_ck
  CHECK ( (commission > 0 AND bonus = 0)
     OR ( commission  = 0 AND bonus > 0) );

INSERT INTO c7_employees
  VALUES ( 101, 1500, 0 ),
         ( 102, 0, 3000 );
		 
SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 103, 1500, 3000 ); -- Error - both columns have a value > 0
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

INSERT INTO c7_employees -- Error - both columns are 0
  VALUES ( 104, 0, 0 );
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

INSERT INTO c7_employees -- Error - negative number
  VALUES ( 105, -1000, 0 );
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

SELECT * FROM c7_employees;

-- 2nd Example --------------------------------------------------------

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id       INTEGER     NOT NULL,
  salary            DECIMAL(5)  NOT NULL DEFAULT 0,
  bonus             DECIMAL(5)  NOT NULL DEFAULT 0,
  hourly_rate       DECIMAL(5)  NOT NULL DEFAULT 0,
  commission_earned DECIMAL(5)  NOT NULL DEFAULT 0,
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

ALTER TABLE c7_employees
  ADD CONSTRAINT emp_salary_hourly_ck
  CHECK ( ( salary > 0 AND bonus > 0 AND hourly_rate = 0 AND commission_earned = 0 ) OR
          ( hourly_rate > 0 AND commission_earned > 0 AND salary = 0 AND bonus = 0 ) );

INSERT INTO c7_employees -- Valid inserts
  VALUES ( 101, 50000, 20000, 0, 0 ),
         ( 102, 65000, 25000, DEFAULT, DEFAULT ),
         ( 103, 0, 0, 125, 500 ),
         ( 104, DEFAULT, DEFAULT, 125, 500 );

SELECT * FROM c7_employees;

INSERT INTO c7_employees
  VALUES ( 105, 50000, 0, 0, 0 ); -- salary > 0, but bonus = 0
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

INSERT INTO c7_employees
  VALUES ( 106, 50000, 20000, 45.00, 0 ); -- salary and hourly_rate > 0
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.
-- and so on ...

-- --------------------------------------------------------
-- BEWARE

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id INTEGER NOT NULL,
  salary      DECIMAL(7,0),
CONSTRAINT c7_employees_pk
PRIMARY KEY( employee_id ) );

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_salary_ck
  CHECK ( salary > 150000 AND salary < 100000 );

INSERT INTO c7_employees
  VALUES ( 101, 165000 ); -- salary > 150000
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

INSERT INTO c7_employees
  VALUES ( 102, 95000 ); -- salary < 100000
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

-- --------------------------------------------------------
-- DROP CHECK Constraint
ALTER TABLE c7_employees
  DROP CONSTRAINT emp_salary_hourly_ck;


