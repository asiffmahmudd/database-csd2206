/* 1.1 */
CREATE OR REPLACE VIEW P14V1 AS
SELECT
  DEPARTMENT_NAME,
  LAST_NAME,
  FIRST_NAME,
  HIRE_DATE,
  MONTHLY_SALARY
FROM lcpublic.B_DEPARTMENTS
JOIN lcpublic.B_EMPLOYEES USING(DEPARTMENT_CODE)
WHERE HIRE_DATE > '2008-01-01';

/* 1.2 */
SELECT 
  DEPARTMENT_NAME,
  LAST_NAME,
  FIRST_NAME,
  HIRE_DATE,
  MONTHLY_SALARY
FROM P14V1
WHERE DEPARTMENT_NAME IN ('Home Theatre', 'Major Appliances', 'Small Appliances')
ORDER BY DEPARTMENT_NAME, LAST_NAME; 

/* 1.3 */
SELECT
  DEPARTMENT_NAME,
  LAST_NAME,
  FIRST_NAME,
  HIRE_DATE,
  MONTHLY_SALARY
FROM B_DEPARTMENTS
JOIN B_EMPLOYEES USING(DEPARTMENT_CODE)
WHERE HIRE_DATE > '2008-01-01' AND 
DEPARTMENT_NAME IN ('Home Theatre', 'Major Appliances', 'Small Appliances')
ORDER BY DEPARTMENT_NAME, LAST_NAME;

/* 2.1 */
CREATE OR REPLACE VIEW P14V2 AS
SELECT
  FIRST_NAME,
  LAST_NAME,
  HIRE_DATE,
  JOB_CODE,
  JOB_TITLE,
  MONTHLY_SALARY*12,
  MAX_SALARY
FROM lcpublic.B_EMPLOYEES
JOIN lcpublic.B_JOBS USING(JOB_CODE)
WHERE MAX_SALARY > 50000;

/* 2.2 */
SELECT *
FROM P14V2
ORDER BY LAST_NAME;

/* 2.3 */
SELECT 
  FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
  TO_CHAR(MAX_SALARY, '999,999.99'),
  TO_CHAR(YEARLY_SALARY, '999,999.99'),
  TO_CHAR(MAX_SALARY - YEARLY_SALARY, '999,999.99') AS SALARY_DIFFERENCE
FROM P14V2
WHERE JOB_TITLE = 'Department Manager'
ORDER BY LAST_NAME;

/* 3.1 */
CREATE OR REPLACE VIEW P14V3 AS
SELECT 
  LAST_NAME,
  FIRST_NAME,
  d.DEPARTMENT_NAME,
  e.MANAGER_ID
FROM lcpublic.B_EMPLOYEES e
JOIN lcpublic.B_DEPARTMENTS d ON (e.DEPARTMENT_CODE=d.DEPARTMENT_CODE)
ORDER BY LAST_NAME;

/* 3.2 */
SELECT 
  FIRST_NAME || ' ' || LAST_NAME AS NAME,
  DEPARTMENT_NAME AS DEPARTMENT,
  COALESCE(TO_CHAR(MANAGER_ID, '999'), '---') AS MANAGER 
FROM P14V3
ORDER BY LAST_NAME;

/* 4.1 */
CREATE OR REPLACE VIEW P14V4 AS
SELECT 
  d.DEPARTMENT_NAME AS DEPT_NAME,
  MIN(MONTHLY_SALARY)AS MIN_SALARY,
  MAX(MONTHLY_SALARY)AS MAX_SALARY,
  DECIMAL(AVG(MONTHLY_SALARY),7,2) AS AVG_MONTHLY_SALARY
FROM lcpublic.B_DEPARTMENTS d
LEFT JOIN lcpublic.B_EMPLOYEES e ON (d.DEPARTMENT_CODE = e.DEPARTMENT_CODE)
GROUP BY d.DEPARTMENT_NAME;

/* 4.2 */
SELECT *
FROM P14V4
ORDER BY DEPT_NAME;

/* 4.3 */
SELECT 
  DEPT_NAME,
  TO_CHAR(AVG_MONTHLY_SALARY, '99,999.99') AS AVG_MONTHLY_SALARY 
FROM P14V4
WHERE AVG_MONTHLY_SALARY IS NOT NULL
ORDER BY DEPT_NAME

/* 5.1 */
CREATE VIEW OR REPLACE P14V5 AS
SELECT 
  CUSTOMER_NAME,
  ORDER_DATE,
  ORDER_ID,
  PRODUCT_CODE,
  QUANTITY,
  PRICE_PAID,
  DESCRIPTION
FROM lcpublic.B_CUSTOMERS
JOIN lcpublic.B_ORDERS USING(CUSTOMER_ID)
JOIN lcpublic.B_ORDER_LINES USING(ORDER_ID)
JOIN lcpublic.B_PRODUCTS USING(PRODUCT_CODE);

/* 5.2 */
SELECT 
  CUSTOMER_NAME,
  ORDER_DATE,
  ORDER_ID,
  PRODUCT_CODE,
  QUANTITY,
  PRICE_PAID,
  DESCRIPTION
FROM P14V5
ORDER BY CUSTOMER_NAME, ORDER_DATE, PRODUCT_CODE;