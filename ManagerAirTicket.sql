﻿Create database ManagerTicket
use ManagerTicket

Create table Users
(
UserID varchar(20) not null primary key,
Email varchar(50),
PassWord varchar(20),
Name nvarchar(50),
Gender char (1),
Birthday date,
Phone varchar(20),
Address nvarchar(20),
Nationality nvarchar(20),
CCCD varchar(20),
Role varchar(20)
)

Create table Bill 
(
	Bill_ID varchar(20) not null,
	UserID varchar(20) not null,
	Date datetime, 
	CustomerName NVarchar(50),
	TotalAmount float
	constraint pk_tblBill primary key (Bill_ID , UserID),
	constraint fk_tblBill foreign key (UserID) references Users(UserID)
)

Create table Promotion
(
    Promotion_ID varchar(20) not null primary key,
	Description varchar(50),
	StartDate Datetime,
	EndDate Datetime,
	Amount Float
)

Create table OrderTicket 
(
	Order_ID varchar(20) not null primary key,
	UserID varchar(20) not null,
	Date datetime,
	Promotion_ID varchar(20),
	Tax float
	constraint fk_tblOrderTicket foreign key (UserID) references Users(UserID),
	constraint fk_tblPromotion foreign key (Promotion_ID) references Promotion(Promotion_ID),
)

CREATE TABLE Flight
(
	Flight_ID varchar(20) not null primary key,
	StartDate date,
	EndDate date,
	StartTime time,
	EndTime time,
	Departure nVARCHAR(20),
	Destination nVARCHAR(20),
	Gate int,
	Seats int
)

CREATE TABLE TicketType 
(
	TicketType_ID varchar(20) not null primary key,
	TicketType_Name VARCHAR(50),
	Seat_Begin varchar(20),
	Seat_End varchar(20)
)

CREATE TABLE Ticket 
(
    Ticket_ID varchar(20) not null primary key,
	Order_ID varchar(20),
	Flight_ID varchar(20),
	Selects varchar(20),
	TicketType_ID varchar(20),
	constraint fk_tblTicket foreign key (Order_ID) references OrderTicket(Order_ID),
	constraint fk_tblTicket2 foreign key (Flight_ID) references Flight(Flight_ID),
	constraint fk_tblTicket3 foreign key (TicketType_ID) references TicketType(TicketType_ID)
)

Create table Passenger
(
	Passenger_ID varchar(20) not null,
	Ticket_ID varchar(20) not null,
	UserID varchar(20),
	Passenger_Name nvarchar(50),
	Birthday date,
	constraint pk_tblPassenger primary key (Passenger_ID, Ticket_ID),
	constraint fk_tblPassenger1 foreign key (UserID) references Users(UserID),
	constraint fk_tblPassenger2 foreign key (Ticket_ID) references Ticket(Ticket_ID)
)

CREATE TABLE Price 
(
	Price_ID varchar(20) not null primary key,
	TicketType_ID varchar(20),
	StartDate Datetime,
	EndDate Datetime,
	Unit_Price Float
	constraint fk_tblPrice foreign key (TicketType_ID) references TicketType(TicketType_ID)
)

insert into  Users(UserID, Email, PassWord, Name, Gender, Birthday, Phone, Address, Nationality, CCCD, Role)
values('1','admin@gmail.com','123456',null, null, null, null, null, null, null,'admin'),
('024358','thunade170102@fpt.edu.vn','123456','Nguyen Anh Thu', 'F', '2002-07-05', '0913545213', 'Quang Nam', 'Vietnam', '6590768954','admin'),
('884327','khoanqdde160390@fpt.edu.vn','123456','Nguyen Quang Khoa','M', '2002-03-16', '0913545432', 'Quang Binh', 'Vietnam', '6590768954','cus'),
('366421','Lehvde160240@fpt.edu.vn','123456','Ho Van Le','M', '2002-12-09', '0913545213', 'Quang Tri', 'Vietnam', '9682224127','cus'),
('772668','thiepktnde160439@fpt.edu.vn','123456','Khau Tran Ngoc Thiep','M', '2002-09-19', '0913545213', 'Quang Nam', 'Vietnam', '2345871766','cus'),
('885972','thinhphde160042@fpt.edu.vn','123456','Pham Hung Thinh','M', '2002-08-19', '0913545213', 'Hue', 'Vietnam', '0955732284', 'cus'),
('221608','thanhvnde160635@fpt.edu.vn','123456','Vo Ngoc Thanh','M', '2002-11-09', '0913545213', 'Da Nang', 'Vietnam', '8472481229', 'cus'),
('994892','trieutdde160252@fpt.edu.vn','123456','Tran Dinh Trieu','M', '2002-05-09', '0913545213', 'Quang Nam', 'Vietnam', '0566344430', 'cus'),
('260048','huyhgde160045@fpt.edu.vn','123456','Hoang Gia Huy','M', '2002-06-29', '0913545213', 'Quang Ngai', 'Vietnam', '7411535707', 'cus'),
('497807','lentdde160294@fpt.edu.vn','123456','Nguyen Tran Duc Le','F', '2002-09-29', '0913545213', 'Hue', 'Vietnam', '6752083105', 'cus');

Insert into Flight 
values ('DM1' , '2023-05-25' , '2023-05-29' , '10:00' , '16:00' , N'Đà Nẵng' , N'Hồ Chí Minh', 3, 100),
('DM2',	'2023-05-29',	'2023-06-03',	'07:00:00',	'19:00:00',	N'Hà Nội',	N'Đà Nẵng',	6, 100),
('DM3',	'2023-06-05',	'2023-06-10',	'12:00:00',	'15:00:00',	N'Đà Nẵng',	N'Hồ Chí Minh',	5, 100),
('DM4',	'2023-07-02',	'2023-07-07',	'14:00:00',	'17:00:00',	N'Hà Nội',	N'Đà Nẵng',	1, 100),
('DM5',	'2023-06-05',	'2023-06-10',	'12:00:00',	'15:00:00',	N'Đà Nẵng',	N'Hồ Chí Minh',	9, 100),
('DM6',	'2023-05-29',	'2023-06-03',	'15:00:00',	'18:00:00',	N'Hà Nội',	N'Đà Nẵng',	3, 100),
('DM7',	'2023-06-05',	'2023-06-10',	'12:00:00',	'15:00:00',	N'Đà Nẵng',	N'Hồ Chí Minh',	8, 100),
('DM8',	'2023-05-25',	'2023-05-31',	'12:00:00',	'15:30:00',	N'Đà Nẵng',	N'Hà Nội',	9, 100),
('DM9',	'2023-05-25',	'2023-05-31',	'01:00:00',	'04:30:00',	N'Đà Nẵng',	N'Hà Nội',	2, 100),
('DM10','2023-05-25',	'2023-05-31',	'21:30:00',	'23:00:00',	N'Đà Nẵng',	N'Hà Nội',	2, 100)

insert into TicketType (TicketType_ID, TicketType_Name,Seat_Begin,Seat_End) 
values
('TT1', 'Economic', 'A1', 'A20'),
('TT2', 'Business', 'B1', 'B20')

insert into Price(Price_ID, TicketType_ID,Unit_Price,StartDate,EndDate) 
values
('PR1', 'TT1', 500000, '2023-05-25', '2023-07-25'),
('PR2', 'TT2', 1000000, '2023-05-25', '2023-07-25')


select UserID, Email, PassWord , Role
                    from Users
                    where Email = 'admin@123' and PassWord = '123456'

-- Chạy thêm từ chỗ này là được --
create table Luggage (
	Luggage_ID varchar(20) primary key,
	Luggage float,
	Price float
)

ALTER TABLE Ticket
ADD Luggage_ID varchar(20);

ALTER TABLE Ticket
ADD CONSTRAINT FK_Luggage
FOREIGN KEY (Luggage_ID) REFERENCES Luggage(Luggage_ID);

drop table Bill

ALTER TABLE OrderTicket
ADD TotalAmount float;

ALTER TABLE Ticket
DROP COLUMN Selects