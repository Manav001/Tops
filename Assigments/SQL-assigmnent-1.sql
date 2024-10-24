create database task;

-- Create Company table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

-- Create Contact table
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- Create ContactEmployee table
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip)
VALUES 
(1, 'Apple Inc.', '1 Apple Park Way', 'Cupertino', 'CA', '95014'),
(2, 'Google LLC', '1600 Amphitheatre Pkwy', 'Mountain View', 'CA', '94043'),
(3, 'Amazon.com, Inc.', '410 Terry Ave', 'Seattle', 'WA', '98109'),
(4, 'Microsoft Corp', 'One Microsoft Way', 'Redmond', 'WA', '98052'),
(5, 'Tesla, Inc.', '3500 Deer Creek Rd', 'Palo Alto', 'CA', '94304'),
(6, 'Facebook, Inc.', '1 Hacker Way', 'Menlo Park', 'CA', '94025'),
(7, 'Netflix, Inc.', '100 Winchester Circle', 'Los Gatos', 'CA', '95032'),
(8, 'Uber Technologies, Inc.', '1455 Market St', 'San Francisco', 'CA', '94103'),
(9, 'Airbnb, Inc.', '888 Brannan St', 'San Francisco', 'CA', '94103'),
(10, 'Urban Outfitters', '5000 S Broad St', 'Philadelphia', 'PA', '19112');

INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES 
(1, 1, 'John', 'Doe', '123 Main St', 'Cupertino', 'CA', '95014', TRUE, 'john@apple.com', '408-555-1234'),
(2, 2, 'Jane', 'Smith', '456 Oak Ave', 'Mountain View', 'CA', '94043', FALSE, 'jane@google.com', '650-555-5678'),
(3, 3, 'Alice', 'Johnson', '789 Pine St', 'Seattle', 'WA', '98109', TRUE, 'alice@amazon.com', '206-555-8765'),
(4, 4, 'Bob', 'Brown', '987 Elm St', 'Redmond', 'WA', '98052', TRUE, 'bob@microsoft.com', '425-555-9876'),
(5, 5, 'Charlie', 'White', '654 Maple Ave', 'Palo Alto', 'CA', '94304', TRUE, 'charlie@tesla.com', '650-555-1239'),
(6, 6, 'Eve', 'Davis', '321 Cedar St', 'Menlo Park', 'CA', '94025', TRUE, 'eve@facebook.com', '650-555-1111'),
(7, 7, 'Frank', 'Wilson', '159 Spruce St', 'Los Gatos', 'CA', '95032', TRUE, 'frank@netflix.com', '408-555-4321'),
(8, 8, 'Grace', 'Lee', '753 Ash St', 'San Francisco', 'CA', '94103', TRUE, 'grace@uber.com', '415-555-6543'),
(9, 9, 'Hank', 'Moore', '951 Fir St', 'San Francisco', 'CA', '94103', FALSE, 'hank@airbnb.com', '415-555-8769'),
(10, 10, 'Isaac', 'Black', '852 Redwood St', 'Philadelphia', 'PA', '19112', TRUE, 'isaac@urban.com', '215-555-9999');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES 
(1, 'Lesley', 'Bland', 85000.00, '2020-03-12', 'Manager', 'lesley.bland@company.com', '215-555-1234'),
(2, 'Michael', 'Johnson', 90000.00, '2019-05-20', 'Engineer', 'michael.johnson@company.com', '650-555-2222'),
(3, 'Sarah', 'Wright', 95000.00, '2018-08-25', 'Analyst', 'sarah.wright@company.com', '408-555-3333'),
(4, 'Emily', 'Clark', 70000.00, '2021-01-15', 'HR Specialist', 'emily.clark@company.com', '206-555-4444'),
(5, 'James', 'Hall', 110000.00, '2017-07-10', 'Consultant', 'james.hall@company.com', '425-555-5555'),
(6, 'David', 'Martin', 78000.00, '2021-11-30', 'Developer', 'david.martin@company.com', '650-555-6666'),
(7, 'Sophia', 'Harris', 60000.00, '2019-09-18', 'Support Specialist', 'sophia.harris@company.com', '408-555-7777'),
(8, 'Daniel', 'Garcia', 85000.00, '2020-12-01', 'Project Manager', 'daniel.garcia@company.com', '415-555-8888'),
(9, 'Olivia', 'Young', 95000.00, '2020-02-22', 'Finance Manager', 'olivia.young@company.com', '215-555-9999'),
(10, 'William', 'King', 120000.00, '2016-06-05', 'Director', 'william.king@company.com', '650-555-0000');



UPDATE Employee
SET Phone = 215-555-8800
WHERE FirstName = "Lesley" AND LastName = "Bland"; 

UPDATE Company SET CompanyName = "Urban Outfitters, Inc." WHERE CompanyName = "Urban Outfitters";

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 5;

SELECT Employee.FirstName, Employee.LastName
FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact ON Contact.ContactID = ContactEmployee.ContactID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';

-- 8. What is the significance of “%” and “_” operators in the LIKE statement? 
-- ans=> In SQL, the LIKE statement uses % to match any sequence of characters and _ to match a single character. 
--       These wildcards help perform flexible text searches.

-- 9. Explain normalization in the context of databases.
-- ans=>Normalization in databases tidies up data, reduces redundancy, and improves integrity by organizing it into related tables. 
--      Think of it as decluttering your room—making everything easy to find and manage.

-- 10. What does a join in MySQL mean?
-- Ans=>In MySQL, a join connects tables by matching related columns, letting you view data from multiple tables together.
--      This is useful when data is spread across multiple tables but you want to see it all together in one view.

-- 11. What do you understand about DDL, DCL, and DML in MySQL? 
-- Ans=>DDL: Defines the structure of database objects (e.g., CREATE, ALTER, DROP).
--      DML: Manages data within tables (e.g., INSERT, UPDATE, DELETE, SELECT).
--      DCL: Controls access to data (e.g., GRANT, REVOKE).
--      These three language subsets enable database creation, modification, and data management.

-- 12.What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?
-- Ans.=>The JOIN clause in MySQL enables combining records from multiple tables based on a related column, 
--       which is essential in relational databases. Common types include INNER JOIN (returns matching records), 
 --      LEFT JOIN (returns all records from the left table), and RIGHT JOIN (returns all records from the right table, even if unmatched). 
