
use students

create table emp_details(
userid int ,
name varchar(30),
per_hour_salary money,
working_hour int,
total_salary money)
drop table emp_details
alter table emp_details alter column userid int;

select * from emp_details
alter table  emp_details add acc_count int not null default 0;

--using trigger calculate the total_salary automatically
create trigger before_insert_user on
emp_details after insert 
as begin
update emp_details
set total_salary = i.working_hour*i.per_hour_salary
from inserted  i
where emp_details.userid=i.userid
end

insert into emp_details(userid,name,per_hour_salary,working_hour)
values(11,'Sahil','15000','8')
insert into emp_details(userid,name,per_hour_salary,working_hour)
values(12,'shiva','12500','10')

select * from emp_details

--update trigger 

create trigger before_update_user on emp_details after update
as begin 
update emp_details
set total_salary = i.per_hour_salary*i.working_hour
from inserted i 
where emp_details.userid= i.userid
end

update emp_details set working_hour =10 where userid =10
select * from emp_details

-- delete trigger 
--new table to store the deleted data 
create table deleted_emp_detail(
id int primary key,
empname varchar(30),
per_hour_salary money,
working_hour int,
total_salary money)
drop table deleted_emp_detail

create trigger delete_user_data on emp_details after delete
as begin 
insert into deleted_emp_detail (id,empname,per_hour_salary,
working_hour,total_salary)
select d.userid,d.name,d.per_hour_salary,
d.working_hour,d.total_salary 
from deleted d 
end

delete from emp_details where userid = 2
select * from emp_details
select * from deleted_emp_detail


-----calculate the number of accounts of a user
create table accounts(
account_no int ,
userid int ,
balance int default 0
)
drop table accounts

select * from accounts
select * from emp_details

create trigger open_account on 
accounts
after insert 
as begin 
update emp_details
set acc_count = acc_count + 1 from
emp_details join inserted i  on emp_details.userid =i.userid
end

drop trigger open_account

insert into accounts(account_no,userid,balance)
values(2004,1,500)

select * from accounts
select * from emp_details



