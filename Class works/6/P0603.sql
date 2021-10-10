-- Drop Tables ---------------

DROP TABLE RP_INVENTORY;
DROP TABLE RP_WAREHOUSE;
DROP TABLE RP_CUSTOMERS;
DROP TABLE RP_REPS;
DROP TABLE RP_ORDER_LINES;
DROP TABLE RP_ORDERS;
DROP TABLE RP_PRODUCTS;
DROP SEQUENCE order_id_seq;


-- DDL Statements ---------------

CREATE TABLE RP_INVENTORY(
	warehouse_id int,
	product_code varchar(20),
	qoh int
);

CREATE TABLE RP_WAREHOUSE(
	warehouse_id int,
	city varchar(20)
);

CREATE TABLE RP_CUSTOMERS(
	customer_id INTEGER
		GENERATED ALWAYS AS IDENTITY
		(START WITH 100 INCREMENT BY 10),
	customer_name varchar(30),
	street varchar(100),
	city varchar(20),
	cust_state varchar(20),
	zip varchar(20),
	balance decimal(7,2),
	credit_limit decimal(7,2),
	rep_id int
);

CREATE TABLE RP_REPS(
	rep_id INTEGER
		GENERATED ALWAYS AS IDENTITY
		(START WITH 10 INCREMENT BY 5),
	last_name varchar(30),
	first_name varchar(20),
	street varchar(100),
	city varchar(20),
	rep_state varchar(20),
	zip varchar(20),
	commission decimal(7,2),
	rate decimal(3,2)
);

CREATE TABLE RP_ORDER_LINES(
	order_id int,
	product_code varchar(20),
	num_ordered int,
	quoted_price decimal(6,2)
);

CREATE TABLE RP_ORDERS(
	order_id int,
	order_date date,
	customer_id int
);

CREATE TABLE RP_PRODUCTS(
	product_code varchar(20),
	description varchar(100),
	product_class varchar(20),
	price decimal(6,2)
);

CREATE OR REPLACE SEQUENCE order_id_seq
  START WITH 1000
  INCREMENT BY 1
  MAXVALUE 999999
  NO CACHE
  NO CYCLE;

DROP TABLE RP_ORDER_LINES2;
CREATE TABLE RP_ORDER_LINES2(
	order_id int,
	product_code varchar(20),
	num_ordered int,
	quoted_price decimal(6,2)
);

DROP TABLE RP_ORDERS2;
CREATE TABLE RP_ORDERS2(
	order_id INTEGER
		GENERATED ALWAYS AS IDENTITY
		(START WITH 1000 INCREMENT BY 1),
	order_date date,
	customer_id int
);

-- DML Statements ---------------

INSERT INTO rp_inventory VALUES
(100, 'AT94', 43),
(100, 'BV06', 24),
(100, 'CD52', 21),
(100, 'DL71', 11),
(100, 'DR93', 31),
(100, 'DW11', 12),
(100, 'FD21', 12),
(100, 'KL62', 34),
(100, 'KT03', 23),
(100, 'KV29', 25),
(200, 'AT94', 43),
(200, 'BV06', 34),
(200, 'CD52', 11),
(200, 'DL71', 41),
(200, 'DR93', 21),
(300, 'DW11', 42),
(300, 'FD21', 52),
(300, 'KL62', 14),
(300, 'KT03', 53),
(300, 'KV29', 35);

INSERT INTO rp_customers VALUES
(DEFAULT,'Al''s Appliance and Sport','2837 Greenway','Detroit','MI','48244',6550.00,7500.00,20),
(DEFAULT,'Brookings Direct','3827 Devon','Toronto','ON','M5V7F5',431.50,10000.00,35),
(DEFAULT,'Ferguson''s','382 Wildwood','Northfield','MI','33146',5785.00,7500.00,20),
(DEFAULT,'The Everything Shop','1828 Raven','Crystal','IL','60082',5285.25,5000.00,65),
(DEFAULT,'Bargains Galore','3829 Central','Toronto','ON','M5V9G4',3412.00,10000.00,35),
(DEFAULT,'Kline''s','838 Ridgeland','Lakeside','IL','60091',12762.00,15000.00,65),
(DEFAULT,'Johnson''s Department Store','372 Oxford','Toronto','ON','M5V9S4',2106.00,10000.00,35),
(DEFAULT,'Lee''s Sport and Appliance','282 Evergreen','Troy','MI','48283',2851.00,5000.00,20),
(DEFAULT,'Deerfield''s Four Seasons','282 Columbia','Toronto','ON','M5V9J5',248.00,7500.00,35),
(DEFAULT,'All Season','28 Lakeview','Grove City','IL','60081',8221.00,7500.00,65);

INSERT INTO rp_orders VALUES
(NEXT VALUE FOR order_id_seq,'2021-01-20',148),
(NEXT VALUE FOR order_id_seq,'2021-02-20',356),
(NEXT VALUE FOR order_id_seq,'2021-02-21',408),
(NEXT VALUE FOR order_id_seq,'2021-03-21',282),
(NEXT VALUE FOR order_id_seq,'2021-03-22',608),
(NEXT VALUE FOR order_id_seq,'2021-04-23',148),
(NEXT VALUE FOR order_id_seq,'2021-04-23',608);

INSERT INTO rp_order_lines VALUES
(PREVIOUS VALUE FOR order_id_seq,'AT94',11,21.95),
(PREVIOUS VALUE FOR order_id_seq,'DR93',1,495.00),
(PREVIOUS VALUE FOR order_id_seq,'DW11',1,399.99),
(PREVIOUS VALUE FOR order_id_seq,'KL62',4,329.95),
(PREVIOUS VALUE FOR order_id_seq,'KT03',2,595.00),
(PREVIOUS VALUE FOR order_id_seq,'BV06',2,794.95),
(PREVIOUS VALUE FOR order_id_seq,'CD52',4,150.00),
(PREVIOUS VALUE FOR order_id_seq,'DR93',1,495.00),
(PREVIOUS VALUE FOR order_id_seq,'KV29',2,1290.00);



INSERT INTO rp_products VALUES
('AT94','Iron','HW',24.95),
('BV06','Home Gym','SG',794.95),
('CD52','Microwave Oven','AP',165.00),
('DL71','Cordless Drill','HW',129.95),
('DR93','Gas Range','AP',495.00),
('DW11','Washer','AP',399.99),
('FD21','Stand Mixer','HW',159.95),
('KL62','Dryer','AP',349.95),
('KT03','Dishwasher','AP',595.00),
('KV29','Treadmill','SG',1390.00);
