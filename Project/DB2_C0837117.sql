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
DROP TABLE COLOR;
DROP TABLE WAREHOUSE;
DROP TABLE PRODUCT_COLOR;
DROP TABLE PRODUCT_WAREHOUSE;
DROP TABLE PRODUCT_ORDER;



-- DDL Statements ---------------

CREATE TABLE PRODUCTS(
	product_id INTEGER,
	product_name VARCHAR(30),
	brand_id INTEGER,
	model_id INTEGER
);

CREATE TABLE CUSTOMERS(
	customer_id INTEGER,
	name VARCHAR(30),
	joining_date DATE,
	email VARCHAR(50),
	mobile_number VARCHAR(10),
	address VARCHAR(150)
);

CREATE TABLE MODELS(
	model_id INTEGER,
	model_name VARCHAR(30),
	dimension VARCHAR(50),
	warranty INTEGER
);

CREATE TABLE ASSOCIATES(
	associate_id INTEGER,
	name VARCHAR(30),
	joining_date DATE,
	email VARCHAR(50),
	mobile_number VARCHAR(10)
);

CREATE TABLE ORDERS(
	order_id INTEGER,
	order_date DATE,
	total_price DECIMAL(5,2),
	associate_id INTEGER,
	customer_id INTEGER
);

CREATE TABLE BRANDS(
	brand_id INTEGER,
	brand_name VARCHAR(30)
);

CREATE TABLE COLORS(
	color_id INTEGER,
	color_name VARCHAR(30)
);

CREATE TABLE WAREHOUSE(
	warehouse_id INTEGER,
	address VARCHAR(150)
);

CREATE TABLE PRODUCT_COLOR(
	product_id INTEGER,
	color_id INTEGER
);

CREATE TABLE PRODUCT_WAREHOUSE(
	product_id INTEGER,
	warehouse_id INTEGER,
	quantity INTEGER
);

CREATE TABLE PRODUCT_ORDER(
	product_id INTEGER,
	order_id INTEGER,
	unit_price DECIMAL(5,2),
	quantity INTEGER
);

-- DML Statements ---------------

INSERT INTO BRANDS VALUES
(100, 'Craftsman'),
(101, 'Solude'),
(102, 'Dewalt');

INSERT INTO MODELS VALUES
(1000, 'AP34', '40.9 x 33 x 8.9 cm', 2),
(1001, 'RX7T', '38.5 x 31 x 8.0 cm', 1),
(1002, 'ZT42', '41.9 x 32 x 8.3 cm', 2),
(1003, 'SL39', '43.4 x 33 x 7.5 cm', NULL),
(1004, 'XP53', '39.7 x 29 x 7.6 cm', 3),
(1005, 'HZ12', '42.3 x 35 x 9.1 cm', NULL);

INSERT INTO COLORS VALUES
(10000, 'Black'),
(10001, 'Red'),
(10002, 'Yellow'),
(10003, 'Orange'),
(10004, 'Green');

INSERT INTO PRODUCTS VALUES
(10, 'Black Decker', 100, 1000),
(11, 'Solitude', 100, 1001),
(12, 'Zappers', 102, 1002),
(13, 'Solid Plus', 100, 1000),
(14, 'Black Mamba', 101, 1002),
(15, 'Dragon Claw', 101, 1004),
(16, 'Shark', 100, 1004),
(17, 'Tornado', 102, 1003),
(18, 'Hurricane', 101, 1001),
(19, 'Crimson', 102, 1003);

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
(500, 'John Sanders', '10-11-2021', 'johnsanders@gmail.com', '4373232123', '43 Eglington, M1L4V5, ON'),
(501, 'Bruce Wayne', '15-08-2021', 'brucewayne@gmail.com', '4374563435', '72 Birchmount, M3T8R7, BC'),
(502, 'Clark Kent', '17-02-2021', 'clarkkent@gmail.com', '4378696745', '125 Silvio, K1J7F9, PI'),
(503, 'Tony Stark', '23-04-2021', 'tonystark@gmail.com', '4375674563', '64 Patterson, M1H2I8, IL'),
(504, 'Roger Ends', '09-10-2021', 'rogerends@gmail.com', '4374563244', '89 Thyras, L1L9U8, ON');

INSERT INTO ASSOCIATES VALUES
(600, 'Roy Keane', '01-02-2021', 'roykeane@gmail.com', '4376785675'),
(601, 'Alex Farguson', '02-08-2021', 'alex@gmail.com', '4367845633'),
(602, 'Marcus Rashford', '07-03-2021', 'marcus@gmail.com', '4376788567');
	
INSERT INTO ORDERS VALUES
(700, '23-05-2021', 127.98, 600, 503),
(701, '19-06-2021', 248.99, 601, 500),
(702, '26-06-2021', 159.98, 600, 501),
(703, '30-06-2021', 177.98, 602, 503),
(704, '23-07-2021', 178.25, 601, 502),
(705, '29-07-2021', 203.95, 600, 504),
(706, '11-08-2021', 305.93, 600, 502),
(707, '19-08-2021', 149.99, 602, 501),
(708, '04-09-2021', 137.93, 602, 504),
(709, '13-10-2021', 219.75, 601, 500);

INSERT INTO PRODUCT_ORDER VALUES
(12, 700, 35.98, 1),
(13, 700, 37.99, 2),
(17, 701, 81.99, 1),
(14, 701, 73.99, 2),
(10, 702, 67.99, 1),
(11, 702, 58.99, 1),
(16, 703, 69.99, 1),
(19, 703, 43.99, 1),
(18, 703, 32.99, 1),
(14, 704, 43.99, 2),
(13, 704, 37.99, 1),
(11, 705, 58.99, 1),
(10, 705, 67.99, 2),
(16, 706, 69.99, 2),
(15, 706, 61.99, 1),
(19, 706, 43.99, 2),
(13, 707, 37.99, 2),
(12, 707, 35.98, 2),
(10, 708, 67.99, 1),
(11, 708, 58.99, 1),
(12, 709, 35.98, 3),
(18, 709, 32.99, 2);

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


