-- 1. **Creating and Populating Tables**
-- **Objective:**
-- - Set up a simple table, insert data, and retrieve that data using basic queries.

-- create table

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoiningDate DATE NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Salary INT NOT NULL
);


INSERT INTO 
    Employees(FirstName,LastName,Email,JoiningDate,Department,Salary)
VALUES
    ('kishore','CM','imkishor16@gmail.com','2025-04-01','IT',50000);

SELECT * from Employees;