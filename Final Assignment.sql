
--creating tables 
create table autocustomer(
customer_id int identity(1,1) primary key ,
name varchar(50),
email varchar(100),
phone varchar(50),
address varchar(150)
);

create table autorooms(
roomID int identity(1,1) primary key,
roomType varchar(20) check(roomType in ('Delux','Non-Delux')),
pricepernight int,
status varchar(20) check(status in ('active','In-active'))
);

create table autobooking(
bookingID int identity(1,1) primary key,
customer_id int,
roomID int,
checkINDATE date,
checkoutdate date,
totalamount int 
foreign key (customer_id) references autocustomer(customer_id),
foreign key (roomID) references autorooms(roomID)
);

create table autopayment(
paymentID int identity(1,1) primary key,
bookingID int ,
paymentDate date,
Amount int ,
paymentMethod varchar(50) check(paymentMethod in ('UPI','cash','Cards','others')),
foreign key (bookingID) references autobooking(bookingID) on delete cascade
);

create table autopayments(
paymentID int identity(1,1) primary key,
bookingID int ,
paymentDate date,
Amount int ,
paymentMethod varchar(50) check(paymentMethod in ('UPI','cash','Cards','others')),
foreign key (bookingID) references autobooking(bookingID) on delete cascade
);


create table autoemployees(
employeeID int identity(1,1) primary key ,
name varchar(150),
position varchar(50) check(position in ('Manager','Chief','Housekeeper','Waiter','Receptionist','Security')),
salary int,
hireDate date,
managerId int null,
foreign key (managerID) references AutoEmployees(employeeID)
);

create table autoservice(
service_id int primary key,
service_name varchar(60),
service_price int
);

--tables created --



INSERT INTO autocustomer (name, email, phone, address) VALUES
('Rahul Sharma', 'rahul.sharma@example.com', '9123456780', 'Mumbai'),
('Sneha Singh', 'sneha.singh@example.com', '9876543210', 'Delhi'),
('Amit Mehta', 'amit.mehta@example.com', '9812345670', 'Pune'),
('Priya Kumar', 'priya.kumar@example.com', '9123678540', 'Bengaluru'),
('Rajesh Desai', 'rajesh.desai@example.com', '9945123789', 'Chennai'),
('Anjali Nair', 'anjali.nair@example.com', '9012345678', 'Kolkata'),
('Nisha Joshi', 'nisha.joshi@example.com', '9987654321', 'Hyderabad'),
('Vikas Patel', 'vikas.patel@example.com', '9123456712', 'Ahmedabad'),
('Manoj Gupta', 'manoj.gupta@example.com', '9867543210', 'Jaipur'),
('Divya Rao', 'divya.rao@example.com', '9172345678', 'Surat');

INSERT INTO autorooms (roomType, pricepernight, status) VALUES
('Delux', 4000, 'active'),
('Non-Delux', 3000, 'active'),
('Delux', 4500, 'active'),
('Non-Delux', 3500, 'active'),
('Delux', 5000, 'In-active'),
('Non-Delux', 3200, 'active'),
('Delux', 3800, 'In-active'),
('Non-Delux', 3100, 'active'),
('Delux', 4700, 'active'),
('Non-Delux', 3400, 'active'),
('Delux', 2400, 'active');



INSERT INTO autobooking (customer_id, roomID, checkINDATE, checkoutdate, totalamount) VALUES
(1, 1, '2025-02-20', '2025-02-22', 8000),
(2, 2, '2025-02-18', '2025-02-20', 6000),
(3, 3, '2025-02-22', '2025-02-25', 13500),
(4, 4, '2025-02-19', '2025-02-21', 7000),
(5, 5, '2025-02-21', '2025-02-23', 9000),
(6, 6, '2025-02-20', '2025-02-22', 6400),
(7, 7, '2025-02-18', '2025-02-19', 3800),
(8, 8, '2025-02-23', '2025-02-25', 6200),
(9, 9, '2025-02-19', '2025-02-21', 9400),
(10, 10, '2025-02-20', '2025-02-22', 6800);


INSERT INTO autopayment (bookingID, paymentDate, Amount, paymentMethod) VALUES
(1, '2025-02-20', 8000, 'UPI'),
(2, '2025-02-18', 6000, 'cash'),
(3, '2025-02-22', 13500, 'Cards'),
(4, '2025-02-19', 7000, 'UPI'),
(5, '2025-02-21', 9000, 'cash'),
(6, '2025-02-20', 6400, 'Cards'),
(7, '2025-02-18', 3800, 'UPI'),
(8, '2025-02-23', 6200, 'cash'),
(9, '2025-02-19', 9400, 'Cards'),
(10, '2025-02-20', 6800, 'UPI');


INSERT INTO autoemployees (name, position, salary, hireDate, managerId) VALUES
('Ashok Kumar', 'Manager', 50000, '2023-05-01', NULL),
('Bhavna Joshi', 'Chief', 40000, '2023-06-15', 1),
('Ravi Singh', 'Housekeeper', 20000, '2023-07-20', 2),
('Meera Nair', 'Waiter', 18000, '2023-08-10', 2),
('Pawan Gupta', 'Receptionist', 22000, '2023-09-05', 1),
('Neha Sharma', 'Security', 25000, '2023-10-12', 2),
('Rakesh Rao', 'Housekeeper', 20000, '2023-11-18', 2),
('Suman Patel', 'Waiter', 18000, '2023-12-22', 2),
('Rajesh Nair', 'Receptionist', 22000, '2024-01-15', 1),
('Pooja Desai', 'Security', 25000, '2024-02-10', 2);




---Quries using joins ---
---(Q1) Retrieve customer booking details---
select 
autocustomer.name,
autobooking.checkINDATE,
autobooking.totalamount,
autorooms.roomType
from autocustomer
inner join autobooking on autocustomer.customer_id = autobooking.customer_id
inner join autorooms on autobooking.roomID=autorooms.roomID;

---(Q2) list of employess with their managers ---
SELECT 
    e1.employeeID AS EmployeeID,
    e1.name AS EmployeeName,
    e2.employeeID AS ManagerID,
    e2.name AS ManagerName
FROM 
    autoemployees e1
LEFT JOIN 
    autoemployees e2 ON e1.managerId = e2.employeeID;

---(Q3)quries to find rooms that have never been booked using joins---
SELECT 
    e1.roomID,
    e1.roomType,
    e1.pricepernight,
    e1.status
FROM 
    autorooms as e1
LEFT JOIN 
    autobooking as e2 ON e1.roomID = e2.roomID
WHERE 
    e2.bookingID IS NULL;


--SubQuries --
---(Q1) queries for finding the customer that have multiple booking ---

SELECT 
    autocustomer.customer_id,
    autocustomer.name,
    COUNT(autobooking.bookingID) AS BookingCount
FROM 
    autocustomer
JOIN 
    autobooking ON autocustomer.customer_id = autobooking.customer_id
GROUP BY 
    autocustomer.customer_id, autocustomer.name
HAVING 
    COUNT(autobooking.bookingID) > 1;

---(Q3)quries for finding the most expensive room booked---
SELECT 
    autobooking.roomID,
    autorooms.roomType,
    autorooms.pricepernight,
    autobooking.bookingID,
    autobooking.customer_id,
    autobooking.checkINDATE,
    autobooking.checkoutdate,
    autobooking.totalamount
FROM 
    autobooking
JOIN 
    autorooms ON autobooking.roomID = autorooms.roomID
WHERE 
    autorooms.pricepernight = (SELECT MAX(pricepernight) FROM autorooms);




---Views---
---Q1.create a view named Activebookings showing currently booked rooms (customerName,RoomType,CheckInDate,DateOutDate).---

CREATE VIEW Activebookingggg AS
SELECT 
    autocustomer.name AS CustomerName,
    autorooms.roomType AS RoomType

FROM autobooking
inner JOIN autocustomer ON autobooking.customer_id = autocustomer.customer_id
inner JOIN autorooms ON autobooking.roomID = autorooms.roomID;


select * from Activebookingggg;


---Index---
---(Q1)create an index on roomtype in the room table to otimse room searches---
CREATE NONCLUSTERED INDEX IDX_RoomType ON autorooms (roomType);

---(Q2)create a composite index on checkindate,checkoutdatebin the bookingtable---
CREATE INDEX IDX_CheckInDate_CheckOutDate ON autobooking (checkINDATE, checkoutdate);


---stored procedure to get the total revenue generated in a given month---

CREATE PROCEDURE GetTotalRevenueByMonth
    @Year INT,
    @Month INT
AS
BEGIN
    -- Calculate the total revenue generated in the given month and year
    SELECT 
        SUM(Amount) AS TotalRevenue
    FROM 
        autopayment
    WHERE 
        YEAR(paymentDate) = @Year
        AND MONTH(paymentDate) = @Month;
END;
EXEC sp_CalculateMonthlyRevenue
    @Year = 2025,
    @Month =4;
Go


---function to calculate the total number of days a customer satyed---
CREATE FUNCTION CalculateTotalDaysStayed (
    @checkInDate DATE,
    @checkOutDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @totalDays INT;
    
    -- Calculate the total number of days stayed
    SET @totalDays = DATEDIFF(DAY, @checkInDate, @checkOutDate);
    
    RETURN @totalDays;
END;
----printing the function---
SELECT 
    customer_id,
    roomID,
    checkINDATE,
    checkoutdate,
    dbo.CalculateTotalDaysStayed(checkINDATE, checkoutdate) AS TotalDaysStayed
FROM 
    autobooking;




---triggers---
---implements a trigger to automatically update the rooms table status to "Available" when a booking is cancelled---
CREATE TRIGGER UpdateRoomStatusAfterCancellation
ON autobooking
AFTER DELETE
AS
BEGIN
    -- Declare variables to hold the roomID from the deleted booking
    DECLARE @roomID INT;

    -- Select the roomID from the deleted booking
    SELECT @roomID = deleted.roomID FROM deleted;

    -- Update the status of the room to 'Available'
    UPDATE autorooms
    SET status = 'Available'
    WHERE roomID = @roomID;
END;



---Full search_text---

create table AutoHotelBranch(
	BranchId int primary key,
	BranchName varchar(50),
	LocationDecription varchar(100)
);
insert into AutoHotelBranch (BranchId, BranchName, LocationDecription) values
(1, 'Mumbai Central', 'Near Central Station ocean view, Mumbai'),
(2, 'Pune West', 'Next to Pune University, Pune'),
(3, 'Kohapur', 'luxury Mahalakshi Temple, Rankala Lake, Mountans,Kohapur'),
(4, 'Chennai Beach', 'Close to Marina Beach, Chennai'),
(5, 'Navi Mumbai', 'Near Flemingo point Beach, Navi Mumbai');



exec sp_help AutoHotelBranch;

create fulltext index on AutoHotelBranch(LocationDecription)
key index PK__AutoHote__A1682FC55746155B;

select * from AutoHotelBranch
where contains(LocationDecription, 'Beach');
