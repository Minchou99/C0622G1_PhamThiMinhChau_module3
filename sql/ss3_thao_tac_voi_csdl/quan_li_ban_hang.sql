use sale_management;
insert into customer 
values(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into `order` 
values (1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);

insert into product 
values (1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into order_detail 
values(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1), 
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select order_id, order_date, order_total_price 
from `order`;
select  customer.customer_name, product.product_name
from customer
inner join `order` on customer.customer_id = `order`.customer_id
inner join order_detail on `order`.order_id= order_detail.order_id
inner join product on order_detail.product_id = product.product_id;
select* from customer 
where customer.customer_id not in (
select customer_id 
from `order`);
select `order`.order_id,`order`.order_date,SUM(order_detail.order_detail_qty*product.product_price) as total_order_price
from `order`
inner join order_detail on `order`.order_id = order_detail.order_id
inner join product on order_detail.product_id = product.product_id
group by `order`.order_id;


