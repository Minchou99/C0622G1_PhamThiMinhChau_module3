drop database if exists sale_management;
create database sale_management;
use sale_management;
create table  customer(
customer_id int auto_increment primary key,
customer_name varchar(50),
customer_age int
);

create table `order`(
order_id int auto_increment primary key,
customer_id int,
order_date date,
order_total_price float,
foreign key (customer_id) references customer(customer_id)
);

create table product(
product_id int primary key auto_increment,
product_name varchar(50),
product_price double
);


create table order_detail(
order_id int,
product_id int,
primary key(order_id, product_id),
order_detail_qty varchar(50),
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);