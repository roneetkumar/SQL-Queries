CONNECT / AS SYSDBA
-- Give all privileges to User in order to create Views, Synonyms, Sequences, ...
GRANT ALL PRIVILEGES TO demo;
CONNECT demo/demo

DROP TABLE DEPT;
DROP TABLE EMP;
DROP VIEW EMPLOYEES_VIEW;


PROMPT QUESTION 1 - Creating TABLE DEPT
-- Creating TABLE DEPT
CREATE TABLE DEPT ( ID NUMBER(7), NAME VARCHAR2(25));
DESCRIBE DEPT

-- Populating the DEPT table with data from the DEPARTMENT
INSERT INTO DEPT
SELECT department_id, name
FROM department;

PROMPT QUESTION 2 - Creating TABLE EMP
-- Creating and Populating TABLE EMP
CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;
DESCRIBE EMP

PROMPT QUESTION 3 - Displaying Data-Dictionary

SELECT table_name 
FROM user_tables
WHERE table_name IN ('DEPT', 'EMP');

PROMPT QUESTION 4 - Creating EMPLOYEES_VIEW

-- CONNECT / AS SYSDBA
-- GRANT CREATE VIEW TO demo;
-- CONNECT demo/demo
CREATE VIEW EMPLOYEES_VIEW AS 
SELECT EMPLOYEE_ID , LAST_NAME , DEPARTMENT_ID
FROM EMPLOYEE;

PROMPT QUESTION 5 - Changing the Heading 

SELECT EMPLOYEE_ID , LAST_NAME "EMPLOYEE", DEPARTMENT_ID
FROM EMPLOYEES_VIEW;