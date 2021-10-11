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
	model_id INTEGER,
	color_id INTEGER
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
	reg_price DECIMAL(5,2),
	sale_price DECIMAL(5,2),
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
	delivery_method VARCHAR(30),
	delivery_addres VARCHAR(150),
	associate_id INTEGER,
	customer_id INTEGER
);

CREATE TABLE BRANDS(
	brand_id INTEGER,
	brand_name VARCHAR(30)
);

CREATE TABLE COLOR(
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
	warehouse_id INTEGER
);

CREATE TABLE PRODUCT_ORDER(
	product_id INTEGER,
	order_id INTEGER
);

-- DML Statements ---------------