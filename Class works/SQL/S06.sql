/* 1 */
SELECT DECIMAL(AVG(PRICE),5,2) AS average
FROM B_PRICES
WHERE END_DATE IS NOT NULL;

/* 2 */
SELECT SUM(QUANTITY*PRICE_PAID) AS total_orders
FROM B_ORDER_LINES; 

/* 3 */
SELECT 
  MIN(MONTHLY_SALARY) AS low_salary,
  MAX(MONTHLY_SALARY) AS high_salary,
  DECIMAL(AVG(MONTHLY_SALARY), 6, 2) AS avg_salary,
  TO_CHAR(MAX(HIRE_DATE), 'mm/dd/yyyy') AS last_hire_date,
  MIN(LAST_NAME) AS low_name,
  MAX(LAST_NAME) AS high_name 
FROM B_EMPLOYEES;

/* 4 */
One row will be returned

/* 5 */
SELECT 
  COUNT(*) AS number_of_products, 
  DECIMAL(AVG(PRICE),6,2) AS average_price 
FROM B_PRODUCTS
WHERE CATEGORY_CODE = 'LA';

/* 6 */
SELECT COUNT(*) AS "Number of Orders"
FROM B_ORDERS
WHERE YEAR(ORDER_DATE) = 2020

/* 7 */
SELECT 
  COUNT(*) AS "Count", 
  TO_CHAR(AVG(CREDIT_LIMIT), '99,999.99') AS "Avg Crd Lmt",
  TO_CHAR(AVG(BALANCE), '99,999.99') AS "Avg Bal",
  TO_CHAR(SUM(CREDIT_LIMIT-BALANCE), '999,999.99') AS "Tot Crd Avail",
  TO_CHAR(AVG(CREDIT_LIMIT-BALANCE), '99,999.99') AS "Avg Crd Avail"
FROM B_CUSTOMERS;

/* 8 */
SELECT COUNT(DISTINCT CITY) AS "CITIES"
FROM B_CUSTOMERS
WHERE CITY IS NOT NULL;

/* 9 */
SELECT 
  COUNT(*) AS "Customers with no Discount"
FROM B_CUSTOMERS
WHERE DISCOUNT IS NULL;

/* 10 */
SELECT CUSTOMER_NAME, COALESCE(DISCOUNT, 0.005) AS "Discount"
FROM B_CUSTOMERS
ORDER BY "Discount";

/* 11 */
SELECT CUSTOMER_NAME, COALESCE(TO_CHAR(DISCOUNT, '0.999'), 'Not ssigned') AS "Discount"
FROM B_CUSTOMERS
ORDER BY Discount DESC;

/* 12 */
SELECT 
  LPAD(TO_CHAR(ORDER_DATE, 'MONTH, dd, yyyy'), 19) AS "Order date",
  ORDER_ID AS "Order ID",
  CUSTOMER_ID AS "Customer",
  RPAD(COALESCE(TO_CHAR(SHIP_DATE, 'MONTH, dd, yyyy'), 'Not shipped'), 19) AS "Ship date"
FROM B_ORDERS
ORDER BY ORDER_DATE, ORDER_ID;