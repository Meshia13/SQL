--Carmeshia Lazzana

create database lawncare
go 

use lawncare

---------------------------------------------------------
----------TABLE CREATIONS--------------------------------
---------------------------------------------------------


create table People (
	PeopleID int NOT NULL,
	FirstName char(15) NOT NULL,
	LastName char(15) NOT NULL,
	Address char(25) NOT NULL,
	City char(30) NOT NULL,
	State char(2) NOT NULL,
	Zip char(10) NULL,
	Phone char(10) NULL,
	Email char(30) NULL
	constraint PeopleID_PK primary key (PeopleID));


create table Employee (
	PeopleID int NOT NULL,
	CellPhone char(10) NULL,
	DOB date NOT NULL,
	SSN int NOT NULL,
	Role char(15) NOT NULL,
	Salary decimal(6,2) NOT NULL,
	StartDate date NOT NULL,
	EndDate date NULL
	constraint Employee_PeopleID_PK primary key(PeopleID),
	constraint Employee_PeopleID_FK foreign key(PeopleID) references People(PeopleID),
	constraint SSN unique(SSN));

Create table Customer (
	PeopleID int NOT NULL,
	CustSince date NOT NULL
	constraint Customer_PeopleID_PK primary key(PeopleID),
	constraint Customer_PeopleID_FK foreign key(PeopleID) references People(PeopleID));


Create table Employee_Customer (
	EmployeeID int NOT NULL,
	CustomerID int NOT NULL
	constraint Employee_CustomerID_PK primary key(EmployeeID, CustomerID),
	constraint EmployeeID_FK foreign key(EmployeeID) references People(PeopleID),
	constraint CustomerID_FK foreign key(CustomerID) references People(PeopleID));


Create table Service (
	ServiceID int NOT NULL,
	Name char(25) NOT NULL,
	Descrip char(30) NULL,
	PricePerSqFT decimal(6,2) NOT NULL
	constraint ServiceID_PK primary key(ServiceID));

Create table OrderDetail (
	OrderID int NOT NULL,
	EmployeeID int NOT NULL,
	CustomerID int NOT NULL,
	OrderDate date NOT NULL
	constraint OrderID_PK primary key(OrderID),
	constraint OrderEmployeeID_FK foreign key(EmployeeID) references People(PeopleID),
	constraint OrderCustomerID_FK foreign key(CustomerID) references People(PeopleID));


Create table Service_Order (
	OrderID int NOT NULL,
	ServiceID int NOT NULL,
	EmployeeID int NOT NULL,
	StartDate date NOT NULL,
	StartTime time NOT NULL,
	EndDate date NOT NULL,
	EndTime time NOT NULL,
	TotalPrice decimal(6,2) NOT NULL
	constraint Service_Order_PK primary key(OrderID, ServiceID),
	constraint SerOrOrderID_FK foreign key(OrderID) references OrderDetail(OrderID),
	constraint SerOrServiceID_FK foreign key(ServiceID) references Service(ServiceID),
	constraint SerOrEmployeeID_FK foreign key(EmployeeID) references People(PeopleID));


Create table Supplier (
	SupplierID int NOT NULL,
	Name char(30) NOT NULL,
	Phone char(10) NOT NULL,
	Email char(30) NULL
	constraint SupplierID_PK primary key(SupplierID));

Create table Supply (
	SupplyID int NOT NULL,
	Name char(30) NOT NULL,
	RetailPrice decimal(6,2) NOT NULL,
	WholeSalePrice decimal(6,2) NOT NULL,
	SupplierID int NOT NULL 
	constraint SupplyID_PK primary key(SupplyID),
	constraint SupSupplierID_FK foreign key(SupplierID) references Supplier(SupplierID));

Create table Supply_Order (
	SupplyID int NOT NULL,
	OrderID int NOT NULL
	constraint Supply_Order_PK primary key(SupplyID, OrderID),
	constraint SOSupplyID_FK foreign key(SupplyID) references Supply(SupplyID),
	constraint SOOrderID_FK foreign key(OrderID) references OrderDetail(OrderID));

	
Create table Equipment (
	EquipmentID int NOT NULL,
	Name char(30) NOT NULL,
	PurchaseDate date NOT NULL,
	ServicedDate date NULL,
	Warrenty int NOT NULL
	constraint Equipment_PK primary key(EquipmentID));

Create table Equipment_Order (
	EquipmentID int NOT NULL,
	OrderID int NOT NULL,
	DateUsed date NULL
	constraint Equipment_Order_PK primary key(EquipmentID, OrderID),
	constraint EqOrEquipmentID_FK foreign key(EquipmentID) references Equipment(EquipmentID),
	constraint eqOrOrderID_FK foreign key(OrderID) references OrderDetail(OrderID));


Create table Inventory (
	InventoryID int NOT NULL,
	SupplyID int NOT NULL,
	InStock int NOT NULL,
	ReorderNum int NULL
	constraint InventoryID_PK primary key(InventoryID)
	constraint InvenSupplyID_FK foreign key(SupplyID) references Supply(SupplyID));

-----------------------------------------------------------------------------------------
----------------------INSERTING DATA-----------------------------------------------------
-----------------------------------------------------------------------------------------


INSERT INTO PEOPLE
  (PeopleId, FirstName, LastName, Address, City, state, Zip, Phone, Email)
 VALUES
  (1001,'Dill', 'Ann', '2658 Westchester', 'Roseville','MI', '48752', '5864789856','dillinger@comcast.net'),
  (1002,'Quigl','Mary','6921 King','Macomb','MI', '48138','5865597777', 'QuigM@yahoo.com'),
  (1003,'Rope','Andy','86 Chu Ave','Macomb','MI', '48138','5865598764', 'RopA@gmail.com'),
  (1004,'Samuels','Martin','34 Maiden Lane','Warren','MI','48157','5865559867', 'SamTheMan@gmailcom'),
  (1005,'Timothy','Althea','210 West 101st','Westland','MI','48056','5865557654', 'Atim@comcast.net'),
  (1006,'Turner','Theodore','254 Bleeker','Clinton Twp.','MI','48153','5865559876', 'Turner@gmail.com'),
  (1007,'Barney','Judy','518 West 120th','Clinton Twp.','MI','48151','5865553872', null),
  (1008,'Tanner','Warren','56 10th Avenue','Warren','MI','48657','5865551873', 'WarrenT@att.net'),
  (1009,'Scott','Bob','100 East 87th','Warren','MI','48765','5865551298', 'Scottie@comcast.net'),
  (1010,'Menchu','Roberta','Boulevard de Waterloo 41','Macomb', 'MI', '48138','5865042228', null),
  (1011,'Lancer', 'Jack', '48795 Champagne', 'Macomb', 'MI', '48795', '5866984258', 'ljach@gmail.com'),
  (1012,'Jones', 'Patricia','34 Sixth Ave','Clinton Twp.', 'MI','48150','5865559876', 'PattyCake @gmail.com'), 
  (1013,'Griffen','Jackie','Box 86', 'Warren', 'MI', '11368', '5865558329', 'Grifyndor@yahoo.com'),
  (1014,'Gregory', 'Jeff', '478 E. Russel', 'Sterling Heights', 'MI', '48204', '5864781245', 'Jgreg@yahoo.com'), 
  (1015,'Lefbowitz','Michael','1438 E 100th St', 'Warren', 'MI', '48257', '5865559847', 'MLeaf@comcast.net'),
  (1016,'Axch','Ben','144-70 41st Ave. #4T', 'Warren', 'MI', '11355', '5865554763', null),
  (1017,'Cook','Jason','320 John St', 'Warren', 'MI', '07029', '5865553893', null),
  (1018,'Griffen','Thomas','Box 86', 'Warren', 'MI', '11368', '5865558329', 'Griffie@comcast.net'),
  (1019,'Kingston','Jason','100 East 87th','Warren', 'MI', '48765','5865551298', 'TheKing@yahoo.com'),
  (1020,'Blake', 'Jacob', '518 West 120th','Macomb', 'MI', '48759','5865553987', 'BlackJac@gmail.com')
  ;


INSERT INTO Employee
  (PeopleId, CellPhone, DOB, SSN, Role, Salary, StartDate, EndDate)
 VALUES
  (1011, '5866984258', '02-05-1994', '445859874', 'Manager', '900.00', '01-02-2016', null),
  (1012, '5865559876', '02-06-1994', '445859174', 'Service Manager', '800.00', '01-02-2017', null),
  (1013, '5865558329', '01-06-1994', '445859274', 'Accountant', '7000.00', '01-05-2016', '01-02-2018'),
  (1014, '5864781245', '02-05-1999', '445859374', 'Receptionist', '600.00', '01-07-2016', '01-02-2000'),
  (1015, '5865559847', '02-05-1996', '445859474', 'clerk', '450.00', '02-02-2016', '01-02-2001'),
  (1016, '5865554763', '02-05-2000', '445859574', 'Lawn Mower', '350.00', '05-02-2016', null),
  (1017, '5865553893', '02-05-1995', '445859674', 'Lawn worker', '470.00', '09-02-2016', '01-02-2019'),
  (1018, '5865558329', '02-05-2001', '445859774', 'Gardener', '400.00', '01-08-2016', null),
  (1019, '5865551298', '02-05-2002', '445859974', 'Mower', '510.00', '01-02-2000', null),
  (1020, '5865553987', '05-10-2000', '446225825', 'Clerk', '450.00','04-07-2020', null)
  ;
    

insert into Customer
	(PeopleID, CustSince)
values
	(1001, '06-22-2010'),
	(1002, '05-24-2012'),
	(1003, '12-10-2011'),
	(1004, '10-15-2010'),
	(1005, '11-04-2011'),
	(1006, '01-25-2011'),
	(1007, '02-10-2010'),
	(1008, '05-05-2011'),
	(1009, '01-15-2010'),
	(1010, '05-01-2013')
;


INSERT INTO Employee_Customer
     (EmployeeID, CustomerID)

	 Values
	 (1011, 1001),
	 (1012, 1002),
	 (1013, 1003),
	 (1014, 1004),
	 (1015, 1005),
	 (1016, 1006),
	 (1017, 1007),
	 (1018, 1008),
	 (1019, 1009),
	 (1020, 1010)
	 ;


INSERT INTO Service(ServiceID, Name, Descrip, PricePerSqFT)
VALUES(10001, 'Snow Removal', null, '5.00'),
(10002, 'Lawn Treatment', null, '3.75'),
(10003, 'Salting Pavement', null, '2.00'),
(10004, 'Shrub Removal', null, '2.75'),
(10005, 'Bush Removal', null, '2.75'),
(10006, 'Lawn Mowing', null, '3.75'),
(10007, 'Tree Trimming', null, '3.00'),
(10008, 'Aeration', null, '5.00'),
(10009, 'Fertilization', null, '3.75'),
(10010, 'Insect Control', 'Removes nests in bushes', '5.00'),
(10011, 'Bush Trimming', 'shape bushes on property', '3.00'),
(10012, 'Landscaping', null, '30.00'),
(10013, 'Root Fertilization', null, '5.00'),
(10014, 'Weed Control', 'Removes weeds', '5.00')

INSERT INTO OrderDetail(OrderID, EmployeeID, CustomerID, OrderDate)
VALUES(3000, 1014, 1001, '04-13-2017'),
(3001, 1011, 1001, '04-13-2017'),
(3002, 1012, 1003, '07-23-2020'),
(3003, 1012, 1003, '07-23-2020'),
(3004, 1015, 1007, '04-13-2017'),
(3005, 1020, 1008, '04-13-2017'),
(3006, 1014, 1010, '02-06-2019'),
(3007, 1015, 1010, '10-23-2019'),
(3008, 1015, 1005, '11-28-2020'),
(3009, 1011, 1006, '03-08-2021'),
(3010, 1012, 1009, '05-13-2019'),
(3011, 1014, 1009, '05-13-2019')


INSERT INTO Service_Order(OrderID, ServiceID, EmployeeID, StartDate,StartTime, EndDate, EndTime, TotalPrice)
VALUES(3000, 10010, 1017, '04-17-2017', '08:05:00', '04-17-2017', '09:25:00', '75.00'), 
(3001, 10012, 1017, '06-17-2020', '09:30:00', '06-19-2020', '13:25:00', '4000.00'), 
(3002, 10007, 1018, '07-23-2020', '08:00:00', '07-23-2020', '15:25:00', '85.00'), 
(3003, 10003, 1019, '01-17-2021', '09:25:00', '04-17-2017', '11:00:00', '50.00'), 
(3004, 10001, 1019, '01-17-2021', '08:00:00', '01-17-2021', '09:25:00', '120.00'), 
(3005, 10014, 1018, '06-27-2020', '10:00:00', '06-27-2020', '12:25:00', '80.00'), 
(3006, 10004, 1018, '06-27-2020', '12:25:00', '06-27-2020', '14:25:00', '75.00'), 
(3007, 10011, 1018, '07-08-2019', '09:35:00', '07-08-2019', '10:50:00', '55.00'), 
(3008, 10006, 1016, '05-23-2020', '10:00:00', '05-23-2020', '12:25:00', '250.00'), 
(3009, 10006, 1016, '06-26-2020', '09:30:00', '06-26-2020', '12:00:00', '300.00'), 
(3010, 10013, 1016, '06-17-2020', '08:05:00', '06-17-2020', '09:25:00', '65.00'), 
(3011, 10009, 1017, '07-25-2020', '11:00:00', '07-25-2020', '14:25:00', '125.00') 


INSERT INTO Supplier(SupplierID, Name, Phone, Email)
VALUES(2000, 'Brian Rowe', '5865551212', 'rowebrian@clawn.com'),
(2001, 'Brenda Klawsom', '2487765454', 'brendak@snowequip.com')


INSERT INTO Supply(SupplyID, Name, RetailPrice, WholeSalePrice, SupplierID)
VALUES(1000, 'Salt', '9.97', '5.99', 2001),
(1001, 'Fertilizer', '35.99', '20.99', 2000),
(1002, 'Weed Killer', '27.00', '18.75', 2000),
(1003, 'Grass Seed', '32.99', '19.00', 2000),
(1004, 'Lawn Food', '17.98', '10.50', 2000),
(1005, 'Lawn Disease Control', '19.47', '9.98', 2000),
(1006, 'Soil', '8.98', '5.00', 2000),
(1007, 'Sod', '499.00', '299.00', 2000),
(1008, 'Artificial Grass', '655.98', '431.50', 2000),
(1009, 'Liquid De-Icer', '48.45', '25.00', 2001)


INSERT INTO Supply_Order (SupplyID, OrderID)
VALUES (1000, 3003),
(1001, 3011),
(1002, 3005),
(1003, 3001),
(1004, 3001),
(1005, 3001),
(1006, 3010),
(1007, 3010),
(1008, 3001),
(1009,3003)


INSERT INTO Equipment(EquipmentID, Name, PurchaseDate, ServicedDate,Warrenty)
VALUES(1000, 'Lawn Mower', '02-12-2016', '10-15-2021', 5),
(1001, 'Leaf Blower', '03-15-2017', '10-15-2021', 10),
(1002, 'Rake', '05-13-2020', null, 3),
(1003, 'Hedge Trimmer', '07-15-2020', null, 10),
(1004, 'Chainsaw', '12-05-2017', '03-15-2021', 5),
(1005, 'Snow Blower', '12-12-2016', '04-15-2021', 5),
(1006, 'Riding Mower', '10-12-2019', '04-15-2021', 5),
(1007, 'Snow Plow', '06-17-2019', '04-15-2021', 10),
(1008, 'Snow Pusher', '06-04-2017', '04-15-2021', 10),
(1009, 'Edger', '11-27-2019', '10-15-2020', 5),
(1010, 'Generator', '05-18-2017', '10-15-2020',10)


INSERT INTO Equipment_Order (EquipmentID, OrderID, DateUsed)
VALUES (1007, 3003, '01-17-2021'),
(1008, 3003, '01-17-2021'),
(1005, 3003, '01-17-2021'),
(1000, 3008, '05-23-2020'),
(1004, 3002, '07-23-2020'),
(1004, 3006, '06-27-2020'),
(1004, 3007, '07-08-2019'),
(1003, 3007, '07-08-2019'),
(1003, 3002, '07-23-2020'),
(1010, 3003, '01-17-2021'),
(1002, 3008, '05-23-2020'),
(1006, 3008, '05-23-2020'),
(1001, 3001, '06-17-2020'),
(1009, 3001, '06-17-2020'),
(1010, 3009, '06-26-2020')


INSERT INTO Inventory (InventoryID, SupplyID, InStock, ReorderNum)
VALUES(2000, 1000, 21, 4),
(2001, 1001, 30, 10),
(2002, 1002, 30, 10),
(2003, 1003, 80, 0),
(2004, 1004, 60, 10),
(2005, 1005, 40, 10),
(2006, 1006, 60, 0),
(2007, 1007, 20, 5),
(2008, 1008, 15, 5),
(2009, 1009, 8, 0);

-----------------------------------------------------------------------------------------
-----------------------------------QUERIES-----------------------------------------------
-----------------------------------------------------------------------------------------


select FirstName,
	LastName,
	Zip
from People where "zip"= 48752;

select OrderID,
	EmployeeID,
	Role
from OrderDetail 
c join Employee o on C.EmployeeID = o.PeopleID;

select EquipmentID
from Equipment
union 
select EquipmentID
from Equipment_Order;

select a.CustSince,
 b.FirstName,
 b.lastName
from CUSTOMER a, People b
Where a.PeopleID = b.PeopleID;

select Name,
DateUsed
from Equipment_Order
FULL OUTER JOIN Equipment
on Equipment_Order.EquipmentID = Equipment.EquipmentID;

Select zip,
FirstName,
LastName
From People 
Group by Zip, FirstName, LastName;

Select zip,
FirstName,
LastName
From People 
Group by zip, FirstName, LastName
Having zip > 48200;



-- Demonstrate multi-table join
select "FirstName" + "LastName" as [Customer]
	, Name as [Service Name]
	, Descrip as [Description]
	, cast(TotalPrice/ PricePerSqFT as decimal(10,2)) as [Sq. Footage]
	, PricePerSqFT as [$ per sq. ft.]
	, TotalPrice as [Total Price]
from Service srv join Service_Order srvo
	on srvo.ServiceID = srv.ServiceID
	join OrderDetail od
	on od.OrderID = srvo.OrderID
	join People p
	on p.PeopleID = od.CustomerID;




--multi-table joins and set operation
-- displays the orders that used equipment and the equipment name
select od.OrderID as [Order #]
	, eq.Name as [Equipment Used]
from OrderDetail od join Equipment_Order eqo
	on od.OrderID = eqo.OrderID
	join Equipment eq
	on eq.EquipmentID = eqo.EquipmentID
intersect
select OrderID
	, Name
from Equipment_Order eqo join Equipment eq
	on eqo.EquipmentID = eq.EquipmentID;


----•	A subquery an the Where clause
---- First, find all the orders that used equipment.  Then, display what service was provided for that order.
select OrderID as [Order #]
	, srv.Name as [Service Provided]
from Service_Order srvo join Service srv
	on srvo.ServiceID = srv.ServiceID
where orderid in
	(select OrderID
	from OrderDetail
	intersect
	select OrderID
	from Equipment_Order);