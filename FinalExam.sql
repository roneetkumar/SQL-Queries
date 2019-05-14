DROP SYNONYM PROD;
DROP SEQUENCE PROD_ID_SEQ;

PROMPT PART 1 CREATING NEW SCHEMA OBJECTS:
PROMPT QUESTION 1:

CREATE SYNONYM PROD FOR PRODUCT;

PROMPT QUESTION 2:

CREATE SEQUENCE PROD_ID_SEQ
START WITH 110000
INCREMENT BY 10;

PROMPT QUESTION 3:

CREATE OR REPLACE VIEW PROD_VIEW AS
SELECT PRODUCT_ID, DESCRIPTION
FROM PRODUCT
WITH READ ONLY;

PROMPT QUESTION 4:

CREATE OR REPLACE VIEW EXPIRY_VIEW 
AS SELECT PRODUCT_ID,MONTHS_BETWEEN (END_DATE, START_DATE) 
AS MONTHS
FROM PRICE
WHERE END_DATE IS NOT NULL;

PROMPT PART 2 DISPLAYING YOUR SCHEMA OBJECTS:
PROMPT QUESTION 5:

SELECT TABLE_NAME FROM USER_TABLES;

PROMPT QUESTION 6:

SELECT VIEW_NAME FROM USER_VIEWS;

PROMPT PART 3 CREATING SQL QUERIES:
PROMPT QUESTION 7 SQL FUNCTIONS:

SELECT COUNT(*) AS NBR_EMPLOYEES
FROM EMPLOYEE 
WHERE COMMISSION != 0;


PROMPT QUESTION 8 SQL FUNCTIONS:

SELECT JOB_ID, (MAX(SALARY) - MIN(SALARY)) AS DIFFERENCE
FROM EMPLOYEE
GROUP BY JOB_ID;

PROMPT QUESTION 9 SQL FUNCTIONS:

SELECT DEPARTMENT_ID, MIN (SALARY)
FROM EMPLOYEE
HAVING MIN (SALARY) < 1500
GROUP BY DEPARTMENT_ID;

PROMPT QUESTION 10 JOINS:

SELECT O.ORDER_ID, C.NAME 
FROM SALES_ORDER O JOIN CUSTOMER C 
ON (O.CUSTOMER_ID = C.CUSTOMER_ID)
ORDER BY NAME;

PROMPT QUESTION 11 JOINS:

SELECT E.LAST_NAME, E.HIRE_DATE, M.LAST_NAME, M.HIRE_DATE
FROM EMPLOYEE E JOIN EMPLOYEE M
ON (E.MANAGER_ID = M.EMPLOYEE_ID)
WHERE E.HIRE_DATE < M.HIRE_DATE
ORDER BY 1, 3;

PROMPT QUESTION 12 SUBQUERIES:

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE DEPARTMENT_ID 
IN (SELECT DEPARTMENT_ID 
    FROM EMPLOYEE 
    WHERE UPPER(LAST_NAME) = 'FORD')
AND UPPER(LAST_NAME) != 'FORD';

PROMPT QUESTION 13 SUBQUERIES:

SELECT LAST_NAME, SALARY 
FROM EMPLOYEE 
WHERE EMPLOYEE_ID IN (SELECT SALESPERSON_ID FROM CUSTOMER)
ORDER BY SALARY DESC;

COMMIT;