-- 5. **Subqueries and Nested Queries**
--     **Objective:**    
--     - Use subqueries to filter or compute values within a main query.
    
--     - Write a query that uses a subquery in the WHERE clause (e.g., select employees whose salary is above the department’s average salary).

SELECT e.EmployeeId,e.FirstName,e.Salary,e.Department
from Employees e 
Where e.Salary >= (SELECT AVG(Salary) from Employees where department=e.department);

--     - Alternatively, use subqueries in the SELECT list to compute dynamic columns.
SELECT e.EmployeeId,e.FirstName,e.Salary, (SELECT AVG(salary) FROM Employees WHERE department = e.department) AS depAvgSalary
FROM Employees e;


--     - Understand the difference between correlated and non-correlated subqueries.
-- correlated : runs once per row
-- non - correlated : runs before the main query executes. 

SELECT e.employeeId, e.FirstName, e.salary
FROM Employees e
WHERE e.salary = (SELECT MAX(salary) From Employees);