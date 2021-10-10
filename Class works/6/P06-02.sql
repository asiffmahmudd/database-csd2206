-- Drop Tables ---------------

DROP TABLE RP_INVENTORY;
DROP TABLE RP_WAREHOUSE;
DROP TABLE RP_CUSTOMERS;
DROP TABLE RP_REPS;
DROP TABLE RP_ORDER_LINES;
DROP TABLE RP_ORDERS;
DROP TABLE RP_PRODUCTS;


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
	customer_id int,
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
	rep_id int,
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
(148,'Al''s Appliance and Sport','2837 Greenway','Detroit','MI','48244',6550.00,7500.00,20),
(282,'Brookings Direct','3827 Devon','Toronto','ON','M5V7F5',431.50,10000.00,35),
(356,'Ferguson''s','382 Wildwood','Northfield','MI','33146',5785.00,7500.00,20),
(408,'The Everything Shop','1828 Raven','Crystal','IL','60082',5285.25,5000.00,65),
(462,'Bargains Galore','3829 Central','Toronto','ON','M5V9G4',3412.00,10000.00,35),
(524,'Kline''s','838 Ridgeland','Lakeside','IL','60091',12762.00,15000.00,65),
(608,'Johnson''s Department Store','372 Oxford','Toronto','ON','M5V9S4',2106.00,10000.00,35),
(687,'Lee''s Sport and Appliance','282 Evergreen','Troy','MI','48283',2851.00,5000.00,20),
(725,'Deerfield''s Four Seasons','282 Columbia','Toronto','ON','M5V9J5',248.00,7500.00,35),
(842,'All Season','28 Lakeview','Grove City','IL','60081',8221.00,7500.00,65);

INSERT INTO rp_order_lines VALUES
(21608,'AT94',11,21.95),
(21610,'DR93',1,495.00),
(21610,'DW11',1,399.99),
(21613,'KL62',4,329.95),
(21614,'KT03',2,595.00),
(21617,'BV06',2,794.95),
(21617,'CD52',4,150.00),
(21619,'DR93',1,495.00),
(21623,'KV29',2,1290.00);

INSERT INTO rp_orders VALUES
(21608,'2021-01-20',148),
(21610,'2021-02-20',356),
(21613,'2021-02-21',408),
(21614,'2021-03-21',282),
(21617,'2021-03-22',608),
(21619,'2021-04-23',148),
(21623,'2021-04-23',608);

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


INSERT INTO rp_reps (rep_id, last_name, first_name, street, city, rep_state, zip, commission, rate)
VALUES (20, 'Culp', 'Betty', '1275 Main St', 'Detroit', 'MI', '48288', 20542.50, 0.05);

INSERT INTO rp_reps (rep_id, last_name, first_name, street, city, rep_state, zip, commission, rate)
VALUES (35, 'Manis', 'Richard', '1532 Jackson', 'Toronto', 'ON', 'M5V2K1', 39216.00, 0.07);

INSERT INTO rp_reps (rep_id, last_name, first_name, street, city, rep_state, zip, commission, rate)
VALUES (65, 'Large', 'Tom', '1626 Taylor', 'Chicago', 'IL', '60099', 23487.00, 0.05);


INSERT INTO RP_WAREHOUSE 
VALUES (100, 'Chicago');

INSERT INTO RP_WAREHOUSE 
VALUES (200, 'Detroit');

INSERT INTO RP_WAREHOUSE 
VALUES (300, 'Toronto');



UPDATE RP_CUSTOMERS 
SET balance = 4285.25
WHERE customer_id = 408;

UPDATE RP_CUSTOMERS 
SET balance = 6221.00
WHERE customer_id = 842;

UPDATE RP_PRODUCTS
SET price = price + price*0.085
WHERE product_class = 'AP';

DELETE FROM RP_PRODUCTS
WHERE description = 'Cordless Drill';

UPDATE RP_CUSTOMERS
SET credit_limit = 14500
WHERE customer_name = 'Brookings Direct';
