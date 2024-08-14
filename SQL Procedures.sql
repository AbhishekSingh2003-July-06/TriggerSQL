Create database students;
use students;

create table stu_details(
Std_name varchar(50),
std_email varchar(50),
std_Address varchar(50),
std_contact varchar(10),
std_class int,
std_per int);

--change the column datatype
alter table stu_details alter column Std_name varchar(50);

--add a column in a table
alter table stu_details add Std_rollno int;

--drop a column from  a table
alter table  stu_details drop column Std_rollNo;

--fetch the data from a table
select * from stu_details;






create database test2

use test2

create table user_details(
user_id int identity (1,1) primary key,
name varchar(30),
email varchar(30),
phonenum varchar(10),
address_id int foreign key references addresses(address_id),
);

create table addresses(
address_id int primary key,
countries_id int foreign key references countries(countries_id),
state_id int foreign key references states(state_id),
city_id int foreign key references city(city_id)
);

create table countries(
countries_id int primary key,
country_name varchar(10),
state_id int foreign key references states(state_id))

create table states(
state_id int primary key,
state_name varchar(30),
city_id int foreign key references city(city_id))

create table city(
city_id int primary key,
city_name varchar(30),
city_code int)

select * from city;
select * from states;
select * from countries;
select * from addresses;
select * from user_details;

--inner join
select u.user_id,u.name,u.email,u.phonenum,a.address_id,
c.country_name,s.state_name,b.city_name, b.city_code
from user_details as u 
inner join  
addresses as a 
on u.address_id = a.address_id
inner join 
countries as c
on a.countries_id = c.countries_id
inner join
states as s 
on c.state_id = s.state_id
inner join 
city as b
on s.city_id = b.city_id;


--Procedure to insert data
create proc InsertData(@Name varchar(30), @email varchar(30), 
@phonenum varchar(10),@Address_Id int)
as 
insert into user_details values (@name, @email, @phonenum,
@address_id)

drop proc InsertData
select * from user_details

InsertData 'Abhishek','abhi45@gmail.com','Delhi',1;
InsertData 'Saket','Ska112@gmail.com','Ghz',3;

--Procedure to update Data

create proc updateData(@id int, @Name varchar(30), @email varchar(30), @phonenum varchar(10),
@Address_Id int)
as 
update user_details
SET
name = @Name,
email = @email,
phonenum = @phonenum,
address_id = @Address_Id
where user_id = @id;

updateData  6,'Abhi','abhi3445@gmail.com','444554','4';

--Procedure to Select Data

create proc selectData(@id int)
as 
select Name, email, phonenum ,Address_Id from user_details
where user_id = @id;

exec selectData 4

select * from user_details

--procedure to delete the data

create proc deleteData(@id int)
as 
delete from user_details
where user_id = @id;

exec deleteData 5

--Alter table  to insert the column 
create proc alterData
as
alter table user_details add gender varchar(10);

exec alterData

drop proc alterData

select * from user_details

--procedure to drop a column 

create proc alterData1
as 
alter table user_details drop column gender;

exec alterData1  

--procedure to rename column
create proc alterData2
as 
alter table user_details Rename column phonenum To mobileno;

exec alterData2








