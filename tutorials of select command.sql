use college;
show tables;

create table student1(
	rollno int primary key,
    name varchar(20),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into student1
(rollno,name,marks,grade,city)
values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhrv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"anil",82,"B","Delhi");

select * from student1;
-- insert into student
-- (rollno,name,marks,grade,city)
-- values
-- (107,"farah",82,"B","Delhi");

select name,marks from student;
select distinct city from student;

select *
from student
where city = "Mumbai";

select *
from student
where city = "Mumbai" and marks > 90;

select *
from student
where city = "Mumbai" or marks > 90;

select *
from student
where marks between 80 and 90;

select *
from student
where city in ("Mumbai","Delhi");

select *
from student  -- won't give any error, it will check if there is any matching data for given condition. 
where city in ("Banglore");

select *
from student
where city not in ("Mumbai","Delhi"); 

select *
from student 
limit 3;

select *
from student 
where marks > 80
limit 3;

select *
from student
order by marks desc;

select *
from student
order by marks desc
limit 3;

select *
from student
order by city desc;


select max(marks)
from student;

select count(name)
from student;

select city,name,count(name)
from student 
group by city,name;


-- Write te query to find the avrg marks in each city in accending order

select city, avg(marks)
from student
group by city
order by avg(marks) asc;

-- Having Clause
select city,count(rollno)
from student 
group by city
having max(marks) > 90;


select city,count(rollno),grade
from student
where grade = "A"
group by city
having grade = "A";

-- Update queries
update student
set name = "farah"
where rollno=106;

select name
from student
where rollno=106;

set sql_safe_updates = 0;

update student 
set grade = "O"
where marks > 89; 

select *
from student;

update student
set marks = marks + 1;

delete from student
where marks < 33;

-- Revisiting Foreign Key
create table dept(
	did int primary key,
    name varchar(20)
    );
use college;
insert into dept 
values 
(101,"cse"),
(102,"ece"),
(103,"me");

select * from dept;

update dept
set name = "eee"
where did = 102;

    
create table teacher(
	id int primary key,
    name varchar(30),
	d_id int not null,
    foreign key(d_id) references dept(did)
    on update cascade
    on delete cascade
    );
select * from teacher;

drop table teacher;

insert into teacher
values
(1,"Giri",101),
(2,"rafi",103),
(3,"gopi",102),
(4,"vinay",101);

update dept
set did = 104
where did = 101;



-- Table related queries
select * from student;
-- Alter table
alter table student
add age int not null default 19;

alter table student
modify column age varchar(2);

insert into student
(rollno,name,marks,age)
values
(107,"gargi",82,18); 

alter table student
change column age stud_age int;

alter table student
change town city varchar(20) ;

alter table student
drop column stud_age;
 
alter table student
rename to stu;

select * from student;

alter table stu
rename to student;

truncate table student;

alter table student
change column name full_name varchar(20);

set sql_safe_updates = 0;

delete from student
where marks < 80;

alter table student
drop column grade;

drop table student;
drop table dept;


-- Join in sql

create table student(
	sid int primary key,
    name varchar(20));
    
insert into student
(sid,name)
values
(101,"adam"),
(102,"bob"),
(103,"casey");
    
select * from student;

create table course(
	sid int primary key,
    course varchar(20));

drop table course;

select * from course;

insert into course
(sid,course)
values
(102,"english"),
(105,"math"),
(103,"Science"),
(107,"Computer Science");

select *
from student as S
inner join course as C
on S.sid = C.sid;

select *
from student as s
left join course as c
on s.sid = c.sid;

select * 
from student as s
right join course as c
on s.sid = c.sid;


select *
from student as s
left join course as c
on s.sid = c.sid
union
select * 
from student as s
right join course as c
on s.sid = c.sid;


-- Left Exclusive join

select * 
from student as s
left join course as c
on s.sid = c.sid
where c.sid is null;

-- Right Exclusive join

select *
from student as s
right join course as c
on s.sid = c.sid
where s.sid is null;

use college;
create table employee(
	id int primary key,
    name varchar(20),
    manager_id int
    );

insert into employee
values
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"donald",103);
select * from employee;
    
select a.name as managera_name,b.name
from employee as a
join employee as b
on b.manager_id = a.id;

-- Subqueries

select avg(marks)
from student1;

select name, marks
from student1
where marks > 74.333;

select name, marks
from student1
where marks > (select avg(marks) from student1);


-- Max marks of students from Delhi
select max(marks)
from (
	select * from student1 where city = "Delhi") as temp;
    
-- MySql Views

create view view1 as 
select rollno,name, marks from student1;

select * from view1
where marks < 90;

drop view view1;


