/* 1 */
SELECT *
FROM B_CATEGORIES
ORDER BY CATEGORY_CODE;

/* 2 */
SELECT CUSTOMER_NAME, CREDIT_LIMIT, BALANCE 
FROM B_CUSTOMERS
ORDER BY CUSTOMER_NAME DESC;

/* 3 */
SELECT DESCRIPTION, PRICE 
FROM B_PRODUCTS
WHERE CATEGORY_CODE = 'SA'
ORDER BY PRICE DESC;

/* 4 */
SELECT DISTINCT CITY 
FROM B_CUSTOMERS
ORDER BY CITY;

/* 5 */
SELECT CUSTOMER_NAME, CREDIT_LIMIT, BALANCE 
FROM B_CUSTOMERS
WHERE CUSTOMER_ID = 130;

/* 6 */
SELECT CUSTOMER_NAME, CREDIT_LIMIT - BALANCE AS "Available credit"
FROM B_CUSTOMERS
WHERE CREDIT_LIMIT - BALANCE > 25000
ORDER BY "Available credit" DESC;

/* 7 */
SELECT PRODUCT_CODE, QOH 
FROM B_INVENTORY
WHERE QOH BETWEEN 12 AND 32
ORDER BY QOH DESC;

/* 8 */
SELECT CUSTOMER_NAME, STREET || ', ' || CUST_STATE AS ADDRESS
FROM B_CUSTOMERS
WHERE BALANCE BETWEEN 40000 AND 60000
ORDER BY CUSTOMER_NAME;

/* 9 */
SELECT ORDER_DATE, ORDER_ID 
FROM B_ORDERS
WHERE ORDER_DATE BETWEEN '2020-10-20' AND '2020-11-20'
ORDER BY ORDER_DATE, ORDER_ID DESC;

/* 10 */
SELECT CATEGORY_CODE, DESCRIPTION 
FROM B_PRODUCTS
WHERE CATEGORY_CODE IN ('SA', 'HW', 'LA')
ORDER BY CATEGORY_CODE;

/* 11 */
SELECT CATEGORY_CODE, DESCRIPTION 
FROM B_PRODUCTS
WHERE CATEGORY_CODE NOT IN ('SA', 'HW', 'LA')
ORDER BY CATEGORY_CODE;

/* 12 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE"
FROM B_SELLERS
WHERE SUPERVISOR_ID IS NULL 
ORDER BY LAST_NAME;

/* 13 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE"
FROM B_SELLERS
WHERE COMMISSION > 30000 AND SUPERVISOR_ID IS NOT NULL;

/* 14 */
SELECT CATEGORY_CODE, PRICE 
FROM B_PRODUCTS
WHERE DESCRIPTION = 'Coffee Maker';

/* 15 */
SELECT WAREHOUSE_ID, PRODUCT_CODE, QOH AS "ON_HAND"
FROM B_INVENTORY
WHERE QOH > 40
ORDER BY WAREHOUSE_ID;

/* 16 */
SELECT ORDER_ID, CUSTOMER_ID, SHIP_DATE
FROM B_ORDERS
WHERE SHIP_DATE < '2020-10-20'
ORDER BY ORDER_ID DESC;

/* 17 */
SELECT CUSTOMER_ID, CUSTOMER_NAME 
FROM B_CUSTOMERS
WHERE CUSTOMER_NAME LIKE 'B%'
ORDER BY CUSTOMER_NAME;

/* 18 */
SELECT DESCRIPTION 
FROM B_PRODUCTS
WHERE DESCRIPTION LIKE '%Range%'
ORDER BY DESCRIPTION;

/* 19 */
SELECT FIRST_NAME || ' ' || LAST_NAME 
FROM B_SELLERS
WHERE LAST_NAME LIKE '%s%' AND LAST_NAME LIKE '%i%'
ORDER BY LAST_NAME;

/* 20 */
SELECT CUSTOMER_NAME 
FROM B_CUSTOMERS
WHERE CUSTOMER_NAME LIKE '%B%i%g%' OR CUSTOMER_NAME LIKE '%B%g%i%';

/* 21 */
SELECT CUSTOMER_NAME, CITY 
FROM B_CUSTOMERS
WHERE CITY IN('Colorado Springs', 'Las Vegas', 'San Diego')
ORDER BY CITY;

/* 22 */
SELECT SELLER_ID, CUSTOMER_NAME 
FROM B_CUSTOMERS
WHERE SELLER_ID IN(15, 35, 65)
ORDER BY SELLER_ID, CUSTOMER_NAME;

/* 23 */
SELECT CUSTOMER_NAME, CITY 
FROM B_CUSTOMERS
WHERE (CREDIT_LIMIT BETWEEN 30000 AND 60000) AND (CUST_STATE = 'CA' OR CUST_STATE = 'CO')
ORDER BY CUSTOMER_NAME;

/* 24 */
SELECT CATEGORY_CODE, PRODUCT_CODE, DESCRIPTION 
FROM  B_PRODUCTS
WHERE CATEGORY_CODE != 'SG'
ORDER BY CATEGORY_CODE, PRODUCT_CODE;

/* 25 */
SELECT ORDER_ID, PRODUCT_CODE, QUANTITY, PRICE_PAID, QUANTITY * PRICE_PAID AS "EXTENDED_PRICE"
FROM B_ORDER_LINES
ORDER BY "EXTENDED_PRICE" DESC;