-- 1. **Creating and Populating Tables**
-- **Objective:**
-- - Set up a simple table, insert data, and retrieve that data using basic queries.

-- create table

CREATE TABLE Employees(
    EmployeeId INT PRIMARY AUTO_INCREMENT
    FirstName VARCHAR(100) NOT nULL
    LastName VARCHAR(100) NOT nULL
    Email VARCHAR(100) UNIQUE NOT nULL
    JoiningDate DATE NOT nULL
    Department VARCHAR(100) NOT NULL
)

--insert values

INSERT INTO 
    Employees(FirstName,LastName,Email,Salary)
VALUES
    ('kishore','CM','imkishopr16@gmail.com','2025-04-01','IT')

Select * from Employees;