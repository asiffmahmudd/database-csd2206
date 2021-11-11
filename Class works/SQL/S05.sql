/* 1 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS "NAME", CURRENT_DATE AS "TODAY", HIRE_DATE, ROUND(MONTHS_BETWEEN(CURRENT_DATE, HIRE_DATE)) AS "MONTHS_EMPLOYED"
FROM B_EMPLOYEES
ORDER BY LAST_NAME 

/* 2 */
SELECT CURRENT_DATE AS "TODAY", LAST_DAY(CURRENT_DATE) AS "Last Day of Month"
FROM SYSIBM.SYSDUMMY1; 

/* 3 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS "NAME", CURRENT_DATE AS "TODAY", HIRE_DATE, DECIMAL((DAYS(CURRENT_DATE) - DAYS(HIRE_DATE))/365.2425,4,2) AS "YEARS"
FROM B_EMPLOYEES
ORDER BY LAST_NAME 

/* 4 */
SELECT CURRENT_DATE AS "TODAY", ADD_MONTHS(CURRENT_DATE, 6) AS "APPOINTMENT"
FROM SYSIBM.SYSDUMMY1; 

/* 5 */
SELECT CURRENT_DATE AS "TODAY", ADD_MONTHS(CURRENT_DATE, 4) AS "APPOINTMENT"
FROM SYSIBM.SYSDUMMY1; 

/* 6 */
SELECT CURRENT_DATE AS "TODAY", LAST_DAY(CURRENT_DATE) AS "DEADLINE"
FROM SYSIBM.SYSDUMMY1; 

/* 7 */
SELECT CURRENT_DATE AS "TODAY", NEXT_DAY(ADD_MONTHS(CURRENT_DATE, 6), 'FRIDAY') AS "Friday Date"
FROM SYSIBM.SYSDUMMY1; 

/* 8 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS "NAME", TO_CHAR(HIRE_DATE, 'Month DD, YYYY')
FROM B_EMPLOYEES
ORDER BY LAST_NAME 

/* 9 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS "NAME", TO_CHAR(HIRE_DATE, 'Day, Month DD, YYYY')
FROM B_EMPLOYEES
ORDER BY LAST_NAME 

/* 10 */
SELECT 
  FIRST_NAME || ' ' || LAST_NAME AS "NAME", 
  TO_CHAR(MONTHLY_SALARY * 12, '99,999.99') AS "Current Yearly Salary", 
  TO_CHAR((MONTHLY_SALARY +100) * 12, '99,999.99') AS "New Yearly Salary"
FROM B_EMPLOYEES
WHERE FIRST_NAME || ' ' || LAST_NAME = 'Sandy Black'

/* 11 */
SELECT 
  CUSTOMER_NAME, STREET || ' ' || CITY || ', ' || CUST_STATE AS "ADDRESS",
  DISCOUNT AS "CURRENT_DISCOUNT",
  DECIMAL(COALESCE(DISCOUNT, 0.1), 4,3 ) AS "NEW_DISCOUNT"
FROM B_CUSTOMERS
WHERE CUST_STATE IN ('CA', 'NY', 'SC')
ORDER BY CUSTOMER_NAME;

/* 12 ###*/
SELECT 
  CUSTOMER_NAME, STREET || ' ' || CITY || ', ' || CUST_STATE AS "ADDRESS",
  DISCOUNT AS "CURRENT_DISCOUNT",
  COALESCE(DISCOUNT, 'N/A') AS "DISCOUNT"
FROM B_CUSTOMERS
WHERE CUST_STATE IN ('CA', 'NY', 'SC')
ORDER BY CUSTOMER_NAME;

/* 13 ###*/
SELECT 
  CATEGORY_CODE AS "Category Code",
  DESCRIPTION,
  PRICE AS "Original Price",
  CASE 
    WHEN CATEGORY_CODE = 'HW' THEN PRICE*1.25
    WHEN CATEGORY_CODE = 'AP' THEN PRICE*1.50
    WHEN CATEGORY_CODE = 'SG' THEN PRICE*1.75
    ELSE THEN PRICE
  END AS "New Price"
FROM B_PRODUCTS
WHERE CATEGORY_CODE IN ('HW', 'LA', 'SG') AND "New Price" > 2500
ORDER BY CATEGORY_CODE, "New Price";
