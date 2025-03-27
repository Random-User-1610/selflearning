-- 8. **Common Table Expressions (CTEs) and Recursive Queries**
--     - Simplify complex queries and process hierarchical data using CTEs.
    
--     **Requirements:**
--     - Write a non-recursive CTE to structure a multi-step query for readability (e.g., breaking down a complex aggregation).

CTE : common table expression
Creates a temporary cte that calculates sum(salary) for each department.
WITH DepSalary AS (
    SELECT 
        Department, 
        SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY Department
)
SELECT * 
FROM DepSalary
WHERE TotalSalary >= 50000;

--     - Create a recursive CTE to display hierarchical data (e.g., an organizational chart or a category tree).
--     - Ensure proper termination of the recursive CTE to avoid infinite loops.

--  Recursive CTE for heirarchial data and category tree

--  Hierarchical Data  :
-- an employee table where eeach employee has a manager ie managerId field,  EmployeeId,FirstName,LastName , ManagerId

WITH RECURSIVE EmployeeHierarchy AS (
    SELECT 
        EmployeeId, 
        FirstName, 
        LastName,
        ManagerId,
        1 AS HierarchyLevel
    FROM Employees
    WHERE ManagerId IS NULL  

    UNION ALL

    SELECT 
        e.EmployeeId, 
        e.Name, 
        e.ManagerId,
        eh.HierarchyLevel + 1 AS HierarchyLevel
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerId = eh.EmployeeId
)
SELECT * FROM EmployeeHierarchy;



--  Categorical Data  :
-- anproducts table where each product comes under a a category like electronics , clothes etc
-- CategoryId , CategoryName , ParentCategoryId

WITH RECURSIVE CategoryTree AS (
    -- Base Case: Start with the "Electronics" category
    SELECT 
        CategoryId, 
        CategoryName, 
        ParentCategoryId,
        1 AS Level
    FROM Categories
    WHERE CategoryName = 'Electronics'

    UNION ALL

    -- Recursive Case: Join categories with their parents
    SELECT 
        c.CategoryId, 
        c.CategoryName, 
        c.ParentCategoryId,
        ct.Level + 1 AS Level
    FROM Categories c
    INNER JOIN CategoryTree ct ON c.ParentCategoryId = ct.CategoryId
)
SELECT * FROM CategoryTree;
