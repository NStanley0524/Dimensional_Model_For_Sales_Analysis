-- CREATIING DATABASE FOR THE PART B 

Create database Part_B_task;

use part_b_task;

create table Customer(
Customer_id int primary key not null auto_increment,
Customer_name varchar(100),
Address varchar(100),
Phone_no varchar(20)
);


create table Parts(
part_id int,
job_id int,
part_no varchar(10),
part_name varchar(50),
Quantity int,
Unit_price decimal,
Amount decimal
);

-- adjustments after creating the table

alter table Parts
rename column part_id to PartID;

alter table Parts
add constraint primary key(PartID);

alter table Vehicle
add constraint primary key(Vehicle_id);

alter table Invoice
add constraint primary key(invoice_id);


create table Vehicle(
Vehicle_id int,
Make varchar(50),
Model varchar(50),
`Year` int,
Color varchar(50),
VIN varchar(100),
Reg_no varchar(50),
Mileage int,
Owner_name varchar(100)
);


create table Invoice(
invoice_id int,
invoice_date date,
Subtotal decimal,
Sales_tax_rate int,
Sales_tax decimal,
Total_labour decimal,
Total_parts decimal,
Total decimal
);


create table Job(
JobID int primary key,
VIN varchar(200),
`Description` varchar(200),
Hours decimal,
Rate decimal,
Amount decimal
);

-- adding foreign keys to create reltaionships

alter table Invoice
add constraint foreign key(Vehicle_id) references Vehicle(Vehicle_id);

desc Customers;

-- modifying columns 

alter table Parts
modify column Amount decimal(10,2);

alter table Job
add column invoice_id int;

-- loading data into mysql

load data infile 'invoice.csv' into table Invoice
fields terminated by ','
ignore 1 lines;


select * from Vehicle;
select * from Customer;
select * from Invoice;
select * from Job;
select * from Parts;


