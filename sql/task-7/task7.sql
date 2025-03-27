-- 7. **Window Functions and Ranking**
--     - Leverage window functions to perform calculations across a set of rows.
--     **Requirements:**
    
--     - Write a query using window functions such as `ROW_NUMBER()`, `RANK()`, or `DENSE_RANK()` to assign ranks (e.g., rank employees by salary within each department).
--     - Use `PARTITION BY` to define groups and `ORDER BY` to specify the ranking order.
--     - Experiment with other window functions like `LEAD()` or `LAG()` to access adjacent row values.

SELECT 
    EmployeeId, 
    FirstName, 
    Department, 
    Salary,
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RowNum,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankNum,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DenseRankNum
FROM Employees;

SELECT 
    EmployeeId, 
    FirstName, 
    Department, 
    Salary,
    LEAD(Salary) OVER (PARTITION BY Department ORDER BY Salary DESC) AS NextSalary,
    LAG(Salary) OVER (PARTITION BY Department ORDER BY Salary DESC) AS PreviousSalary
FROM Employees;
