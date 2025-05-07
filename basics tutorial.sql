create database college;
use college;

create table student(
	rollno int primary key,
    name varchar(50)
);



INSERT INTO student 
(rollno,name)
values
(11,"Esh"),
(47,"Eshwar");

create database mycompany;
use mycompany;
create table employee(
	id int primary key,
    name varchar(50),
    salary int not null
);
insert into employee 
	(id,name,salary)
    values
    (4,"Prajwal",25000000),
    (121,"Eshwar",1000000);
    
select * from employee;
    
use mycompany;
create table temp1(
id int,
name varchar(49),
age int,
city varchar(48),
primary key(id, name)
);

use college;

create table temp1(
	id int unique
    );

insert into temp1 values (100),(88);	
select * from temp1;
