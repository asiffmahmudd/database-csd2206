
DROP TABLE customers;
DROP TABLE orders;
DROP TABLE order_lines;
DROP TABLE products;
DROP SEQUENCE order_id_seq;


CREATE TABLE products (
  product_code      VARCHAR(5),   
  description       VARCHAR(100),
  quantity_on_hand  DECIMAL(5),
  unit_price        DECIMAL(7,2) );

INSERT INTO products VALUES
('W9023', 'High Efficiency Top Load Washer', 45, 1149.95),
('C1369', 'Portable Air Conditioner',        27,  389.95),
('D9519', 'Built-In Dishwasher',             27,  389.95),
('B9358', 'Blender',                         53,  109.95),
('C7358', '10-piece Cookware Set',           42,  899.95);


CREATE TABLE customers (
  customer_id    INTEGER
    GENERATED ALWAYS AS IDENTITY
    (START WITH 5000 INCREMENT BY 10),
  customer_name  VARCHAR(30),
  credit_limit   DECIMAL(7),
  balance        DECIMAL(9,2),
  discount       DECIMAL(3,3) );

INSERT INTO customers VALUES
  (DEFAULT, 'Everything Electronics', 380000,  24500.75, .120 ),
  (DEFAULT, 'Worldwide Digital Inc.', 600000, 275600.85, .105 ),
  (DEFAULT, 'Best Digital Products',  425000, 128600.50, .020 ),
  (DEFAULT, 'Worldwide Digital Inc.', 350000, 185750.75, .010 ),
  (DEFAULT, 'Big Box Digital',        545000, 342400.20, .125 );

SELECT * FROM customers;
-- CUSTOMER_ID CUSTOMER_NAME          CREDIT_LIMIT BALANCE   DISCOUNT
-- ----------- ---------------------- ------------ --------- --------
--        5000 Everything Electronics       380000  24500.75    0.120
--        5010 Worldwide Digital Inc.       600000 275600.85    0.105
--        5020 Best Digital Products        425000 128600.50    0.020
--        5030 Worldwide Digital Inc.       350000 185750.75    0.010
--        5040 Big Box Digital              545000 342400.20    0.125


--------------------------- ORDERS -------------------------------
CREATE TABLE orders (
  order_id     INTEGER,
  customer_id  INTEGER,
  order_date   DATE );


------------------------------------ CREATE SEQUENCE ------------------
CREATE OR REPLACE SEQUENCE order_id_seq
  START WITH 10001
  INCREMENT BY 1
  NO MAXVALUE
  NO CACHE
  NO CYCLE;

 
-- Display information about sequences in your schema
SELECT SEQUENCE_SCHEMA,
       SEQUENCE_NAME,
       START_VALUE,
       INCREMENT,
       MINIMUM_VALUE,
       MAXIMUM_VALUE,
       CYCLE_OPTION,
       DATA_TYPE
FROM   QSYS2.SEQUENCES
WHERE  SEQUENCE_SCHEMA = 'IBM7009';

-- Retrieve next value for sequence ORDER_ID_SQL
-- SELECT NEXT VALUE FOR ORDER_ID_SEQ AS "Next"
-- FROM SYSIBM.SYSDUMMY1;

-- Retrieve previous value for sequence ORDER_ID_SQL
-- SELECT PREVIOUS VALUE FOR ORDER_ID_SEQ AS "Previous"
-- FROM SYSIBM.SYSDUMMY1

VALUES NEXT VALUE FOR ORDER_ID_SEQ;
VALUES NEXTVAL FOR ORDER_ID_SEQ;


--------------------------------- ORDER_LINES -------------------
CREATE TABLE order_lines (
  order_id         INTEGER,
  product_code     VARCHAR(5),
  quantity         DECIMAL(5),
  purchase_price   DECIMAL(7,2) );

-- Order 1 --------------------------------------------------------------
INSERT INTO orders                                               -- NEXT VALUE and PREVIOUS VALUE must be during the same session
  VALUES (NEXT VALUE FOR order_id_seq, 5000, '2016-02-21' );

SELECT * FROM orders;

INSERT INTO order_lines
  VALUES (PREVIOUS VALUE FOR order_id_seq, 'W9023', 1, 1099.95);
INSERT INTO order_lines
  VALUES (PREVIOUS VALUE FOR order_id_seq, 'D9519', 14, 389.95);

SELECT * FROM orders;
SELECT * FROM order_lines;
 
-- Order 2 --------------------------------------------------------------

INSERT INTO orders
  VALUES (NEXTVAL FOR order_id_seq, 5010, '2016-09-29' );

INSERT INTO order_lines VALUES
  (PREVIOUS VALUE FOR order_id_seq, 'C1369', 32,  24.95),
  (PREVIOUS VALUE FOR order_id_seq, 'C7358', 29, 119.95),
  (PREVIOUS VALUE FOR order_id_seq, 'D9519', 16, 695.95),
  (PREVIOUS VALUE FOR order_id_seq, 'W9023', 28,  45.95);

SELECT * FROM orders;
SELECT * FROM order_lines;


--========================================================================
--------------------------- ORDERS -------------------------------
DROP TABLE orders2;
CREATE TABLE orders2 (
  order_id     INTEGER
  GENERATED ALWAYS AS IDENTITY
    (START WITH 10001 INCREMENT BY 1),
  customer_id  INTEGER,
  order_date   DATE );

--------------------------------- ORDER_LINES -------------------
DROP TABLE order_lines2;
CREATE TABLE order_lines2 (
  order_id         INTEGER,
  product_code     VARCHAR(5),
  quantity         DECIMAL(5),
  purchase_price   DECIMAL(7,2) );

-- Order 1 --------------------------------------------------------------
-- IDENTITY clause and IDENTITY_VAL_LOCAL() must be used during the same session
 
INSERT INTO orders2
  VALUES (DEFAULT, 5000, '2016-02-21' );

SELECT * FROM orders2;

INSERT INTO order_lines2
  VALUES (IDENTITY_VAL_LOCAL(), 'W9023', 1, 1099.95);

INSERT INTO order_lines2
  VALUES (IDENTITY_VAL_LOCAL(), 'D9519', 14, 389.95);

SELECT * FROM orders2;
SELECT * FROM order_lines2;


  
