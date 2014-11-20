#droping table

drop table employee;
drop table departmet;
drop table manager;
drop table project;
drop table location;

#dropin schema

drop schema employee;

#creating schema

create schema employee;

#creating tables

create table employee(employee_id int,employee_name varchar(30));
create table location(dept_id int,location_id int,location_name varchar(30));
create table departmet(employee_id int,dept_id int,dept_name varchar(30));
create table project(employee_id int,project_id int,project_name varchar(30));
create table manager(employee_id int,manager_id int,manager_name varchar(30));

# inserting values into tables 

insert into employee values(123,'ramesh');
insert into employee values(124,'rajesh');
insert into employee values(125,'rahul');
insert into employee values(126,'raju');

insert into location values(1232,1231,'hyderabad');
insert into location values(1242,1241,'pune');
insert into location values(1252,1251,'kolkatta');
insert into location values(1262,1261,'chennai');

insert into departmet values(123,1232,'finance');
insert into departmet values(124,1242,'marketing');
insert into departmet values(125,1252,'it');
insert into departmet values(126,1262,'operations');

insert into manager values(123,123,'ramesh');
insert into manager values(124,123,'ramesh');
insert into manager values(125,127,'phani');
insert into manager values(126,128,'ganesh');

insert into project values(123,1235,'finance_pr');
insert into project values(124,1235,'finance_pr');
insert into project values(125,1235,'finance_pr');
insert into project values(125,1235,'it_pr');
insert into project values(123,1245,'marketing_pr');
insert into project values(124,1255,'it_pr');
insert into project values(125,1265,'operations_pr');

# to describe
describe  employee;
describe  manager;
describe  project;
describe  location;
describe  departmet;


# to see all data in the table

select * from employee;
select * from departmet;
select * from project;
select * from location;
select * from manager;



#find all employees who report to specific manager

select employee_name from employee , manager 
where employee.employee_id = manager.employee_id 
and manager_name ='ramesh' ;

#find all employees group by project

select employee_name,project_name
from	employee,project
where	employee.employee_id = project.employee_id
group by employee_name,project_name;

#find all projects who has more than two employees

select distinct project_name from project p1 where project_id in 
(select project_id from project p2 where p2.employee_id <>p1.employee_id); 

