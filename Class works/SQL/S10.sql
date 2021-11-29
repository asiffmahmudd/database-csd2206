/* 1 */
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME, HIRE_DATE
FROM B_EMPLOYEES
JOIN B_DEPARTMENTS
USING (DEPARTMENT_CODE)
WHERE YEAR(HIRE_DATE) = 2010

/* 2 */
SELECT 
  d.DEPARTMENT_CODE, 
  DEPARTMENT_NAME, 
  COALESCE(FIRST_NAME, '----') AS first_name, 
  COALESCE(LAST_NAME,'----') AS last_name
FROM B_EMPLOYEES e
RIGHT JOIN B_DEPARTMENTS d
ON (d.DEPARTMENT_CODE = e.DEPARTMENT_CODE)
ORDER BY d.DEPARTMENT_CODE;

/* 3 */
SELECT 
  LAST_NAME, 
  FIRST_NAME, 
  COALESCE(DEPARTMENT_NAME, 'Not assigned') AS department
FROM B_EMPLOYEES 
LEFT JOIN B_DEPARTMENTS
USING (DEPARTMENT_CODE)
ORDER BY LAST_NAME;

/* 4 */
SELECT 
  DEPARTMENT_NAME,
  FIRST_NAME || ' ' || LAST_NAME AS manager
FROM B_EMPLOYEES AS E
JOIN B_DEPARTMENTS AS D
ON E.EMPLOYEE_ID = D.MANAGER_ID;

/* 5 */
SELECT 
  FIRST_NAME,
  LAST_NAME,
  HIRE_DATE,
  JOB_CODE,
  JOB_TITLE,
  MAX_SALARY
FROM B_EMPLOYEES
JOIN B_JOBS
USING (JOB_CODE)
WHERE MAX_SALARY > 50000
ORDER BY MAX_SALARY DESC;

/* 6 */
SELECT 
  DEPARTMENT_NAME,
  FIRST_NAME || ' ' || LAST_NAME AS employee,
  JOB_TITLE
FROM B_DEPARTMENTS
JOIN B_EMPLOYEES USING (DEPARTMENT_CODE)
JOIN B_JOBS USING (JOB_CODE)
WHERE DEPARTMENT_NAME IN ('Video Games', 'Information Technology')
ORDER BY DEPARTMENT_NAME, LAST_NAME;

/* 7 */
SELECT 
  DEPARTMENT_CODE AS dept_code,
  DEPARTMENT_NAME,
  TO_CHAR(DECIMAL(AVG(MONTHLY_SALARY*12),9,2),'9,999,999.99') AS average_yearly_salary
FROM B_DEPARTMENTS
JOIN B_EMPLOYEES
USING (DEPARTMENT_CODE)
GROUP BY DEPARTMENT_CODE, DEPARTMENT_NAME 
HAVING AVG(MONTHLY_SALARY*12) > 50000
ORDER BY average_yearly_salary DESC;

/* 8 s*/
SELECT 
  D.DEPARTMENT_CODE AS dept_code,
  DEPARTMENT_NAME,
  COALESCE(TO_CHAR(D.MANAGER_ID, '999'), 'Not assigned') AS manager,
  COALESCE(FIRST_NAME, '-----') AS first_name,
  COALESCE(LAST_NAME, '-----') AS last_name
FROM B_DEPARTMENTS AS D
LEFT JOIN B_EMPLOYEES AS E
ON D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_CODE;


/* 9 */
SELECT 
  CITY,
  W.WAREHOUSE_ID,
  CATEGORY_NAME,
  P.PRODUCT_CODE,
  DESCRIPTION,
  QOH
FROM B_CATEGORIES AS C
JOIN B_PRODUCTS AS P ON (P.CATEGORY_CODE = C.CATEGORY_CODE)
JOIN B_INVENTORY AS I ON (P.PRODUCT_CODE = I.PRODUCT_CODE)
JOIN B_WAREHOUSES AS W ON (W.WAREHOUSE_ID = I.WAREHOUSE_ID) 
ORDER BY W.CITY, W.WAREHOUSE_ID, C.CATEGORY_NAME, P.PRODUCT_CODE;
