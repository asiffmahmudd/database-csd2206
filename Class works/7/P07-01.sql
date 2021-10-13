-- Bluewater Consulting


-- DROP TABLES -------------------------------
DROP TABLE bc_projects;
DROP TABLE bc_employees;
DROP TABLE bc_billings;
DROP TABLE bc_jobs;

-- CREATE TABLES -----------------------------
CREATE TABLE bc_projects (
    project_id INTEGER NOT NULL,
    project_name VARCHAR(30) NOT NULL,
    leader_id INTEGER
);


CREATE TABLE bc_employees (
    employee_id INTEGER NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    title_id INTEGER NOT NULL
);


CREATE TABLE bc_billings (
    project_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    hours_billed DECIMAL(3,1) NOT NULL
);


CREATE TABLE bc_jobs (
    title_id INTEGER NOT NULL,
    title VARCHAR(30) NOT NULL,
    billing_rate DECIMAL(5,2) DEFAULT 44.0
);



ALTER TABLE bc_projects
  ADD CONSTRAINT bc_projects_pk
    PRIMARY KEY ( project_id );

ALTER TABLE bc_employees
  ADD CONSTRAINT bc_employees_pk
    PRIMARY KEY ( employee_id );

ALTER TABLE bc_billings
  ADD CONSTRAINT bc_billings_project_id_pk
    PRIMARY KEY ( project_id, employee_id );
  
ALTER TABLE bc_jobs
  ADD CONSTRAINT bc_jobs_pk
    PRIMARY KEY ( title_id );

  
  

ALTER TABLE bc_projects
  ADD CONSTRAINT bc_projects_leader_id_fk
    FOREIGN KEY ( leader_id ) 
    REFERENCES bc_employees( employee_id );

ALTER TABLE bc_employees
  ADD CONSTRAINT bc_employees_title_id_fk
    FOREIGN KEY ( title_id ) 
    REFERENCES bc_jobs( title_id );

ALTER TABLE bc_billings
  ADD CONSTRAINT bc_billings_project_id_fk
    FOREIGN KEY ( project_id ) 
    REFERENCES bc_projects( project_id );

ALTER TABLE bc_billings
  ADD CONSTRAINT bc_billings_employee_id_fk
    FOREIGN KEY ( employee_id ) 
    REFERENCES bc_employees( employee_id );

  

ALTER TABLE bc_projects
  ADD CONSTRAINT bc_projects_project_name_uk
   UNIQUE( project_name );

ALTER TABLE bc_jobs
  ADD CONSTRAINT bc_jobs_title_uk
   UNIQUE( title );




-- DML Statements -------------------------------
-- INSERT Data -------------------------------
 

INSERT into bc_jobs
VALUES (501, 'Lead Programmer', 85.50);

INSERT into bc_jobs
VALUES (502, 'Database Designer', 105.00);

INSERT into bc_jobs
VALUES (503, 'Programmer', 37.75);

INSERT into bc_jobs
VALUES (504, 'Systems Analyst', 96.75);

INSERT into bc_jobs
VALUES (505, 'General Support', 18.36);

INSERT into bc_jobs
VALUES (506, 'DDS Analyst', 45.95);

INSERT into bc_jobs
VALUES (507, 'Clerical Support', 26.87);

 
INSERT into bc_employees VALUES
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


INSERT into bc_projects (project_id, project_name)
VALUES (15, 'Lakeview');

INSERT into bc_projects (project_id, project_name)
VALUES (18, 'Web App');

INSERT into bc_projects (project_id, project_name)
VALUES (22, 'Blue Light');

INSERT into bc_projects (project_id, project_name)
VALUES (25, 'Power Lite');


INSERT into bc_billings VALUES
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





-- TESTING --

-- Default charge --
INSERT into bc_jobs
VALUES (508, 'UI Designer', DEFAULT);


-- PK CONSTRAINT --
INSERT into bc_employees
  VALUES (101, 'Roger', 'Dat', 501);                         -- Duplicate key error


-- NOT NULL CONSTRAINT --
INSERT into bc_projects (project_id, project_name)
VALUES (35, NULL, 101);                                      -- project_name cannot be null

INSERT into bc_projects (project_id, project_name)
VALUES (36, 101);                                            -- project_name cannot be null


-- UNIQUE key CONSTRAINT --
INSERT into bc_jobs
VALUES (610, 'Lead Programmer', 100.50);                     --Duplicate unique key error


-- Foreign key CONSTRAINT --
INSERT into bc_employees
  VALUES (301, 'Steve', 'Rogers', 100);            --FOREIGN key value does not match a value in the parent key of CONSTRAINT

