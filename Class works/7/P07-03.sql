-- Drop Tables ---------------

DROP TABLE bd_stores;
DROP TABLE bd_employees;
DROP TABLE bd_store_departments;
DROP TABLE bd_departments;


-- DDL Statements ---------------

CREATE TABLE bd_stores(
	store_id INTEGER,
	city VARCHAR(40),
	store_mgr_id INTEGER
);

CREATE TABLE bd_employees(
	employee_id INTEGER NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	soc_ins_no DECIMAL(9,0) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	pension_contr INTEGER NOT NULL,
	hire_date DATE NOT NULL,
	coach_id INTEGER,
	store_id INTEGER NOT NULL,
	department_id INTEGER NOT NULL,
	job_class VARCHAR(1) NOT NULL,
	job_level DECIMAL(1) NOT NULL,
	salary DECIMAL(9,2) NOT NULL,
	bonus DECIMAL(7),
	commission DECIMAL(7)
);

CREATE TABLE bd_store_departments(
	store_id INTEGER NOT NULL,
	department_id INTEGER NOT NULL,
	dept_mgr_id INTEGER NOT NULL
);

CREATE TABLE bd_departments(
	department_id INTEGER NOT NULL,
	department_name VARCHAR(50) NOT NULL
);

-- Alter Statements --


-- Not Null --
ALTER TABLE bd_stores
  ADD CONSTRAINT bd_stores_store_id_nn
  CHECK ( store_id IS NOT NULL );
  
ALTER TABLE bd_stores
  ADD CONSTRAINT bd_stores_city_nn
  CHECK ( city IS NOT NULL );
  

-- Primary Key --


ALTER TABLE bd_stores
  ADD CONSTRAINT bd_stores_pk
    PRIMARY KEY ( store_id );

ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_pk
    PRIMARY KEY ( employee_id );
	
ALTER TABLE bd_departments
  ADD CONSTRAINT bd_departments_pk
    PRIMARY KEY ( department_id );

ALTER TABLE bd_store_departments
  ADD CONSTRAINT bd_store_departments_pk
    PRIMARY KEY ( store_id, department_id );



-- Foreign Key --


ALTER TABLE bd_stores
  ADD CONSTRAINT bd_stores_store_mgr_id_fk
    FOREIGN KEY ( store_mgr_id ) 
    REFERENCES bd_employees( employee_id ); 


	
	
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_coach_id_fk
    FOREIGN KEY ( coach_id ) 
    REFERENCES bd_employees( employee_id );
	
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_store_id_fk
    FOREIGN KEY ( store_id ) 
    REFERENCES bd_stores( store_id );
	
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_department_id_fk
    FOREIGN KEY ( department_id ) 
    REFERENCES bd_departments( department_id );
		

	
	
ALTER TABLE bd_store_departments
  ADD CONSTRAINT bd_store_departments_store_id_fk
    FOREIGN KEY ( store_id ) 
    REFERENCES bd_stores( store_id );
	
ALTER TABLE bd_store_departments
  ADD CONSTRAINT bd_store_departments_department_id_fk
    FOREIGN KEY ( department_id ) 
    REFERENCES bd_departments( department_id );

ALTER TABLE bd_store_departments
  ADD CONSTRAINT bd_store_departments_dept_mgr_id_fk
    FOREIGN KEY ( dept_mgr_id ) 
    REFERENCES bd_employees( employee_id );
	
	

-- Unique key --

ALTER TABLE bd_stores
ADD CONSTRAINT bd_stores_city_uk
UNIQUE( city );

ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_soc_ins_no_uk
UNIQUE( soc_ins_no );

ALTER TABLE bd_departments
ADD CONSTRAINT bd_stores_department_name_uk
UNIQUE( department_name );


-- Check Constraints --

ALTER TABLE bd_stores
  ADD CONSTRAINT bd_stores_store_id_ck
  CHECK ( store_id BETWEEN 11 AND 99 );
  
ALTER TABLE bd_departments
  ADD CONSTRAINT bd_departments_department_id_ck
  CHECK ( department_id BETWEEN 300 AND 399 );

ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_birth_date_ck
  CHECK ( birth_date >= '1980-01-01' );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_soc_ins_no_ck
  CHECK ( soc_ins_no BETWEEN 1 AND 999999999 );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_sex_ck
  CHECK ( sex IN ('M', 'F') );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_pension_contr_ck
  CHECK ( pension_contr IN (0, 1) );
  
ALTER TABLE bd_employees
  ALTER COLUMN hire_date
  SET DEFAULT CURRENT_DATE;

ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_hire_birth_date_ck
  CHECK ( hire_date > birth_date );
  
ALTER TABLE bd_employees
  ALTER COLUMN job_class
  SET DEFAULT 'T';
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_job_class_ck
  CHECK ( job_class IN ('T', 'J', 'C', 'M') );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_job_level_ck
  CHECK ( job_level BETWEEN 1 AND 9 );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_salary_ck
  CHECK ( salary <= 125000.00 );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_salary_commission_ck
  CHECK ( salary > commission );
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_bonus_commission_ck
  CHECK ( (Bonus > 0 AND commission = 0) OR (commission > 0 AND bonus = 0));
  
ALTER TABLE bd_employees
  ADD CONSTRAINT bd_employees_commission_salary_ck
  CHECK ( commission < salary*0.085 );
  
  

-- DML Statements ---------------

--Populate DEPARTMENTS table					
INSERT INTO bd_departments VALUES (300,'New Hire');					
INSERT INTO bd_departments VALUES (301,'IT');					
INSERT INTO bd_departments VALUES (302,'Administration');
INSERT INTO bd_departments VALUES (303,'Men''s Clothing');
INSERT INTO bd_departments VALUES (304,'Women''s Clothing');
INSERT INTO bd_departments VALUES (305,'Kids');
INSERT INTO bd_departments VALUES (306,'Toys');

--Populate STORES table
INSERT INTO bd_stores VALUES (11,'Sarnia', NULL);
INSERT INTO bd_stores VALUES (22,'London', NULL);
INSERT INTO bd_stores VALUES (33,'Toronto', NULL);

--Populate EMPLOYEES table					
INSERT INTO bd_employees VALUES (201, 'Lauren', 'Alexander', '1980-02-10', 749583756, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 12000, 0);
INSERT INTO bd_employees VALUES (202, 'Lisa',	'James',	'1988-06-16', 396812058, 'F', 0, '2013-12-15', NULL, 22, 305, 'M', 6, 52000, 7500, 0);
INSERT INTO bd_employees VALUES (203, 'Dave',	'Bernard',	'1990-04-28', 184759364, 'M', 1, '2014-05-10', 202,	22, 303, 'C', 3, 24000,	0, 500);
INSERT INTO bd_employees VALUES (204, 'Betty',	'Smith',	'1980-05-15', 744963756, 'F', 1, '2015-10-18', NULL, 22, 304, 'M', 8, 84500, 9200, 0);
INSERT INTO bd_employees VALUES (205, 'Amy',	'Albert',	'1988-09-26', 396396858, 'F', 0, '2016-02-22', NULL, 22, 305, 'J', 6, 42000, 7500, 0);
INSERT INTO bd_employees VALUES (206, 'Peter',	'Alan',	'1990-08-15', 181957464, 'M', 1, '2017-11-11', NULL, 22, 306, 'C', 5, 24000, 0, 500);
INSERT INTO bd_employees VALUES (207, 'Alice',	'Manis',	'1980-03-08', 840681248, 'F', 1, '2015-08-21', NULL, 33, 303, 'M', 8, 84500, 2000, 0);
INSERT INTO bd_employees VALUES (208, 'Brook',	'Payne',	'1988-10-01', 185038596, 'F', 0, '2016-10-14', NULL, 33, 304, 'M', 6, 92000, 7500, 0);
INSERT INTO bd_employees VALUES (209, 'Terry',	'Russell',	'1990-06-20', 205837501, 'M', 1, '2017-04-09', 207,	33, 300, 'T', 3, 24000,	0, 500);
INSERT INTO bd_employees VALUES (210, 'Carol',	'Brown',	'1980-02-25', 740149284, 'F', 1, '2015-08-08', 207,	33, 300, 'T', 3, 24500,	0, 2080);
INSERT INTO bd_employees VALUES (211, 'Casey',	'Emery',	'1988-03-16', 749127485, 'F', 0, '2016-04-12', 206,	22, 300, 'T', 3, 25000,	0, 800);
INSERT INTO bd_employees VALUES (212, 'Bill',	'Jewel',	'1990-05-05', 385012745, 'M', 1, '2017-10-12', 202,	11, 300, 'T', 3, 24500,	0, 500);

--Populate STORE_DEPARTMENTS table
INSERT INTO bd_store_departments VALUES (11, 304, 201);
INSERT INTO bd_store_departments VALUES (11, 300, 212);
INSERT INTO bd_store_departments VALUES (22, 303, 202);
INSERT INTO bd_store_departments VALUES (22, 304, NULL);
INSERT INTO bd_store_departments VALUES (22, 305, 205);
INSERT INTO bd_store_departments VALUES (22, 306, 206);
INSERT INTO bd_store_departments VALUES (33, 300, 210);
INSERT INTO bd_store_departments VALUES (33, 304, 208);



--Testing --

INSERT INTO bd_stores VALUES (100,'Scarborough', NULL);   -- store_id out of range

INSERT INTO bd_departments VALUES (200,'Cleaning');  -- department_id out of range

INSERT INTO bd_employees VALUES (220, 'Lauren', 'Alexander', '1979-02-10', 5674456, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 12000, 0); --birth_date less than 1980

INSERT INTO bd_employees VALUES (221, 'Lauren', 'Alexander', '1980-02-10', 0, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 12000, 0); --soc_ins_no out of range

INSERT INTO bd_employees VALUES (222, 'Lauren', 'Alexander', '1980-02-10', 6574565, 'F', 1, '2012-09-22', NULL, 11, 304, 'K', 8, 74500, 12000, 0); -- Gender not in M or F

INSERT INTO bd_employees VALUES (223, 'Lauren', 'Alexander', '1980-02-10', 56745643, 'F', 2, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 12000, 0); -- pension contribution not 1 or 0

INSERT INTO bd_employees VALUES (224, 'Kauren', 'lexander', '1980-02-10', 749584532, 'F', 1, DEFAULT, NULL, 11, 304, 'M', 8, 74500, 12000, 0); -- Joining date has a default value of current date

INSERT INTO bd_employees VALUES (225, 'Lauren', 'Alexander', '1981-02-10', 5474532, 'F', 1, '1980-09-22', NULL, 11, 304, 'M', 8, 74500, 12000, 0); -- hiring date less than birthdate

INSERT INTO bd_employees VALUES (226, 'Bruce', 'Wayne', '1980-02-10', 45673423, 'F', 1, '2012-09-22', NULL, 11, 304, DEFAULT, 8, 74500, 12000, 0); -- job_class has a default value of T

INSERT INTO bd_employees VALUES (227, 'Lauren', 'Alexander', '1980-02-10', 2342342, 'F', 1, '2012-09-22', NULL, 11, 304, 'N', 8, 74500, 12000, 0); -- job_class not in T, J, C or M

INSERT INTO bd_employees VALUES (228, 'Clark', 'Kent', '1980-02-10', 23445267, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 11, 74500, 12000, 0); -- job_level out of range

INSERT INTO bd_employees VALUES (229, 'Lauren', 'Alexander', '1980-02-10', 567343234, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 126000, 12000, 0); -- salary more than 125000

INSERT INTO bd_employees VALUES (230, 'Lauren', 'Alexander', '1980-02-10', 1232345, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 0, 120000); --salary less than commission

INSERT INTO bd_employees VALUES (231, 'Lauren', 'Alexander', '1980-02-10', 542342, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 0, 0); -- bonus and commission both zero

INSERT INTO bd_employees VALUES (232, 'Lauren', 'Alexander', '1980-02-10', 45632, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 74500, 0, 12000); --commssion is not less than 8.5% of salary