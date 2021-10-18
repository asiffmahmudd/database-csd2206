-- NAME: Asif Mahmud --
-- ID: C0837117 --
-- PROJECT: Drills --
-- TERM: Fall 21 --
-- Faculty: Jim Cooper --


-- Drop Tables ---------------

DROP TABLE PRODUCTS;
DROP TABLE CUSTOMERS;
DROP TABLE MODELS;
DROP TABLE ASSOCIATES;
DROP TABLE ORDERS;
DROP TABLE BRANDS;
DROP TABLE COLORS;
DROP TABLE WAREHOUSE;
DROP TABLE PRODUCT_COLOR;
DROP TABLE PRODUCT_WAREHOUSE;
DROP TABLE PRODUCT_ORDER;



-- DDL Statements ---------------

CREATE TABLE PRODUCTS(
  product_id INTEGER NOT NULL
    GENERATED ALWAYS AS IDENTITY
    (START WITH 10 INCREMENT BY 1),
  product_name VARCHAR(30) NOT NULL,
  brand_id INTEGER NOT NULL,
  model_id INTEGER NOT NULL
);

CREATE TABLE CUSTOMERS(
  customer_id INTEGER NOT NULL
    GENERATED ALWAYS AS IDENTITY
    (START WITH 500 INCREMENT BY 1),
  name VARCHAR(30) NOT NULL,
  joining_date DATE NOT NULL,
  email VARCHAR(50) NOT NULL,
  mobile_number VARCHAR(10) NOT NULL,
  address VARCHAR(150) NOT NULL
);

CREATE TABLE MODELS(
  model_id INTEGER NOT NULL
    GENERATED ALWAYS AS IDENTITY
    (START WITH 1000 INCREMENT BY 1),
  model_name VARCHAR(30) NOT NULL,
  dimension VARCHAR(50) NOT NULL,
  warranty INTEGER NOT NULL
);

CREATE TABLE ASSOCIATES(
  associate_id INTEGER NOT NULL,
  name VARCHAR(30) NOT NULL,
  joining_date DATE,
  email VARCHAR(50),
  mobile_number VARCHAR(10) NOT NULL
);

CREATE TABLE ORDERS(
  order_id INTEGER NOT NULL,
  order_date DATE NOT NULL,
  total_price DECIMAL(5,2) NOT NULL,
  associate_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL
);

CREATE TABLE BRANDS(
  brand_id INTEGER NOT NULL,
  brand_name VARCHAR(30) NOT NULL
);

CREATE TABLE COLORS(
  color_id INTEGER NOT NULL,
  color_name VARCHAR(30) NOT NULL
);

CREATE TABLE WAREHOUSE(
  warehouse_id INTEGER NOT NULL,
  address VARCHAR(150) NOT NULL
);

CREATE TABLE PRODUCT_COLOR(
  product_id INTEGER NOT NULL,
  color_id INTEGER NOT NULL
);

CREATE TABLE PRODUCT_WAREHOUSE(
  product_id INTEGER NOT NULL,
  warehouse_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL
);

CREATE TABLE PRODUCT_ORDER(
  product_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  unit_price DECIMAL(5,2) NOT NULL,
  quantity INTEGER NOT NULL
);

CREATE OR REPLACE SEQUENCE order_id_seq
  START WITH 700
  INCREMENT BY 1
  NO CACHE
  NO CYCLE;

-- DEFAULT statements --

ALTER TABLE CUSTOMERS
  ALTER COLUMN joining_date
  SET DEFAULT CURRENT_DATE;
  
ALTER TABLE ASSOCIATES
  ALTER COLUMN joining_date
  SET DEFAULT CURRENT_DATE;
  
ALTER TABLE ORDERS
  ALTER COLUMN order_date
  SET DEFAULT CURRENT_DATE;



-- Primary Key --

ALTER TABLE PRODUCTS
  ADD CONSTRAINT PRODUCTS_pk
    PRIMARY KEY ( product_id );
  
ALTER TABLE MODELS
  ADD CONSTRAINT MODELS_pk
    PRIMARY KEY ( model_id );
  
ALTER TABLE ORDERS
  ADD CONSTRAINT ORDERS_pk
    PRIMARY KEY ( order_id );
  
ALTER TABLE CUSTOMERS
  ADD CONSTRAINT CUSTOMERS_pk
    PRIMARY KEY ( customer_id );
  
ALTER TABLE WAREHOUSE
  ADD CONSTRAINT WAREHOUSE_pk
    PRIMARY KEY ( warehouse_id );
  
ALTER TABLE ASSOCIATES
  ADD CONSTRAINT ASSOCIATES_pk
    PRIMARY KEY ( associate_id );
  
ALTER TABLE PRODUCT_WAREHOUSE
  ADD CONSTRAINT PRODUCT_WAREHOUSE_pk
    PRIMARY KEY ( product_id, warehouse_id );
  
ALTER TABLE PRODUCT_ORDER
  ADD CONSTRAINT PRODUCT_ORDER_pk
    PRIMARY KEY ( product_id, order_id );
  
ALTER TABLE COLORS
  ADD CONSTRAINT COLOR_pk
    PRIMARY KEY ( color_id );
  
ALTER TABLE BRANDS
  ADD CONSTRAINT BRAND_pk
    PRIMARY KEY ( brand_id );
  
ALTER TABLE PRODUCT_COLOR
  ADD CONSTRAINT PRODUCT_COLOR_pk
    PRIMARY KEY ( product_id, color_id );



-- Foreign Key --

ALTER TABLE PRODUCTS
  ADD CONSTRAINT PRODUCTS_brand_id_fk
    FOREIGN KEY ( brand_id ) 
    REFERENCES BRANDS( brand_id );
  
  
ALTER TABLE PRODUCTS
  ADD CONSTRAINT PRODUCTS_model_id_fk
    FOREIGN KEY ( model_id ) 
    REFERENCES MODELS( model_id );
  
ALTER TABLE ORDERS
  ADD CONSTRAINT ORDERS_associate_id_fk
    FOREIGN KEY ( associate_id ) 
    REFERENCES ASSOCIATES( associate_id );

ALTER TABLE ORDERS
  ADD CONSTRAINT ORDERS_customer_id_fk
    FOREIGN KEY ( customer_id ) 
    REFERENCES CUSTOMERS( customer_id );

ALTER TABLE PRODUCT_WAREHOUSE
  ADD CONSTRAINT PRODUCT_WAREHOUSE_product_id_fk
    FOREIGN KEY ( product_id ) 
    REFERENCES PRODUCTS( product_id );
  
ALTER TABLE PRODUCT_WAREHOUSE
  ADD CONSTRAINT PRODUCT_WAREHOUSE_warehouse_id_fk
    FOREIGN KEY ( warehouse_id ) 
    REFERENCES WAREHOUSE( warehouse_id );

ALTER TABLE PRODUCT_ORDER
  ADD CONSTRAINT PRODUCT_ORDER_product_id_fk
    FOREIGN KEY ( product_id ) 
    REFERENCES PRODUCTS( product_id );

ALTER TABLE PRODUCT_ORDER
  ADD CONSTRAINT PRODUCT_ORDER_order_id_fk
    FOREIGN KEY ( order_id ) 
    REFERENCES ORDERS( order_id );

ALTER TABLE PRODUCT_COLOR
  ADD CONSTRAINT PRODUCT_COLOR_product_id_fk
    FOREIGN KEY ( product_id ) 
    REFERENCES PRODUCTS( product_id );

ALTER TABLE PRODUCT_COLOR
  ADD CONSTRAINT PRODUCT_COLOR_color_id_fk
    FOREIGN KEY ( color_id ) 
    REFERENCES COLORS( color_id );


-- Unique Key --

ALTER TABLE MODELS
  ADD CONSTRAINT MODELS_model_name_uk
  UNIQUE( model_name );
  
ALTER TABLE CUSTOMERS
  ADD CONSTRAINT CUSTOMERS_email_uk
  UNIQUE( email );

ALTER TABLE CUSTOMERS
  ADD CONSTRAINT CUSTOMERS_mobile_number_uk
  UNIQUE( mobile_number );

ALTER TABLE ASSOCIATES
  ADD CONSTRAINT ASSOCIATES_mobile_number_uk
  UNIQUE( mobile_number );

ALTER TABLE ASSOCIATES
  ADD CONSTRAINT ASSOCIATES_email_uk
  UNIQUE( email );

ALTER TABLE BRANDS
  ADD CONSTRAINT BRANS_brand_name_uk
  UNIQUE( brand_name );

ALTER TABLE COLORS
  ADD CONSTRAINT COLOR_color_name_uk
  UNIQUE( color_name );


-- Check Constraint --

ALTER TABLE MODELS
  ADD CONSTRAINT MODELS_warranty_ck
  CHECK ( warranty BETWEEN 0 AND 4 );

ALTER TABLE PRODUCTS
  ADD CONSTRAINT PRODUCTS_product_id_ck
  CHECK ( product_id BETWEEN 10 AND 199 );
  
ALTER TABLE ASSOCIATES
  ADD CONSTRAINT ASSOCIATES_joining_date_ck
  CHECK ( joining_date >= '2020-01-01' );
  
ALTER TABLE CUSTOMERS
  ADD CONSTRAINT CUSTOMERS_joining_date_ck
  CHECK ( joining_date >= '2020-01-01' );

-- DML Statements ---------------

INSERT INTO BRANDS VALUES
(100, 'Craftsman'),
(101, 'Solude'),
(102, 'Dewalt');

INSERT INTO MODELS VALUES
(DEFAULT, 'AP34', '40.9 x 33 x 8.9 cm', 2),
(DEFAULT, 'RX7T', '38.5 x 31 x 8.0 cm', 1),
(DEFAULT, 'ZT42', '41.9 x 32 x 8.3 cm', 2),
(DEFAULT, 'SL39', '43.4 x 33 x 7.5 cm', 0),
(DEFAULT, 'XP53', '39.7 x 29 x 7.6 cm', 3),
(DEFAULT, 'HZ12', '42.3 x 35 x 9.1 cm', 0);

INSERT INTO COLORS VALUES
(10000, 'Black'),
(10001, 'Red'),
(10002, 'Yellow'),
(10003, 'Orange'),
(10004, 'Green');

INSERT INTO PRODUCTS VALUES
(DEFAULT, 'Black Decker', 100, 1000),
(DEFAULT, 'Solitude', 100, 1001),
(DEFAULT, 'Zappers', 102, 1002),
(DEFAULT, 'Solid Plus', 100, 1000),
(DEFAULT, 'Black Mamba', 101, 1002),
(DEFAULT, 'Dragon Claw', 101, 1004),
(DEFAULT, 'Shark', 100, 1004),
(DEFAULT, 'Tornado', 102, 1003),
(DEFAULT, 'Hurricane', 101, 1001),
(DEFAULT, 'Crimson', 102, 1003);

INSERT INTO PRODUCT_COLOR VALUES
(10, 10000),
(10, 10002),
(11, 10000),
(11, 10001),
(12, 10000),
(12, 10004),
(13, 10000),
(13, 10004),
(14, 10000),
(14, 10003),
(15, 10000),
(15, 10001),
(16, 10000),
(16, 10002),
(17, 10000),
(17, 10001),
(18, 10000),
(18, 10001),
(19, 10000),
(19, 10003);

INSERT INTO CUSTOMERS VALUES
(DEFAULT, 'John Sanders', '2021-01-23', 'johnsanders@gmail.com', '4373232123', '43 Eglington, M1L4V5, ON'),
(DEFAULT, 'Bruce Wayne', '2021-03-19', 'brucewayne@gmail.com', '4374563435', '72 Birchmount, M3T8R7, BC'),
(DEFAULT, 'Clark Kent', '2021-05-04', 'clarkkent@gmail.com', '4378696745', '125 Silvio, K1J7F9, PI'),
(DEFAULT, 'Tony Stark', '2021-10-17', 'tonystark@gmail.com', '4375674563', '64 Patterson, M1H2I8, IL'),
(DEFAULT, 'Roger Ends', '2021-11-08', 'rogerends@gmail.com', '4374563244', '89 Thyras, L1L9U8, ON');

INSERT INTO ASSOCIATES VALUES
(600, 'Roy Keane', '2021-02-01', 'roykeane@gmail.com', '4376785675'),
(601, 'Alex Farguson', '2021-03-08', 'alex@gmail.com', '4367845633'),
(602, 'Marcus Rashford', '2021-03-09', 'marcus@gmail.com', '4376788567');
  

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-10-19', 127.98, 600, 503);
INSERT INTO PRODUCT_ORDER VALUES
(12, PREVIOUS VALUE FOR order_id_seq, 35.98, 1),
(13, PREVIOUS VALUE FOR order_id_seq, 37.99, 2);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-01-27', 248.99, 601, 500);
INSERT INTO PRODUCT_ORDER VALUES
(17, PREVIOUS VALUE FOR order_id_seq, 81.99, 1),
(14, PREVIOUS VALUE FOR order_id_seq, 73.99, 2);


INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-03-23', 159.98, 600, 501);
INSERT INTO PRODUCT_ORDER VALUES
(10, PREVIOUS VALUE FOR order_id_seq, 67.99, 1),
(11, PREVIOUS VALUE FOR order_id_seq, 58.99, 1);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-11-23', 177.98, 602, 503);
INSERT INTO PRODUCT_ORDER VALUES
(16, PREVIOUS VALUE FOR order_id_seq, 69.99, 1),
(19, PREVIOUS VALUE FOR order_id_seq, 43.99, 1),
(18, PREVIOUS VALUE FOR order_id_seq, 32.99, 1);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-04-07', 178.25, 601, 502);
INSERT INTO PRODUCT_ORDER VALUES
(14, PREVIOUS VALUE FOR order_id_seq, 43.99, 2),
(13, PREVIOUS VALUE FOR order_id_seq, 37.99, 1);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-11-14', 203.95, 600, 504);
INSERT INTO PRODUCT_ORDER VALUES
(11, PREVIOUS VALUE FOR order_id_seq, 58.99, 1),
(10, PREVIOUS VALUE FOR order_id_seq, 67.99, 2);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-05-12', 305.93, 600, 502);
INSERT INTO PRODUCT_ORDER VALUES
(16, PREVIOUS VALUE FOR order_id_seq, 69.99, 2),
(15, PREVIOUS VALUE FOR order_id_seq, 61.99, 1),
(19, PREVIOUS VALUE FOR order_id_seq, 43.99, 2);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-04-07', 149.99, 602, 501);
INSERT INTO PRODUCT_ORDER VALUES
(13, PREVIOUS VALUE FOR order_id_seq, 37.99, 2),
(12, PREVIOUS VALUE FOR order_id_seq, 35.98, 2);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-11-29', 137.93, 602, 504);
INSERT INTO PRODUCT_ORDER VALUES
(10, PREVIOUS VALUE FOR order_id_seq, 67.99, 1),
(11, PREVIOUS VALUE FOR order_id_seq, 58.99, 1);

INSERT INTO ORDERS VALUES (NEXT VALUE FOR order_id_seq, '2021-03-22', 219.75, 601, 500);
INSERT INTO PRODUCT_ORDER VALUES
(12, PREVIOUS VALUE FOR order_id_seq, 35.98, 3),
(18, PREVIOUS VALUE FOR order_id_seq, 32.99, 2);




INSERT INTO WAREHOUSE VALUES
(201, '83 Rene Street, Toronto, ON'),
(202, '127 Salmon Street, Victoria, BC');

INSERT INTO PRODUCT_WAREHOUSE VALUES
(10, 201, 100),
(10, 202, 20),
(11, 201, 0),
(11, 202, 150),
(12, 201, 80),
(12, 202, 10),
(13, 201, 20),
(13, 202, 114),
(14, 201, 0),
(14, 202, 170),
(15, 201, 83),
(15, 202, 0),
(16, 201, 87),
(16, 202, 12),
(17, 201, 32),
(17, 202, 0),
(18, 201, 42),
(18, 202, 56),
(19, 201, 78),
(19, 202, 94);




-- Testing --


-- Constraing NOT NULL test --
INSERT INTO PRODUCTS VALUES
(DEFAULT, NULL, 100, 1000);
-- Trying to insert a null value in PRODUCTS table. This returns an error becaust product_name is null --


-- DEFAULT value test --
INSERT INTO ORDERS VALUES 
(NEXT VALUE FOR order_id_seq, DEFAULT, 137.93, 602, 504);
-- This inserts the data with a default Date value which is set to current date


--Primary Key test --
INSERT INTO COLORS VALUES
(10000, 'Purple');
-- This returns error because there's already a color with the id 10000. This returns a duplicate key error --


--Primary Key test --
INSERT INTO WAREHOUSE VALUES
(201, '83 Rene Street, Toronto, ON');
-- This returns error because there's already a warehouse with the id 201. This returns a duplicate key error --


-- Unique Key test --
INSERT INTO MODELS VALUES
(DEFAULT, 'AP34', '40.9 x 33 x 8.9 cm', 2);
-- This returns error because model_name attribute is unique and ther's already a model named 'AP34' --


--Constraint testing --

INSERT INTO PRODUCTS VALUES
(9, 'Silver Eagle', 100, 1000);
-- It returns error because product_id is cannot be specified and also out of range 10-199 --

INSERT INTO MODELS VALUES
(DEFAULT, 'ZX938', '40.9 x 33 x 8.9 cm', 5);
-- It returns error because warranty is not between 0-4 --

INSERT INTO ASSOCIATES VALUES
(606, 'Roy Keane', '2019-11-11', 'keaneroy@gmail.com', '678645342');
-- It returns error because joining_date is before 2020-01-01 --

INSERT INTO CUSTOMERS VALUES
(DEFAULT, 'John Sanders', '2018-01-01', 'sanderjohn@gmail.com', '456345773', '43 Eglington, M1L4V5, ON')
-- It returns error because joining_date is before 2020-01-01 --

-- The valid dataset is applied above with the insert statements --

