SET PAGESIZE 16  
SET PAUSE 'To Continue .. Please, Press Enter ..'
SET PAUSE ON 

PROMPT Exercise 1
-- Write a query to display the Last Name, Job ID, Department ID, 
-- and Department Name for all Employee who work in New York.
SELECT E.Last_Name, E.Job_ID, E.Department_ID, D.Name
FROM Employee E JOIN Department D
ON (E.Department_ID = D.Department_ID)
JOIN Location L
ON (D.Location_ID = L.Location_ID)
WHERE LOWER(L.Regional_Group) = 'new york';

-- Exercise 1 --  without JOIN keyword
SELECT E.Last_Name, E.Job_ID, E.Department_id, 
       D.Name, L.Regional_Group
FROM Employee E , Department D , Location L
WHERE (E.Department_id = D.Department_id) AND
      (D.Location_id = L.Location_id) AND
      (UPPER (L.Regional_Group) = UPPER('New York') );


SET PAGESIZE 34  
PROMPT Exercise 2.1 , 2.2
-- 1.Display the Employee Last Name and Employee ID along with their Manager’s last Name and Manager ID. 
-- 2.Label the columns Employee, Emp#, Manager, and Mgr#, respectively

SELECT E.Last_Name "Employee", E.Employee_ID "EMP#",
       M.Last_Name "Manager" , M.Employee_ID "Mgr#"
FROM Employee E JOIN Employee M
ON (E.Manager_ID = M.Employee_ID);

--Exercise 2.1 -- Solution to display the Employee Full Name and their Manager’s Full Name 
SELECT E.Last_Name||' '||E.First_Name "NAME", 
       E.Manager_id, 
	   M.Last_Name||' '||M.First_Name "NAME"
FROM Employee E JOIN Employee M
ON (E.manager_id = M.Employee_id);

-- Exercise 2.1 -- without JOIN keyword

SELECT E.Last_Name "Employee", E.Employee_ID "EMP#",
       M.Last_Name "Manager" , M.Employee_ID "Mgr#"
FROM   Employee E , Employee M
WHERE (E.Manager_ID = M.Employee_ID);

SET PAGESIZE 35
PROMPT Exercise 2.3
-- 3.Modify the last query to display all Employees including those who have no manager.

SELECT E.Last_Name "Employee", E.Employee_ID "EMP#",
       M.Last_Name "Manager", M.Employee_ID "Mgr#"
FROM Employee E LEFT OUTER JOIN Employee M
ON (E.Manager_ID = M.Employee_ID);

SET PAGESIZE 111
PROMPT Exercise 3
-- 1.Create a query that displays the Last Name, Department ID, and 
-- all the Employees who work in the same department as a given Employee. 
-- Give each column an appropriate labeL.

SELECT E.Department_ID "Department", E.Last_Name "Employee", C.Last_Name "Colleague"
FROM Employee E JOIN Employee C
ON (E.Department_ID = C.Department_ID)
WHERE (E.Employee_ID != C.Employee_ID)
ORDER BY E.Department_ID, E.Last_Name, C.Last_Name;

-- OR without JOIN

SELECT E.Department_ID "Department", E.Last_Name "Employee", C.Last_Name "Colleague"
FROM Employee E , Employee C
WHERE (E.Department_ID = C.Department_ID) AND
      (E.Employee_ID != C.Employee_ID)
ORDER BY E.Department_ID, E.Last_Name, C.Last_Name;

PROMPT Exercise 4
-- Create a query to display the Last Name and Hire Date of any Employee 
-- hired after Employee Smith John.

SELECT E.Last_Name, E.Hire_Date
FROM   Employee E JOIN Employee S
ON (S.Hire_Date < E.Hire_Date)
WHERE (LOWER(S.Last_Name) = 'smith' AND LOWER(S.First_Name) = 'john');

-- OR without JOIN

SELECT E.Last_Name, E.Hire_Date
FROM   Employee E, Employee S
WHERE (S.Hire_Date < E.Hire_Date) AND (LOWER(S.Last_Name) = 'smith') AND 
	  (LOWER(S.First_Name) = 'john');

	  
SET PAGESIZE 18
PROMPT Exercise 5
-- Display the Last Name and Hire Date for all Employee who were hired before 
-- their managers, along with their manager’s Last Name and Hire Dates.

SELECT E.last_Name, E.Hire_Date, M.last_Name, M.Hire_Date
FROM Employee E JOIN Employee M
ON (E.Manager_ID = M.employee_ID)
WHERE E.Hire_Date < m.Hire_Date;

-- OR without JOIN

SELECT E.last_Name, E.Hire_Date, M.last_Name, M.Hire_Date
FROM Employee E, Employee M
WHERE E.Manager_ID = M.Employee_ID
AND E.Hire_Date < M.Hire_Date;

SET PAGESIZE 13
PROMPT Exercise 6
-- Write a query to display each Department Name, location, Number of Employees,
-- and the Average salary for all Employees in that department.

SELECT D.Name "Department", L.REGIONAL_GROUP "Location",
COUNT(*) "Number of Employees",
ROUND(AVG(E.salary),2) "AVG Salary"
FROM Employee E JOIN Department D
ON (E.Department_ID = D.Department_ID)
JOIN LOCATION L
ON (D.LOCATION_ID = L.LOCATION_ID)
GROUP BY D.Name, L.REGIONAL_GROUP;

-- OR without JOIN

SELECT D.Name "Department", L.REGIONAL_GROUP "Location",
COUNT(*) "Number of Employees",
ROUND(AVG(E.salary),2) "AVG Salary"
FROM Employee E, Department D
WHERE E.Department_ID = D.Department_ID
GROUP BY D.Name, L.REGIONAL_GROUP;





