-- 4. **Multi-Table JOINs** 
--     **Objective:**
--     - Combine data from two related tables using JOIN operations.
    
-- - Create two related tables (e.g., `Customers` and `Orders`) with a foreign key relationship.

CREATE TABLE Customers(
    CustomerId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(10) UNIQUE NOT NULL
)

CREATE TABLE Orders(
    OrderId INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Amount Decimal(10,2) NOT NULL,  
    
    CustomerId INT,
    FORIEGN KEY(CustomerId) REFERENCES Customers(CustomerId)
)

-- - Write an `INNER JOIN` query to retrieve combined information (e.g., customer names along with their order details).
SELECT C.CustomerID,C.Name,Orders.O,O.Amount
FROM Customers C
INNER JOIN Orders O ON C.CustomerID= O.CustomerID


-- - Experiment with other types of joins such as `LEFT JOIN` to understand how missing matches are handled
SELECT C.CustomerID,C.Name, O.OrderID, O.Amount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;

-- RIGHT JOIN: retrieves all orders,including those without matching customers
SELECT C.CustomerID, C.Name, O.OrderID, O.Amount
FROM Customers C
RIGHT JOIN Orders O ON C.CustomerID = O.CustomerID;