
-- 1.4 UNIQUE Constraints

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id  INTEGER       NOT NULL,
  badge_no     DECIMAL(5,0)  NOT NULL  UNIQUE, -- Candidate key not assigned a name
  first_name   VARCHAR(25)   NOT NULL,
  last_name    VARCHAR(25)   NOT NULL,
  soc_sec_no   DECIMAL(9,0)  NOT NULL  UNIQUE -- Candidate key not assigned a name
);

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id  INTEGER       NOT NULL,
  badge_no     DECIMAL(5,0)  NOT NULL,  -- Candidate key
  first_name   VARCHAR(25)   NOT NULL,
  last_name    VARCHAR(25)   NOT NULL,
  soc_sec_no   DECIMAL(9,0)     -- Candidate key 
);

ALTER TABLE c7_employees
ADD CONSTRAINT c7_employees_badge_no_uk
UNIQUE( badge_no );
	
ALTER TABLE c7_employees
ADD CONSTRAINT c7_employees_soc_sec_no_uk
UNIQUE( soc_sec_no );
------------------------------------------------------
ALTER TABLE c7_employees                        -- Syntax to drop a unique, foreign key, or check constraint constraint
DROP CONSTRAINT c7_employees_badge_no_uk      -- Dropping two constraints in one ALTER TABLE statement
DROP CONSTRAINT c7_employees_soc_sec_no_uk; 

ALTER TABLE c7_employees                        -- Adding two constraints in one ALTER TABLE statement
ADD CONSTRAINT c7_employees_badge_no_uk
   UNIQUE( badge_no )
ADD CONSTRAINT c7_employees_soc_sec_no_uk
   UNIQUE( soc_sec_no );

------------------------------------------------------
-- Unique Constraint Testing

INSERT INTO c7_employees
  VALUES (01, 11, 'Betty', 'O''Brien', 111111111),
         (02, 22, 'Peter', 'Jackson',  222222222),
         (03, 33, 'Peter', 'Jackson',  NULL);

SELECT * FROM c7_employees;

-- Unique constraint error
INSERT INTO c7_employees
  VALUES (04, 44, 'Janet', 'Jones', 111111111); -- Unique constraint error
-- [SQL0803] Duplicate key value specified.

SELECT * FROM c7_employees;
