drop database if exists demo;
create database demo;
use demo;
create table products(
product_id int primary key auto_increment,
product_code varchar(20),
product_name varchar(45),
product_price float,
product_amount int,
product_description varchar(50),
product_status varchar(50)
);

insert into products 
values(1,'P001','Ô mô', 35000, 50, 'Sạch những vết bẩn cứng đầu','cháy hàng'),
(2,'P002','Ô mô', 35000, 700, 'Sạch những vết bẩn cứng đầu','cháy hàng'),
(3,'P003','Ô mô', 35000, 900, 'Sạch những vết bẩn cứng đầu và thơm lâu','cháy hàng'),
(4,'P004','Ô mô', 35000, 250, 'Sạch những vết bẩn cứng đầu và lưu hương lâu','cháy hàng');

create unique index i_index on products(product_code);
create index i_index_1 on products(product_name, product_price);
explain select* from products ;

create view w_products as select product_code, product_name, product_price, product_status from products;
update w_products set product_name = 'Ô tô matic ' where product_code = 'P001';
drop view w_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure p_get_all_products()
begin
select * from products;
end //
delimiter ;
call p_get_all_products();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure p_insert_new_products()
begin
insert into products values (7,'P007','Ô mô', 35000, 250, 'Sạch những vết bẩn cứng đầu và lưu hương lâu','cháy hàng');
end //
delimiter ;
call p_insert_new_products();

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure p_update_products()
begin
update products set product_name = 'A ba', product_price = '230000' where product_id = 1;
end //
delimiter ;
call p_update_products();

 -- Tạo store procedure xoá sản phẩm theo id
 delimiter //
create procedure p_delete_products()
begin
delete from products where product_id = 1;
end //
delimiter ;
call p_delete_products();