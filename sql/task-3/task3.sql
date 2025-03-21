-- 3. **Simple Aggregation and Grouping**
--     **Objective:**
--     - Summarize data using aggregate functions and grouping.

-- - Write a query that uses aggregate functions such as `COUNT()`, `SUM()`, or `AVG()` to calculate totals or averages.
-- - Use the `GROUP BY` clause to aggregate data by a specific column (e.g., count the number of employees per department).
SELECT Department,Count(*) as Count
FROM Employees
group by Department

Select Department,SUM(Salary) AS ToatalDepSalary
FROM Employees
GROUP BY Department;

SELECT Department, AVG(Salary) AS DepAvgSalary
FROM Employees
GROUP BY Department;

-- - Optionally, filter grouped results using the `HAVING` clause.
SELECT Department,SUM(Salary) as ToatalDepSalary
FROm Employees
GROUP BY Department
Having ToatalDepSalary > 10000