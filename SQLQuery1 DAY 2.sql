use JIBE_Main_Training
CREATE table Employeeshri(
Emp_no int,
Ename varchar(30)
)
select *
from employeeshri

insert into Employeeshri(Emp_no,Ename) 
values('3','Rafftar')
insert into Employeeshri(Emp_no,Ename) 
values('4','Paradox')
insert into Employeeshri(Emp_no,Ename) 
values('4','king')
insert into Employeeshri(Emp_no,Ename) 
values('5','Badshaa')
insert into Employeeshri(Emp_no,Ename) 
values('6','Honey singh')
insert into Employeeshri(Emp_no,Ename) 
values('7','Seedhe mauth')



select *
from employee

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Practise Question 1

create table Employee_day4(
Employee_Id int primary key,
name varchar(30),
Email varchar(50),
Dapartment varchar(20),
salary int ,
Joining_date date,
city varchar(30)
)
select *
from Employee_day4


INSERT INTO Employee_day4 (Employee_id, NAME, EMAIL, DAPARTMENT, SALARY, JOINING_DATE, CITY) 
VALUES 
('700', 'hAri', 'HAri@gmail.com', 'CSE', '100000', '2025-01-06', 'Mumbai'),
('1100', 'hAri', 'HAri@gmail.com', 'CSE', '50000', '2025-01-06', 'Mumbai'),
('200', 'Aarav', 'Aarav@gmail.com', 'ECE', '1150000', '2025-02-10', 'Pune'),
('300', 'Isha', 'Isha@gmail.com', 'ME', '11000', '2025-03-12', 'Pune'),
('400', 'Vihaan', 'Vihaan@gmail.com', 'CSE', '1200000', '2025-04-08', 'Bangalore'),
('500', 'Anaya', 'Anaya@gmail.com', 'IT', '1180000', '2025-05-15', 'Bangalore'),
('600', 'Rohit', 'Rohit@gmail.com', 'EEE', '30000', '2025-06-20', 'Pune');


truncate table Employee_day4;

select name,salary,city
from Employee_day4 
where salary < (select max(salary) from Employee_day4);

SELECT city, name, salary
FROM Employee_day4
WHERE salary IN(
    SELECT MAX(salary) 
    FROM Employee_day4 
    GROUP BY city
);


SELECT city, name, salary
FROM Employee_day4
WHERE (
    city = 'Mumbai' AND salary = (SELECT MAX(salary) FROM Employee_day4 WHERE city = 'Mumbai')
) OR (
    city = 'Pune' AND salary = (SELECT MAX(salary) FROM Employee_day4 WHERE city = 'Pune')
) OR (
    city = 'Bangalore' AND salary = (SELECT MAX(salary) FROM Employee_day4 WHERE city = 'Bangalore')
);




UPDATE Employee_ERP
SET phone_no = '1234567890'
WHERE employee_id = 5;

UPDATE Employee_ERP
SET phone_no = '2345678901'
WHERE Employee_id = 2;

UPDATE Employee_ERP
SET phone_no = '3456789012'
WHERE employee_id = 3;

UPDATE Employee_ERP
SET phone_no = '4567890123'
WHERE employee_id = 4;





alter table Employee_ERP
Add phone_no varchar;

truncate TABLE Employee_ERP;

CREATE TABLE Employee_ERPP (
    employee_id INT,
    name VARCHAR(50),
    phone_no VARCHAR(15)
);

INSERT INTO Employee_ERPP (employee_id, name, phone_no)
VALUES 
(1, 'John Doe', '123-456-7890'),
(1, 'John Doe', '123-456-7890'),
(1, 'John Doe', '123-456-7890'),
(1, 'John Doe', '123-456-7890'),
(1, 'John Doe', '123-456-7890');




ALTER TABLE Employee_ERPP
ADD id INT IDENTITY(1,1) PRIMARY KEY;








select *
from Employee_ERPP


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Practise Question 2

create table Orders_shrii(
order_id int primary key,
customer_name varchar(30),
product_name varchar(30),
quantity int,
price float,
order_date date 
)
INSERT INTO Orders_shrii (order_id, customer_name, product_name, quantity, price, order_date)
VALUES 
(1, 'Ravi Kumar', 'Basmati Rice', 5, 500.0, '2025-02-01'),
(2, 'Sita Verma', 'Darjeeling Tea', 2, 400.0, '2025-02-02'),
(3, 'Amit Joshi', 'Mango Pickle', 3, 150.0, '2025-02-03'),
(4, 'Priya Sharma', 'Paneer', 10, 800.0, '2025-02-04'),
(5, 'Rahul Patel', 'Atta', 20, 700.0, '2025-02-05'),
(6, 'Anita Singh', 'Ghee', 1, 300.0, '2025-02-06'),
(7, 'Rajesh Mehta', 'Spices', 5, 250.0, '2025-02-07'),
(8, 'Neha Gupta', 'Jaggery', 2, 100.0, '2025-02-08'),
(9, 'Vikram Rao', 'Coconut Oil', 4, 600.0, '2025-02-09'),
(10, 'Divya Iyer', 'Almonds', 1, 1000.0, '2025-02-10');


update Orders_shrii
set quantity =25
where customer_name='Ravi Kumar';


delete Orders_shrii

where customer_name='Ravi Kumar';

select *
from Orders_shrii




-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Practise Question 3

create table Lilavati_patients(
patientid int identity(1,1) primary key,
name varchar(30) ,
age int,
diseases varchar(20),
doctorassigned varchar(30)
)



INSERT INTO Lilavati_patients (name, age, diseases, doctorassigned)
VALUES 
('Amit Shah', 45, 'Diabetes', 'Dr. Mehta'),
('Sita Roy', 60, 'Hypertension', 'Dr. Gupta'),
('Rajesh Sharma', 55, 'Asthma', 'Dr. Singh'),
('Anjali Desai', 30, 'Migraine', 'Dr. Patel'),
('Vikram Rao', 50, 'Arthritis', 'Dr. Kapoor'),
('Neha Verma', 25, 'Allergy', 'Dr. Nair'),
('Ravi Kumar', 40, 'Heart Disease', 'Dr. Bose');


select *  from Lilavati_patients where age >50;

select *  from Lilavati_patients where doctorassigned ='Dr. Gupta'

select diseases ,count(*) As patient_count
from Lilavati_patients
where diseases ='Asthma'
group by diseases;





-------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Practise Question Q4

create table Bookingticket(
bookingid int primary key,
customername varchar(30),
seatsbooked int ,
totalprice int
)

INSERT INTO Bookingticket (bookingid, customername, seatsbooked, totalprice)
VALUES 
(1, 'Ravi Kumar', 2, 1000),
(2, 'Sita Verma', 4, 2000),
(3, 'Amit Joshi', 1, 500),
(4, 'Priya Sharma', 3, 1500),
(5, 'Rahul Patel', 2, 1000),
(6, 'Anita Singh', 5, 2500),
(7, 'Rajesh Mehta', 1, 500);

select * from Bookingticket

Begin transaction ;
save transaction Savepoint;
INSERT INTO Bookingticket (bookingid, customername, seatsbooked, totalprice)
VALUES 
(11, 'kshay Kumar', 2, 1000),
(10, 'ramam Verma', 4, 2000);


update Bookingticket
set seatsbooked=0
where bookingid=1;

rollback transaction Savepoint


 commit transaction 