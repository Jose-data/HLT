-- Solution to Home Learning Tasks 

-- Create the Database XYZ Hotels
CREATE DATABASE XYZHotel;

USE XYZHotel

-- Create the first table containing the Guest names and personal information

CREATE TABLE Guests ( GuestID INT IDENTITY (1000,1) PRIMARY KEY,
			FirstName VARCHAR (25) NOT NULL,
			LastName VARCHAR (25) NOT NULL,
			Address VARCHAR (50) NOT NULL,
			City VARCHAR (50) NOT NULL,
			Region VARCHAR (50) NOT NULL,
			PostCode VARCHAR (15) NOT NULL,
			Country VARCHAR (30) NOT NULL
);

-- To View the first table use the SELECT  FROM Query
SELECT * FROM Guests;

-- To add items into the table 1, use the INSERT INTO Query
INSERT INTO Guests ( FirstName, LastName, Address, City, Region, PostCode, Country)
			VALUES ( 'Joseph', 'Malachy', '69 Swan Lane', 'Coventry', 'West Midlands', 'CV2 4GX', 'United Kingdom'),
					('Angel', 'Omoregbee', '24 Athol Road', 'Coventry', 'West Midlands', 'CV2 2PX', 'United Kingdom'),
					('Benjamin', 'Marcattan', '19 Oxford Street', 'Oxford', 'South East', 'OX13 4FX', 'United Kingdom'),
					('Bennywise', 'Fekosuya', '120 Payne Lane', 'Coventry', 'West Midlands', 'CV2 4HJ', 'United Kingdom'),
					('Uche', 'Osuji', '9 Max Street', 'Brighton', 'East Sussex', 'BN3 9PH', 'United Kingdom'),
					('Chiazom', 'Osuji', '90 St Dunstans Hill', 'Sutton', 'London', 'SM3 5UD', 'United Kingdom'),
					('Ebere', 'Woroma', '12 Gosford Street', 'Coventry', 'West Midlands', 'CV3 9SF', 'United Kingdom'),
					('Jonathan', 'Rivera', '10 Bramble Street', 'Coventry', 'West Midlands', 'CV2 6NP', 'United Kingdom'),
					('Viktoria', 'Mihajlovic', '67 Church-hill Road', 'Birmingham', 'West Midlands', 'B13 3SJ', 'United Kingdom'),
					('Daniel', 'Bastowe', '72 Cox street', 'Coventry', 'West Midlands', 'CV1 14FG', 'United Kingdom')
;

-- Create the second table containing the Room details and their check-in & check-out date
CREATE TABLE Rooms ( RoomID INT IDENTITY (10,1) PRIMARY KEY,
					RoomNumber CHAR (3) NOT NULL,
					BedType VARCHAR (15) NOT NULL,
					Rate SMALLMONEY NOT NULL,
					CheckInDate DATE NOT NULL,
					CheckOutDate DATE NOT NULL,
					GuestID INT NOT NULL
);

-- To add items into the table 2, use the INSERT INTO Query
INSERT INTO Rooms ( RoomNumber, BedType, Rate, CheckInDate, CheckOutDate, GuestID)
		VALUES ('100', 'King', 120, '2021-06-13', '2021-06-14', '1000'),
				('101', 'Two Double', 100, '2021-06-13', '2021-06-15', '1005'),
				('102', 'Queen', 120, '2021-06-16', '2021-06-20', '1003'),
				('103', 'King', 120, '2021-06-13', '2021-06-14', '1007'),
				('104', 'King', 120, '2021-06-13', '2021-06-16', '1006'),
				('200', 'Two Double', 90, '2021-07-01', '2021-07-03', '1002'),
				('201', 'King', 120, '2021-07-10', '2021-07-11', '1008'),
				('202', 'Queen', 120, '2021-07-13', '2021-07-14', '1009'),
				('203', 'King', 120, '2021-07-18', '2021-07-20', '1001')
;
-- To view table 2, Use the SELECT FROM Query
SELECT * FROM Rooms;

-- To Update a table, we use the UPDATE SET WHERE Query
SELECT * FROM Rooms;

UPDATE Rooms
SET CheckInDate = '2021-07-17'
WHERE RoomID = '18'
;

-- To delete a particular item from a table we use the DELETE FROM WHERE Query

DELETE FROM Guests
WHERE GuestID = 1003
;

-- To Join tables, we use the INNER, LEFT, or RIGHT JOIN Query
SELECT Guests.FirstName, Guests.LastName,
		Rooms.CheckInDate, Rooms.CheckOutDate, Rooms.RoomNumber, Rooms.Rate
FROM Guests LEFT JOIN Rooms ON Guests.GuestID = Rooms.GuestID;

SELECT Guests.FirstName, Guests.LastName,
		Rooms.CheckInDate, Rooms.CheckOutDate, Rooms.RoomNumber, Rooms.Rate
FROM Guests RIGHT JOIN Rooms ON Guests.GuestID = Rooms.GuestID;

SELECT Guests.FirstName, Guests.LastName,
		Rooms.CheckInDate, Rooms.CheckOutDate, Rooms.RoomNumber, Rooms.Rate
FROM Guests INNER JOIN Rooms ON Guests.GuestID = Rooms.GuestID;


-- To run a simple Query containing one field or Column, We use the SELECT FROM Query

SELECT Rooms.RoomNumber
FROM Rooms;

-- To run a complex Query containing more than 2 fields or Columns, We use the SELECT FROM Query

SELECT GuestID, Rooms.RoomNumber, Rooms.Rate
FROM Rooms;

-- To retrieve all the data in Ascending Order, we use the ORDER BY ASC Query
SELECT GuestID, FirstName, LastName, Region 
FROM dbo.Guests 
ORDER BY FirstName ASC;


-- To filter data using comparation operators, we use the WHERE ORDER BY Query
SELECT * FROM Rooms
WHERE BedType = 'King';

SELECT RoomNumber, GuestID
FROM Rooms
WHERE Rate >= 100 AND BedType = 'King';
