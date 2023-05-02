CREATE TABLE serviceStation1 (
  srNo INT PRIMARY KEY,
  serviceType VARCHAR(50)
);

INSERT INTO serviceStation1 (srNo, serviceType) VALUES
(1, 'Oil Change'),
(2, 'Brake Service'),
(3, 'Tire Rotation'),
(4, 'Engine service'),
(5, 'Transmission Service'),
(6, 'Wheel Alignment'),
(7, 'Air Conditioning Service'),
(8, 'Battery Service'),
(9, 'Coolant Flush'),
(10, 'Fuel System Cleaning');
drop table serviceStation1;
select * from serviceStation1;

CREATE TABLE customerRecords1 (
  srNo INT PRIMARY KEY,
  carBrand VARCHAR(50),
  customerName VARCHAR(50),
  customerNumber VARCHAR(20),
  carIssue VARCHAR(100),
  receivedDate DATE,
  returnedDate DATE,
  maintenanceDays INT,
  mechanicName VARCHAR(50),
  mechanicPhone VARCHAR(20),
  cost DECIMAL(10,2),
  serviceTypeId INT,
  FOREIGN KEY (serviceTypeId) REFERENCES serviceStation(srNo)
);

INSERT INTO customerRecords1 (srNo, carBrand, customerName, customerNumber, carIssue, receivedDate, returnedDate, maintenanceDays, mechanicName, mechanicPhone, cost, serviceTypeId) VALUES
(1, 'Honda', 'ram', '1234567890', 'Oil change and brake service', '2023-01-01', '2023-01-03', 2, 'Mike', '9876543210', 5000.00, 1),
(2, 'Toyota', 'raj', '0987654321', 'Engine check and tune-up', '2023-01-07', '2023-01-09', 2, 'Steve', '0123456789', 7500.00, 4),
(3, 'Nissan', 'Shiva', '3456789012', 'Battery not charging', '2023-01-14', '2023-01-15', 1, 'Mike', '9876543210', 2500.00, 8),
(4, 'Chevrolet', 'abhi', '2345678901', 'Transmission slipping', '2023-01-22', '2023-01-25', 3, 'Tom', '7890123456', 9500.00, 5),
(5, 'Ford', 'ashok', '4567890123', 'Tire rotation and wheel alignment', '2023-01-28', '2023-01-29', 1, 'Steve', '0123456789', 3500.00, 3),
(6, 'Hyundai', 'sagar', '5678901234', 'Coolant leak', '2023-01-30', '2023-01-31', 1, 'Tom', '7890123456', 3000.00, 9),
(7, 'Honda', 'sunil', '6789012345', 'Fuel system cleaning', '2023-02-05', '2023-02-08', 3, 'Mike', '9876543210', 8000.00, 10);

drop table customerRecords1;
select * from customerRecords1;

-- count all records
SELECT count(*) as  total 
FROM customerRecords1; 
-- find total cost in each month & for 3 months
SELECT SUM(cost) as totalAmount
from customerRecords1
where receivedDate between '2023-04-01' and '2023-04-30';

-- find average cost in each month & for 3 months
SELECT monthname(receivedDate) as month ,AVG(cost) as AverageAmount
from customerRecords1
where receivedDate between '2023-04-01' and '2023-04-30';

SELECT monthname(receivedDate) as month ,AVG(cost) as AverageAmount
from customerRecords1
where receivedDate between '2023-05-01' and '2023-05-30';

--  find Heighest & cost from 3 months 
SELECT monthname(receivedDate) as month,MAX(cost) as highest
from customerRecords1;
-- --  find lowest & cost from 3 months 
SELECT monthname(receivedDate) as month,MIN(cost) as lowest
from customerRecords1;

-- find customers whose name starts with a
SELECT * FROM customerRecords1
WHERE customerName LIKE "a%";

--  join both tables

select customerRecords1.srNo,
customerRecords1.carBrand,
customerRecords1.customerName,
customerRecords1.customerNumber ,
customerRecords1.carIssue,
customerRecords1.receivedDate ,
customerRecords1.returnedDate ,
customerRecords1.maintenanceDays ,
customerRecords1.mechanicName,
customerRecords1.mechanicPhone ,
customerRecords1.cost ,
serviceStation1.serviceType
from customerRecords1
join serviceStation1
on customerRecords1.serviceTypeId=serviceStation1.sNo;

select customerRecords1.* ,
serviceStation1.serviceType
from customerRecords1
join serviceStation1
on customerRecords1.serviceTypeId=serviceStation1.sNo;

-- fetch top 1 record from customerRecords & increase its cost by 1000rs
  update customerRecords1 set cost=cost+1000 where srNo=5;
  
  select * from customerRecords1;