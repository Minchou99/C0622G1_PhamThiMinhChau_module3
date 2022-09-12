CREATE DATABASE if not exists student_management;
USE student_management;
create table class (
id INT primary key ,
`name` VARCHAR(50)
);

create table teacher(
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);

create table student(
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);