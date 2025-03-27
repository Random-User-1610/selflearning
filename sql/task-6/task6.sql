
-- 6. **Date and Time Functions**
--     - Manipulate and query data based on date and time values.
    
    
-- - Use built-in date functions (e.g., `DATEDIFF`, `DATEADD`, or your SQL dialect’s equivalent) to calculate intervals or adjust dates.
-- - Write a query to filter records based on date ranges (e.g., orders placed within the last 30 days).
-- - Format date outputs if necessary using functions like `CONVERT` or `TO_CHAR`.

SELECT  EmployeeId,FirstName , JoiningDate,DATEDIFF(CURDATE(),JoiningDate) AS DaysSinceJoining
FROM Employees;

SELECT OrderId,OrderDate, DATE_SUB(CURDATE(),INTERVAL 30 DAY) AS ThirtyDaysAgo
FROM Orders;

SELECT * 
FROM Orders
WHERE OrderDate >= DATE_SUB(CURDATE(),INTERVAL 30 DAY);

SELECT OrderId,OrderDate , DATE_FORMAT(OrderDate,'%d-%b-%Y') AS FormattedDate
FROM Orders ;