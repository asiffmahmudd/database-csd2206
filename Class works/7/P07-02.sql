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
  warehouse_id int NOT NULL,
  product_code varchar(20) NOT NULL,
  qoh int NOT NULL
);

CREATE TABLE RP_WAREHOUSE(
  warehouse_id int NOT NULL,
  city varchar(20) NOT NULL
);

CREATE TABLE RP_CUSTOMERS(
  customer_id int NOT NULL,
  customer_name varchar(30) NOT NULL,
  street varchar(100) NOT NULL,
  city varchar(20) NOT NULL,
  cust_state varchar(20) NOT NULL,
  zip varchar(20) NOT NULL,
  balance decimal(7,2) NOT NULL,
  credit_limit decimal(7,2) DEFAULT 5000.00,
  rep_id int NOT NULL
);

CREATE TABLE RP_REPS(
  rep_id int NOT NULL,
  last_name varchar(30) NOT NULL,
  first_name varchar(20) NOT NULL,
  street varchar(100) NOT NULL,
  city varchar(20) NOT NULL,
  rep_state varchar(20) NOT NULL,
  zip varchar(20) NOT NULL,
  commission decimal(7,2) NOT NULL,
  rate decimal(3,2) DEFAULT 0.04
);

CREATE TABLE RP_ORDER_LINES(
  order_id int NOT NULL,
  product_code varchar(20) NOT NULL,
  num_ordered int NOT NULL,
  quoted_price decimal(6,2) NOT NULL
);

CREATE TABLE RP_ORDERS(
  order_id int NOT NULL,
  order_date date NOT NULL,
  customer_id int NOT NULL
);

CREATE TABLE RP_PRODUCTS(
  product_code varchar(20) NOT NULL,
  description varchar(100),
  product_class varchar(20) NOT NULL,
  price decimal(6,2) NOT NULL
);



ALTER TABLE RP_PRODUCTS
  ADD CONSTRAINT RP_PRODUCTS_pk
    PRIMARY KEY ( product_code );
  
ALTER TABLE RP_WAREHOUSE
  ADD CONSTRAINT RP_WAREHOUSE_pk
    PRIMARY KEY ( warehouse_id );

ALTER TABLE RP_INVENTORY
  ADD CONSTRAINT RP_INVENTORY_pk
    PRIMARY KEY ( warehouse_id, product_code );
  
ALTER TABLE RP_CUSTOMERS
  ADD CONSTRAINT RP_CUSTOMERS_pk
    PRIMARY KEY ( customer_id );
  
ALTER TABLE RP_ORDERS
  ADD CONSTRAINT RP_ORDERS_pk
    PRIMARY KEY ( order_id );
  
ALTER TABLE RP_REPS
  ADD CONSTRAINT RP_REPS_pk
    PRIMARY KEY ( rep_id );
  
ALTER TABLE RP_ORDER_LINES
  ADD CONSTRAINT RP_ORDER_LINES_pk
    PRIMARY KEY ( order_id, product_code );



ALTER TABLE RP_INVENTORY
  ADD CONSTRAINT RP_INVENTORY_warehouse_id_fk
    FOREIGN KEY ( warehouse_id ) 
    REFERENCES RP_WAREHOUSE( warehouse_id );

ALTER TABLE RP_INVENTORY
  ADD CONSTRAINT RP_INVENTORY_product_code_fk
    FOREIGN KEY ( product_code ) 
    REFERENCES RP_PRODUCTS( product_code );

ALTER TABLE RP_CUSTOMERS
  ADD CONSTRAINT RP_CUSTOMERS_rep_id_fk
    FOREIGN KEY ( rep_id ) 
    REFERENCES RP_REPS( rep_id );
  
ALTER TABLE RP_ORDER_LINES
  ADD CONSTRAINT RP_ORDER_LINES_product_code_fk
    FOREIGN KEY ( product_code ) 
    REFERENCES RP_PRODUCTS( product_code );
  
ALTER TABLE RP_ORDER_LINES
  ADD CONSTRAINT RP_ORDER_LINES_order_id_fk
    FOREIGN KEY ( order_id ) 
    REFERENCES RP_ORDERS( order_id );
  
ALTER TABLE RP_ORDERS
  ADD CONSTRAINT RP_ORDERS_customer_id_fk
    FOREIGN KEY ( customer_id ) 
    REFERENCES RP_CUSTOMERS( customer_id );
  


ALTER TABLE RP_PRODUCTS
  ADD CONSTRAINT RP_PRODUCTS_description_uk
   UNIQUE( description );



ALTER TABLE RP_CUSTOMERS
  ADD CONSTRAINT RP_CUSTOMERS_cust_state_ck
  CHECK ( cust_state IN ( 'MI', 'IL', 'ON') );

ALTER TABLE RP_REPS
  ADD CONSTRAINT RP_REPS_rate_ck
  CHECK ( rate BETWEEN 0.03 AND 0.07 );
  
ALTER TABLE RP_CUSTOMERS
  ADD CONSTRAINT RP_CUSTOMERS_credit_limit_ck
  CHECK ( credit_limit <= 18000 );
  
ALTER TABLE RP_CUSTOMERS
  ADD CONSTRAINT RP_CUSTOMERS_credit_limit_balance_ck
  CHECK ( balance < credit_limit );
  
ALTER TABLE RP_ORDERS
  ADD CONSTRAINT RP_ORDERS_order_date_ck
  CHECK ( order_date > '2021-01-01' );
  
ALTER TABLE RP_INVENTORY
  ADD CONSTRAINT RP_INVENTORY_qoh_ck
  CHECK ( qoh BETWEEN 0 AND 150 );

ALTER TABLE RP_PRODUCTS
  ADD CONSTRAINT RP_PRODUCTS_product_class_ck
  CHECK ( product_class IN ( 'HW', 'SG', 'AP') );
  
ALTER TABLE RP_PRODUCTS
  ADD CONSTRAINT RP_PRODUCTS_product_price_ck
  CHECK ( price BETWEEN 20.00 AND 2000.00 );
  

 

-- DML Statements ---------------

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


INSERT INTO RP_WAREHOUSE 
VALUES (100, 'Chicago');

INSERT INTO RP_WAREHOUSE 
VALUES (200, 'Detroit');

INSERT INTO RP_WAREHOUSE 
VALUES (300, 'Toronto');

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

INSERT INTO rp_reps (rep_id, last_name, first_name, street, city, rep_state, zip, commission, rate)
VALUES (20, 'Culp', 'Betty', '1275 Main St', 'Detroit', 'MI', '48288', 20542.50, 0.05);

INSERT INTO rp_reps (rep_id, last_name, first_name, street, city, rep_state, zip, commission, rate)
VALUES (35, 'Manis', 'Richard', '1532 Jackson', 'Toronto', 'ON', 'M5V2K1', 39216.00, 0.07);

INSERT INTO rp_reps (rep_id, last_name, first_name, street, city, rep_state, zip, commission, rate)
VALUES (65, 'Large', 'Tom', '1626 Taylor', 'Chicago', 'IL', '60099', 23487.00, 0.05);


INSERT INTO rp_customers VALUES
(148,'Al''s Appliance and Sport','2837 Greenway','Detroit','MI','48244',6550.00,7500.00,20),
(282,'Brookings Direct','3827 Devon','Toronto','ON','M5V7F5',431.50,10000.00,35),
(356,'Ferguson''s','382 Wildwood','Northfield','MI','33146',5785.00,7500.00,20),
(408,'The Everything Shop','1828 Raven','Crystal','IL','60082',4285.25,5000.00,65),
(462,'Bargains Galore','3829 Central','Toronto','ON','M5V9G4',3412.00,10000.00,35),
(524,'Kline''s','838 Ridgeland','Lakeside','IL','60091',12762.00,15000.00,65),
(608,'Johnson''s Department Store','372 Oxford','Toronto','ON','M5V9S4',2106.00,10000.00,35),
(687,'Lee''s Sport and Appliance','282 Evergreen','Troy','MI','48283',2851.00,5000.00,20),
(725,'Deerfield''s Four Seasons','282 Columbia','Toronto','ON','M5V9J5',248.00,7500.00,35),
(842,'All Season','28 Lakeview','Grove City','IL','60081',7221.00,7500.00,65);

INSERT INTO rp_orders VALUES
(21608,'2021-01-20',148),
(21610,'2021-02-20',356),
(21613,'2021-02-21',408),
(21614,'2021-03-21',282),
(21617,'2021-03-22',608),
(21619,'2021-04-23',148),
(21623,'2021-04-23',608);


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



-- TESTING --------------------------

-- DEFAULT testing --
INSERT INTO rp_customers VALUES
(001,'Dollarama','1992 Eglington','Scarborough','ON','23412',2120.00,DEFAULT,35);

INSERT INTO rp_reps VALUES 
(10, 'Bruce', 'Wayne', 'This street', 'Michigun', 'IL', '98763', 7200.00, DEFAULT);


-- Check Constraints ---

INSERT INTO rp_customers VALUES
(002,'Collarama','1994 Eglington','Scarborough','PI','23412',9120.00,DEFAULT,35);     -- Error, 'PI' can't be added

INSERT INTO rp_reps VALUES 
(11, 'Bruce', 'Wayne', 'This street', 'Michigun', 'IL', '98763', DEFAULT, 0.02);      -- Error, 0.02 is not in the range of 3% to 7%

INSERT INTO rp_customers VALUES
(003,'Pollarama','1921 Eglington','Scarborough','ON','23412',8190.00,18500.00,35);      -- Error, credit_limit exceeds 18000

INSERT INTO rp_customers VALUES
(004,'Tollarama','1923 Eglington','Scarborough','ON','23412',10500.00,DEFAULT,35);      -- Error, balance exceeds credit_limit

INSERT INTO rp_orders VALUES                                -- Error, date is before 01-01-2021
(21609,'2020-01-20',148);

INSERT INTO rp_inventory VALUES                               -- Error, qoh exceeds 150
(100, 'AT94', 160);

INSERT INTO rp_products VALUES
('AT94','Iron','RP',24.95)                                  -- ERROR, product_class not in the required value

INSERT INTO rp_products VALUES
('AT94','Iron','RP',10.95)                                  -- ERROR, price not in the range 