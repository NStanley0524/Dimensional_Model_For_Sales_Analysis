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

insert into Vehicle
values
(2, "Toyota", "Corolla", 2015, "White", "TYS678901234567-876Z", "TOY 456", 45000, "Michael Smith", 4),
(3, "Honda", "Civic", 2018, "Blue", "HCS345678901234-123X", "HON 789", 30000, "Sarah Johnson", 6),
(4, "Ford", "Escape", 2020, "Red", "FES234567890123-456Y", "FOR 987", 15000, "Emily Brown", 6),
(5, "Chevrolet", "Malibu", 2016, "Silver", "CMS456789012345-789Z", "CHE 321", 60000, "David Wilson", 6);

-- updated mistakes 

update Job
set invoice_id = 12349 where JobID = 11;

update Invoice
set Vehicle_id = 5
where invoice_id = 12349;

insert into Customer
values
(2, "Michael Smith", "250 Broadway, Winnipeg, MB, R3C 0R5", "204-555-1234", 4, 2),
(3, "Sarah Johnson", "789 Main St, Winnipeg, MB, R2W 3N2", "204-666-5678", 6, 3),
(4, "Emily Brown", "456 Elm St, Winnipeg, MB, R3M 2S5", "2204-777-9101", 8, 4),
(5, "David Wilson", "123 Oak St, Winnipeg, MB, R2J 3C4", "204-888-1112", 10, 5);

create index C_PartID_idx on Customer(PartID);
create index C_VehicleID_idx on Customer(Vehicle_id);
create index V_PartID_idx on Vehicle(PartID);
