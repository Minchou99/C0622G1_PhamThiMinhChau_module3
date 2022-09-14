drop database if exists student_management_ss3;
create database student_management_ss3;
use student_management_ss3;
create table class(
class_id int auto_increment primary key,
class_name varchar(60) not null,
start_day datetime not null,
status bit
);

create table student(
student_id int primary key auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int not null,
foreign key(class_id) references class (class_id)
);

create table `subject` (
sub_id int primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit >=1),
`status` bit default 1
);

create table mark(
mark_id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id, student_id),
foreign key (sub_id) references `subject` (sub_id),
foreign key (student_id) references student (student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO student (student_name, address, `status`, class_id)
values ('Hoa', 'Hai phong', 1, 1);

INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select *from student where student_name regexp '(^h[a-z]+$)';
select *from class where month(start_day) = 12;
select *from `subject` where credit >=3 and credit <=5;
SET SQL_SAFE_UPDATES = 0;
update student set class_id = 2 where student_name = 'Hung';
SELECT student.student_name, `Subject`.sub_name, mark.mark
FROM student
INNER JOIN mark ON student.student_id = mark.student_id
INNER JOIN `subject` ON subject.sub_id = mark.sub_id ORDER BY mark DESC, student_name;

