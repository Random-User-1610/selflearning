-- 2. **Basic Filtering and Sorting**
--     **Objective:**
--     - Write queries that filter records and sort the result set.



-- Use the WHERE clause to filter records based on a condition (e.g., WHERE Department = 'Sales').
SELECT * FROM Employees 
WHERE Department='sales';


-- Apply the ORDER BY clause to sort the results (e.g., by LastName or Salary).
SELECT * FROM Employees 
ORDER BY LastName ;

-- Experiment with multiple conditions using AND/OR.
SELECT * FROM Employees 
WHERE Department='Sales' 
AND JoiningDate>'2024-04-01'
