
-- Recursive Relationship - Foreign Key

-- Example 1
-- No Foreign Key defined

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id       NUMERIC(3)   NOT NULL ,
  first_name        VARCHAR(20)  NOT NULL ,
  last_name         VARCHAR(20)  NOT NULL ,
  supervisor_id     NUMERIC(3)
);

ALTER TABLE c7_employees
  ADD CONSTRAINT c7_employees_pk
    PRIMARY KEY ( employee_id );
    
INSERT INTO c7_employees
  VALUES (101, 'Betty', 'Smith',    NULL),
         (102, 'Peter', 'Jackson',  101),
         (103, 'Janet', 'Jones',    102),
         (104, 'Sally', 'Allen',    102),
         (105, 'Joe',   'Burns',    111);  -- Employee 111 does not exist, but is still inserted  

SELECT * FROM c7_employees;
        
-- Example 2
-- Foreign Key Defined

DROP TABLE c7_employees;
CREATE TABLE c7_employees (
  employee_id       NUMERIC(3)      NOT NULL ,
  first_name        VARCHAR (20)    NOT NULL ,
  last_name         VARCHAR (20)    NOT NULL ,
  supervisor_id     NUMERIC(3)
);

ALTER TABLE c7_employees
  ADD CONSTRAINT employees_pk
    PRIMARY KEY ( employee_id );
    
ALTER TABLE c7_employees
  ADD CONSTRAINT employees_supervisor_id_fk
    FOREIGN KEY ( supervisor_id )           -- Foreign key supervisor_id points back to primary key employee_id
    REFERENCES c7_employees( employee_id );
    
INSERT INTO c7_employees
  VALUES (101, 'Betty', 'Smith',    NULL),
         (102, 'Peter', 'Jackson',  101),
         (103, 'Janet', 'Jones',    102),
         (104, 'Sally', 'Allen',    102);

SELECT * FROM c7_employees;
        
INSERT INTO c7_employees
  VALUES (105, 'Joe',   'Burns',    111);  -- Employee 111 does not exist, FK error  
-- [SQL0530] Operation not allowed by referential constraint EMPLOYEES_SUPERVISOR_ID_FK in IBM01.       
         

-- Looking into the future
SELECT s.first_name || ' ' || s.last_name AS "Supervisor name", e.first_name || ' ' || e.last_name AS "Employee name"
  FROM c7_employees AS s
  JOIN c7_employees AS e
    ON( e.supervisor_id = s.employee_id );
  
  
  