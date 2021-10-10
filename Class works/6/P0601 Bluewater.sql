-- Bluewater Consulting


-- DROP TABLES -------------------------------
DROP TABLE BC_PROJECTS;
DROP TABLE BC_EMPLOYEES;
DROP TABLE BC_BILLINGS;
DROP TABLE JOBS;

-- CREATE TABLES -----------------------------
CREATE TABLE BC_PROJECTS (
    project_id int,
    project_name varchar(30),
    leader_id int
);

CREATE TABLE BC_EMPLOYEES (
    employee_id int,
    first_name varchar(30),
	last_name varchar(30),
    title_id int
);

CREATE TABLE BC_BILLINGS (
    project_id int,
    employee_id int,
    hours_billed decimal(3,1)
);

CREATE TABLE JOBS (
    title_id int,
    title varchar(30),
    billing_rate decimal(5,2)
);

-- INSERT Data -------------------------------
INSERT INTO bc_billings VALUES
(15, 103, 23.8),
(15, 101, 19.4),
(15, 105, 35.7),
(15, 106, 12.6),
(15, 102, 23.8),
(18, 114, 25.6),
(18, 118, 45.3),
(18, 104, 32.4),
(18, 112, 45.0),
(22, 105, 65.7),
(22, 104, 48.4),
(22, 113, 23.6),
(22, 111, 22.0),
(25, 106, 12.8),
(25, 107, 25.6),
(25, 115, 45.8),
(25, 101, 56.3),
(25, 114, 33.1),
(25, 108, 23.6),
(25, 118, 30.5),
(25, 112, 41.4);

INSERT INTO bc_employees VALUES
(103, 'June',     'Arbough',    501),
(101, 'John',     'News',       502),
(105, 'Alice',    'Johnson',    502),
(106, 'William',  'Smith',      503),
(102, 'David',    'Senior',     504),
(114, 'Annelise', 'Jones',      503),
(118, 'James',    'Frommer',    505),
(104, 'Anne',     'Ramoras',    504),
(112, 'Darlene',  'Smithson',   506),
(113, 'Jen',      'Clarke',     503),
(111, 'Geoff',    'Wabash',     507),
(107, 'Maria',    'Alonzo',     503),
(115, 'Travis',   'Bawangi',    504),
(108, 'Ralph',    'Washington', 504);



-- DML Statements -------------------------------

INSERT INTO BC_PROJECTS (project_id, project_name)
VALUES (15, 'Lakeview');

INSERT INTO BC_PROJECTS (project_id, project_name)
VALUES (18, 'Web App');

INSERT INTO BC_PROJECTS (project_id, project_name)
VALUES (22, 'Blue Light');

INSERT INTO BC_PROJECTS (project_id, project_name)
VALUES (25, 'Power Lite');




INSERT INTO BC_JOBS
VALUES (501, 'Lead Programmer', 85.50);

INSERT INTO BC_JOBS
VALUES (502, 'Database Designer', 105.00);

INSERT INTO BC_JOBS
VALUES (503, 'Programmer', 37.75);

INSERT INTO BC_JOBS
VALUES (504, 'SYstems Analyst', 96.75);

INSERT INTO BC_JOBS
VALUES (505, 'General Support', 18.36);

INSERT INTO BC_JOBS
VALUES (506, 'DDS Analyst', 45.95);

INSERT INTO BC_JOBS
VALUES (507, 'Clerical Support', 26.87);



UPDATE BC_PROJECTS
SET leader_id = 105
WHERE project_id = 15;

UPDATE BC_PROJECTS
SET leader_id = 104
WHERE project_id = 18;

UPDATE BC_PROJECTS
SET leader_id = 101
WHERE project_id = 25;

 
 
 
DELETE FROM BC_EMPLOYEES 
WHERE first_name = 'Darlene' AND last_name = 'Smithson';


UPDATE BC_BILLINGS
SET hours_billed = 49.5
WHERE project_id = 15 AND employee_id = 105;