select * from customers;

select * from customers where address like '%ชลบุรี';

select * from products where price > 500;

select * from products p left join suppliers s on  p.supplier_id = s.id;

select * from products p left join suppliers s on  p.supplier_id = s.id where p.price > 1000;

select * from employees e left join departments d on e.department_id = d.id where d.name in ('จัดซื้อ', 'บัญชี', 'คลังสินค้า', 'ฝ่ายขาย');

select avg(salary) from employees;

select max(salary) from employees;

select count(*) from orders;
select count(customer_id) from orders;
select * from order_items;

select sum(amount * price * (1 - discount)) from order_items;

select * from order_items;
select * from orders;
select date, sum(amount * price * (1 - discount)) sum from orders o right join order_items oi on o.id = oi.order_id group by date;

select sum(amount * price) - sum(amount * price * (1 - discount)) from order_items;

select * from employees;
select * from order_items;
select * from orders;
select * from customers;
select * from products;
select name, sum(amount * price * (1 - discount)) sum from orders o left join employees e on o.employee_id = e.id left join order_items oi on o.id = oi.order_id group by name;

select * from customers;
select * from order_items;
select * from orders;
select name, sum(amount * price * (1 - discount)) sum from customers c left join orders o on c.id = o.customer_id left join order_items oi on o.id = oi.id group by name having sum > 10000;

select * from order_items;
select * from orders;
select * from order_items oi inner join orders o on oi.order_id = o.id inner join products p on oi.product_id = p.id;
select name, sum(amount * p.price * (1 - discount)) sum from order_items oi inner join orders o on oi.order_id = o.id inner join products p on oi.product_id = p.id group by name order by sum desc limit 3;

select * from customers;
select * from orders;
select * from customers c left join orders o on c.id = o.customer_id where o.id is null;

select * from products;
select * from order_items;
select name, sum(amount) sum from order_items oi left join products p on oi.product_id = p.id group by name order by sum desc limit 1;

select * from customers;
select * from orders;
select * from products;
select c.name, sum(oi.price * oi.amount * (1 - oi.discount)) sum from customers c left join orders o on c.id = o.customer_id inner join order_items oi on o.id = oi.order_id inner join products p on oi.product_id = p.id where p.name like '%ไฮยีน่า' group by c.name order by sum desc limit 5;


select e.name, sum(oi.amount * oi.price * (1 - oi.discount)) sum from employees e inner join orders o on e.id = o.employee_id inner join order_items oi on o.id = oi.order_id group by e.name order by sum desc limit 1;


select c.name, sum(oi.price * oi.amount * (1 - oi.discount)) sum from customers c inner join orders o on c.id = o.customer_id inner join order_items oi on o.id = oi.order_id inner join products p on oi.product_id = p.id inner join suppliers s on p.supplier_id = s.id where s.name = 'ไท คราฟท์' group by c.name order by sum desc limit 5;




-- select sum(amount * price *discount) total_discount from order_items

-- select e.id employee_id ,e.name employee_name,sum(oi.amount*oi.price*(1-oi.discount)) total from order_items oi join orders o on o.id = oi.order_id join employees e on e.id = o.employee_id group by e.id

-- select c.id,c.name customer_name ,sum(oi.amount*oi.price*(1-oi.discount)) total_buy from order_items oi join orders o on o.id = oi.order_id join customers c on c.id = o.customer_id group by c.id having total_buy >10000

-- select oi.product_id,p.name product_name ,sum(oi.amount*oi.price*(1-oi.discount)) total_sale from order_items oi join products p on p.id = oi.product_id group by oi.product_id order by total_sale desc limit 3

-- select c.name from customers c left join orders o on c.id =o.customer_id where o.id is null

-- select p.id ,p.name,count(oi.amount) total_amount from products p join order_items oi on p.id = oi.product_id group by p.id order by total_amount desc limit 1

-- select c.id,c.name customer_name,sum(oi.amount*oi.price*(1-oi.discount)) total_buy from customers c join orders o on c.id = o.customer_id join order_items oi on oi.order_id = o.id join products p on p.id = oi.product_id where p.id = 10 group by c.id order by total_buy desc limit 5

-- select e.id, e.name employee_name,sum(oi.amount*oi.price*(1-oi.discount)) total_sale from order_items oi join orders o on o.id = oi.order_id join employees e on e.id = o.employee_id group by e.id order by total_sale desc limit 1

select c.id , c.name customer_name ,sum(oi.amount*oi.price*(1-oi.discount)) total_buy from products p join suppliers s on p.supplier_id = s.id join order_items oi on p.id = oi.product_id join orders o on o.id = oi.order_id join customers c on c.id = o.customer_id where s.name = 'ไท คราฟท์' group by c.id order by total_buy desc limit 5;













