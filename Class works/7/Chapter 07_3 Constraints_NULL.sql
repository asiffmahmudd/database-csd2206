-- NULL Constraint
-- Indicates optionality
-----------------------------------------------------------

-- NULL constraint
-- Method 1 - NULL constraint at column level

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id      INTEGER     NOT NULL,
  first_name       VARCHAR(25) NOT NULL,
  last_name        VARCHAR(25) NOT NULL,
  hire_date        DATE,       -- NULL capable (optional)
  work_department  INTEGER     -- NULL capable (optional)
);

-- Examine Constraints


-- Method 2 - NULL constraint at table level
DROP TABLE c7_employees;
CREATE TABLE c7_employees (
    employee_id      INTEGER,
    first_name       VARCHAR(25),
    last_name        VARCHAR(25),
    hire_date        DATE,       -- NULL capable (optional)
    work_department  INTEGER,    -- NULL capable (optional)
  CONSTRAINT c7_employees_employee_id_nn
    CHECK (employee_id IS NOT NULL),
  CONSTRAINT c7_employees_first_name_nn
    CHECK (first_name IS NOT NULL),
  CONSTRAINT c7_employees_last_name_nn
    CHECK (last_name IS NOT NULL)
);

-- Examine Constraints

-- Method 3 - NULL CHECK using ALTER TABLE statement

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id      INTEGER,
  first_name       VARCHAR(25),
  last_name        VARCHAR(25),
  hire_date        DATE,
  work_department  INTEGER
);

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_employee_id_nn
  CHECK ( employee_id IS NOT NULL ); -- employee_id is mandatory

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_first_name_nn
  CHECK ( first_name IS NOT NULL ); -- first_name is mandatory
  
ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_last_name_nn
  CHECK ( last_name IS NOT NULL ); -- last_name is mandatory

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_hire_date_nn
  CHECK ( hire_date IS NOT NULL ); -- hire_date is mandatory


-----INSERTS  --------------------------

-------------------------------------------------------------------
INSERT INTO c7_employees -- valid
  VALUES (01, 'Betty', 'O''Brien', '2014-02-15', 01);

INSERT INTO c7_employees
  VALUES (02, 'Peter', 'Jackson', NULL, 01); -- hire_date IS DEFINED AS not null; cannot be NULL
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.

INSERT INTO c7_employees
  (employee_id, first_name, last_name, work_department)
  VALUES (03, 'Tom', 'Clarke', 01); -- hire_date is missing and cannot be NULL
-- [SQL0545] INSERT, UPDATE, or MERGE not allowed by CHECK constraint.


SELECT * FROM c7_employees;

-- Adding a NULL constraint to a table containing NULL values

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id      INTEGER,
  first_name       VARCHAR(25),
  last_name        VARCHAR(25),
  hire_date        DATE,
  work_department  INTEGER
);

INSERT INTO c7_employees
(employee_id, first_name, last_name, hire_date, work_department)
  VALUES (04, 'Tom', 'Clarke', NULL, 01); -- hire_date is NULL

SELECT * FROM c7_employees;

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_hire_date_nn
  CHECK ( hire_date IS NOT NULL );
-- [SQL0544] CHECK constraint c7_employees_HIRE_DATE_NN cannot be added.

-----------------------------------------------------------
-- DROP NULL constraint

ALTER TABLE c7_employees
  ALTER COLUMN hire_date
  DROP NOT NULL; -- hire_date is Nullable (NULL capable - optional)

/* ----- OR -----

ALTER TABLE c7_employees
  ALTER hire_date
  DROP NOT NULL;

*/


---THE FOLLOWING NEED TO BE CHANGED ----------------------

INSERT INTO emp123  -- m_initial contains a value of space
       ( employee_id, first_name, m_initial, last_name, hire_date,    hourly_rate )
VALUES ( 106,         'Jack',     ' ',       'Clark',   '2014-12-01', 42.55 );

INSERT INTO emp123  -- m_initial and hourly_rate contain a NULL value
       ( employee_id, first_name, m_initial, last_name, hire_date,    hourly_rate )
VALUES ( 107,         'Tom',      NULL,      'Cooke',   '2015-01-22', NULL );

INSERT INTO emp123  -- no value for m_initial - defaults to a NULL value
       ( employee_id, first_name, last_name, hire_date,    hourly_rate )
VALUES ( 108,         'Joe',      'Clark',   '2014-12-01', 33.50 );

SELECT * FROM emp123;



INSERT INTO emp123  -- hire_date contains today's date
       ( employee_id, first_name, m_initial, last_name,   hire_date,    hourly_rate )
VALUES ( 109,         'Len',     'M',        'Moore',     CURRENT_DATE, 38.75 );

SELECT * FROM emp123;
