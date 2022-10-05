drop database if exists demo;
create database demo;
use demo;

create table users(
id int primary key auto_increment,
`name` varchar(45) not null,
email varchar(45) not null,
country varchar(45)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

delimiter //
create procedure get_user_by_id(IN user_id INT)
begin
select users.`name`, users.email, users.country
from users
where users.id = user_id;
end //
delimiter ;

delimiter //
create procedure get_all_user()
begin
select*
from users;
end //
delimiter ;
-- call get_all_user();

delimiter //
create procedure get_update_user(IN user_id INT,
								IN user_name varchar(50),
								IN user_email varchar(50),
								IN user_country varchar(50))
begin
update users
set name=user_name, email=user_email, country=user_country
where id=user_id;
end //
delimiter ;
-- call get_update_user(2,'MinhChauu','thaoly04@gmail.com','vietnam');

DELIMITER //
CREATE PROCEDURE delete_user(in user_id int)
BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM users
WHERE users.id = user_id ;
END //
DELIMITER ;
-- call delete_user(1); 

delimiter //
create procedure insert_user(IN user_name varchar(50),
							IN user_email varchar(50),
							IN user_country varchar(50))
begin
insert into users (name, email, country)
values (user_name, user_email, user_country);
end //
delimiter ;

select* from users;
