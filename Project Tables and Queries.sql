/*
CREATE DATABASE DTB_Project
-- (a) Employee --
CREATE TABLE Employee(
	Emp_ID int NOT NULL,
    First_Name varchar(255) NOT NULL,
    Last_Name varchar(255) NOT NULL,
    Health_Cert varchar(255) NOT NULL, -- Boolean (True/False)
    E_type varchar(255) NOT NULL,	   -- Type of Employee (Manager/Stall Manager/Driver)
    PRIMARY KEY(Emp_ID)
)
INSERT INTO Employee
VALUES (1 , 'Abdullah', 'Mehtab', 'True' , 'Manager'	  ), 
	   (2 , 'Faizan'  , 'Cheema', 'True' , 'Stall Manager'), 
       (3 , 'Ali'     , 'Aziz'  , 'False', 'Driver'		  ),
       (4 , 'Shahrez' , 'Malik' , 'True' , 'Stall Manager'),
       (5 , 'Yamna'   , 'Hassan', 'True' , 'Stall Manager'),
       (6 , 'Ahmed'   , 'Mehtab', 'False' ,'Driver'		  ),
	   (7 , 'Bunty'   , 'Baaji' , 'False' ,'Driver'		  ),
	   (8 , 'Seerat'  , 'Roshan', 'True'  ,'Stall Manager'),
	   (9 , 'Shehzaad', 'Obaid' , 'True'  ,'Stall Manager'),
	   (10, 'Ali'     , 'Gajnu' , 'False' ,'Driver'		  ),
	   (11, 'Laiba'   , 'Hassan', 'True'  ,'Stall Manager'),
	   (12, 'Humas'   , 'Butt'  , 'True'  ,'Driver'		  ),
	   (13, 'Chota'   , 'Bheem' , 'True'  ,'Stall Manager'),
	   (14, 'Nobita'  , 'Nobi'  , 'False' ,'Null'		  );
	   
-- (b) Table Stalls --
CREATE TABLE Stalls(
	Stall_ID int NOT NULL,
    Start_Time varchar(255) NOT NULL,
    End_Time varchar(255) NOT NULL,
    PRIMARY KEY(Stall_ID)
)
CREATE TABLE Stall_Location(
	Stall_ID int NOT NULL,
	Locationn varchar(255) NOT NULL,
	FOREIGN KEY (Stall_ID) REFERENCES Stalls(Stall_ID)
)
INSERT INTO Stalls
VALUES (1, '12:00 pm', '5:00 pm'),
       (2, '7:00 am' , '3:00 pm'),
       (3, '3:00 pm' , '8:00 pm'),
	   (4, '12:00 pm', '3:00 pm'),
	   (5, '9:00 am' , '5:00 pm'),
	   (6, '12:00 pm', '7:00 pm'),
	   (7, '8:00 pm', '12:00 am');

INSERT INTO Stall_Location
VALUES (1, 'Busy Chowk A'),
       (1, 'Busy Chowk C' ),
       (2, 'Institute Entry Gate'),      
	   (2, 'Institute'),
       (2, 'Institute Exit Gate'), 
       (3, 'Market'),
       (4, 'Mall A'),
       (4, 'Mall C'),
       (5, 'Office B'),
       (5, 'Office C'),
       (5, 'Office A'),
       (6, 'Mall D'),
       (6, 'Mall B'),
       (7, 'Busy Chowk B');


-- (c) Furniture --
CREATE TABLE Furniture(
	Furniture_ID int NOT NULL,
	Lights varchar(1) NOT NULL,
	Colors varchar(1) NOT NULL,
	Banners varchar(1) NOT NULL,
	Cleaning varchar(1) NOT NULL,
	Chairs varchar(1) NOT NULL,
	Tabless varchar(1) NOT NULL,
	Spoons varchar(1) NOT NULL,
	Plates varchar(1) NOT NULL,
	Bowls varchar(1) NOT NULL,
	Glass varchar(1) NOT NULL,
	PRIMARY KEY(Furniture_ID)
)
INSERT INTO Furniture
VALUES  (1,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
		(2,'Y','N','N','Y','Y','Y','Y','N','Y','N'),
		(3,'N','N','N','Y','Y','Y','N','Y','Y','N'),
		(4,'Y','N','N','Y','N','Y','N','N','Y','Y'),
		(5,'N','Y','N','N','Y','N','Y','N','Y','N'),
		(6,'Y','Y','N','Y','Y','Y','N','Y','Y','Y'),
		(7,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');

-- (d) Warehouse --
CREATE TABLE Warehouse(
	Warehouse_ID int NOT NULL,
    City varchar(255) NOT NULL,
    Street varchar(255) NOT NULL,
	Postal_Code int NOT NULL,
    PRIMARY KEY(Warehouse_ID)
)
INSERT INTO Warehouse
VALUES	(1, 'Wahdat Colony', 'LDA 69', '13037'),
		(2, 'Johar Town', 'G4', '42069');

-- (e) Vehicle --
CREATE TABLE Vehicle(
	Vehicle_ID int NOT NULL,
    LSC_plate varchar(255) NOT NULL,
    Fuel_Cap int NOT NULL,
	typee varchar(255) NOT NULL,
    PRIMARY KEY(Vehicle_ID)
)
INSERT INTO Vehicle
VALUES  (1, 'LEC 9233', 10, 'Bike'),
		(2, 'MNA 8514', 45, 'Van' ),
		(3, 'SRK 2314', 15, 'Bike' ),
		(4, 'SKF 3487', 10, 'Bike' ),
		(5, 'WDN 9212', 50, 'Van' );

-- (f) Payment
CREATE TABLE Payment(
	Employee_ID int NOT NULL,
    Salary int NOT NULL,
  	typee varchar(255) NOT NULL,
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Emp_ID)
)
INSERT INTO Payment
VALUES  (1 , 50000, 'Manager'),
		(2 , 20000, 'Stall Manager'),
		(3 , 10000, 'Driver'),
	    (4 , 20000, 'Stall Manager'),
		(5 , 20000, 'Stall Manager'),
	    (6 , 10000, 'Driver'),
	    (7 , 10000, 'Driver'),
	    (8 , 20000, 'Stall Manager'),
	    (9 , 20000, 'Stall Manager'),
	    (10, 10000, 'Driver'),
	    (11, 20000, 'Stall Manager'),
	    (12, 10000, 'Driver'),
	    (13, 20000, 'Stall Manager'),
	    (14, 500, 'None');

-- (g) Stall's Furniture --
CREATE TABLE Stall_Furniture(
	Stall_ID int NOT NULL,
	Furniture_ID int NOT NULL,
	Lights varchar(1) NOT NULL,
	Colors varchar(1) NOT NULL,
	Banners varchar(1) NOT NULL,
	Cleaning varchar(1) NOT NULL,
	Chairs varchar(1) NOT NULL,
	Tabless varchar(1) NOT NULL,
	Spoons varchar(1) NOT NULL,
	Plates varchar(1) NOT NULL,
	Bowls varchar(1) NOT NULL,
	Glass varchar(1) NOT NULL,
	FOREIGN KEY (Stall_ID) REFERENCES Stalls(Stall_ID),
	FOREIGN KEY (Furniture_ID) REFERENCES Furniture(Furniture_ID)
)
INSERT INTO Stall_Furniture
VALUES  (1,3,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
		(2,6,'Y','N','N','Y','Y','Y','Y','N','Y','N'),
		(3,2,'N','N','N','Y','Y','Y','N','Y','Y','N'),
		(4,7,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
		(5,1,'Y','N','N','Y','Y','Y','Y','N','Y','N'),
		(6,4,'N','N','N','Y','Y','Y','N','Y','Y','N'),
		(7,5,'Y','N','N','Y','Y','Y','Y','N','Y','N');
-- (h) Managing --
CREATE TABLE Managing(
	Stall_ID int NOT NULL,
	Employee_ID int NOT NULL,
	FOREIGN KEY (Stall_ID) REFERENCES Stalls(Stall_ID),
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Emp_ID)
)
INSERT INTO Managing
VALUES  (1,2),
		(2,13),
		(3,8),
		(4,5),
		(5,11),
		(6,9),
		(7,4);

-- (i) Drives --
CREATE TABLE Drives(
	Vehicle_ID int NOT NULL,
	Employee_ID int NOT NULL,
	FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
	FOREIGN KEY (Employee_ID) REFERENCES Employee(Emp_ID)
)
INSERT INTO Drives
VALUES  (1,7),
		(2,10),
		(3,3),
		(4,6),
		(5,12);
*/
-- To see all Tables --
SELECT * FROM Employee
SELECT * FROM Stalls
SELECT * FROM Stall_Location
SELECT * FROM Furniture
SELECT * FROM Warehouse
SELECT * FROM Vehicle
SELECT * FROM Payment
SELECT * FROM Stall_Furniture
SELECT * FROM Managing
SELECT * FROM Drives
/* Dropper Function in case deletion needed
DROP TABLE Employee
DROP TABLE Stalls
DROP TABLE Stall_Location
DROP TABLE Furniture
DROP TABLE Warehouse
DROP TABLE Vehicle
DROP TABLE Payment
DROP TABLE Stall_Furniture
DROP TABLE Managing
DROP TABLE Drives
*/

-- Queries --
-- 1) Displaying all Employee Names who have the health certificate and are stall managers 
SELECT First_name, Last_name 
FROM Employee
WHERE Health_Cert = 'True' and E_Type = 'Stall Manager'

-- 2) Display the ID and Liscenece plates of all delivery vehicles ordered by their fuel capacity in descending order
SELECT Vehicle_ID, LSC_plate 
FROM Vehicle
ORDER BY Fuel_Cap DESC

-- 3) Display 3 Employees who have the letter 'e' in their first name
SELECT TOP 3 CONCAT(First_name,' ',Last_name) AS Name
FROM Employee
WHERE First_name LIKE '%e%'

-- 4) Display the first names of all Employees who have salary under 15000
SELECT Employee.First_Name 
FROM Employee, Payment
WHERE Employee.Emp_ID = Payment.Employee_ID and Payment.Salary < 15000

-- 5) Display the ID and end timings of the stalls which start at 12:00PM, then Update those timings by fixing their end time to 7:00PM, and Display again
SELECT Stall_ID, End_Time 
FROM Stalls
WHERE Start_Time = '12:00 pm'

UPDATE Stalls SET End_Time = '7:00 pm' WHERE Start_Time = '12:00 pm';

SELECT Stall_ID, End_Time 
FROM Stalls
WHERE Start_Time = '12:00 pm'

-- 6) Display the names and ids of drivers and vehicles who hav drive BIKES for Delivery
SELECT Employee.Emp_ID, CONCAT(Employee.First_name,' ',Employee.Last_name) AS Name, Vehicle.typee
FROM Employee, Vehicle, Drives
WHERE Vehicle.typee = 'Bike' and Vehicle.Vehicle_ID = Drives.Vehicle_ID and Employee.Emp_ID = Drives.Employee_ID

-- 7) Display furniture information of the stalls which end at 7:00pm
SELECT * FROM Stall_Furniture
INNER JOIN Stalls
ON Stalls.Stall_ID = Stall_Furniture.Stall_ID
WHERE Stalls.End_Time = '7:00 pm'

-- 8) Display Average Salary of the employees and the name of the employee with highest salary
SELECT AVG(Payment.Salary) 
AS 'Average Salary'
FROM Payment

SELECT CONCAT(Employee.First_name,' ',Employee.Last_name)
AS 'Highest Salary' 
FROM Employee, Payment
WHERE Payment.Salary > 20001 and Payment.Employee_ID = Employee.Emp_ID

-- 9) Select Distinct furniture selection where there are lights available
SELECT DISTINCT Furniture.Banners, Furniture.Banners, Furniture.Chairs, Furniture.Cleaning, Furniture.Colors, Furniture.Glass, Furniture.Lights, Furniture.Plates, Furniture.Spoons, Furniture.Tabless
FROM Stall_Furniture, Furniture
WHERE Stall_Furniture.Furniture_ID = Stall_Furniture.Furniture_ID and Stall_Furniture.Lights = 'Y'
GROUP BY Stall_Furniture.Furniture_ID
ORDER BY Stall_Furniture.Stall_ID DESC;

-- 10) Create View and Make "Omer Sajid" the manager of the Gol-Gappay Management Stall
GO
CREATE VIEW [Table] AS
SELECT * FROM Employee;
GO
SELECT * FROM [Table];

UPDATE [Table]
set First_Name = 'Omer', Last_name = 'Sajid'
where E_type = 'Manager';

-- TRANSACTIONS --
-- First Transaction
BEGIN TRANSACTION;
UPDATE Payment SET Salary = Salary + 5000 WHERE Employee_ID = 1;
PRINT'First'
SELECT TOP 1 CONCAT(Employee.First_name,' ',Employee.Last_name) AS Name, Payment.Salary FROM Employee, Payment;
UPDATE Payment SET Salary = Salary - 5000 WHERE Employee_ID = 2;
ROLLBACK;
PRINT'Second'
SELECT TOP 1 CONCAT(Employee.First_name,' ',Employee.Last_name) AS Name, Payment.Salary FROM Employee, Payment;
BEGIN TRANSACTION;
UPDATE Payment SET Salary = Salary + 5000 WHERE Employee_ID = 1;
SAVE TRANSACTION sp1;
UPDATE Payment SET Salary = Salary - 5000 WHERE Employee_ID = 2;
ROLLBACK TRANSACTION sp1;
PRINT'Third'
SELECT TOP 1 CONCAT(Employee.First_name,' ',Employee.Last_name) AS Name, Payment.Salary FROM Employee, Payment;
COMMIT;

-- Second Transaction
BEGIN TRANSACTION;
IF (SELECT Salary FROM Payment WHERE Employee_ID = 1) < 50000
  ROLLBACK;
  SELECT 'Not Enough Balance!' AS 'Error!';
UPDATE Payment SET Salary = Salary - 50000 WHERE Employee_ID = 1;
COMMIT;
transfer: