
-- lab 9
select *
from countrylanguage;

select *
from countrylanguage
where Percentage between 5.3 and 7.4;

select *
from countrylanguage
where Percentage >= 5.3 and Percentage < 7.4;


select distinct(CountryCode)
from city;

select distinct(name)
from city;
select distinct(district)
from city;

select district
from city
where district = 'Dhaka';
select *
from city
where CountryCode = 'arg' or CountryCode = 'idn';
select *
from city
where CountryCode in ('arg', 'idn', 'tha', 'esp');
select *
from countrylanguage
where language in ('english') and IsOfficial = 't';
select *
from country
order by name asc;
-- select distinct(CountryCode), Language, percentage
-- from countrylanguage
-- order by percentage desc;

select distinct(Language)
from countrylanguage;
select distinct(name)
from city
where CountryCode = 'nld';
select *
from city
order by name desc
limit 50;
select *
from country
where capital = null;
select *
from country
limit 149, 50;
select *
from country
where name like '%land%';
select *
from country
where name like 't%';
select *
from country
where name like '%a';

select *
from country
where name like 'g%a';
select *
from country
where name like '______';
select *
from city
where countrycode = 'bra' and District like '%c%';
select *
from city
where countrycode = 'gbr' and District ='england'
order by name desc
limit 10,10;
select distinct(District)
from city
where countrycode like 'g%'
order by District asc
limit 20,5;



--
--
-- lab 1
use cc16_world;
select CountryCode as code
from city;

-- lab 2
select count(*)
from city;
select  language, count(language)
from countrylanguage
group by language;
select count(district), district
from city
group by District;

-- lab3
select sum(percentage)
from countrylanguage
group by language
having language = 'dutch';
select sum(percentage)
from countrylanguage
where percentage > 50
group by language
having language = 'english';

-- lab 4
select avg(percentage)
from countrylanguage
group by language
having language = 'greek';
select avg(percentage)
from countrylanguage
where isofficial = 't'
group by language
having language = 'spanish';

-- lab 5
select avg(percentage), min(percentage), max(percentage), language
from countrylanguage
group by language;
select avg(percentage), min(percentage), max(percentage), language
from countrylanguage
group by language
having language = 'german';

-- lab 6
select sum(percentage), isOfficial
from countrylanguage
group by isOfficial;
select sum(percentage), CountryCode
from countrylanguage
group by CountryCode
order by sum(percentage) desc;
select sum(percentage), Language
from countrylanguage
where percentage > 50
group by Language
order by sum(percentage) asc
limit 20, 10;
select avg(percentage), Language
from countrylanguage
group by Language
having sum(percentage) > 40 and sum(percentage) < 60
order by sum(percentage) desc;



-- lab 1
select e.id, e.name, address, d.name 'แผนก'
from employees e left join departments d on e.id = d.id;
select e.id, e.name, address, d.name 'แผนก'
from employees e left join departments d on e.id = d.id;
select p.name, p.price, s.phone_number
from products p join suppliers s on s.id = p.supplier_id;
select c.name, e.name
from customers c join Orders o on c.id = o.customer_id join employees e on o.employee_id = e.id;
select c.name, count(o.customer_id)
from customers c join Orders o on c.id = o.customer_id 
group by c.id;
select e.name, count(o.customer_id)
from employees e join Orders o on e.id = o.employee_id 
group by e.id;
select s.name, p.name
from suppliers s, products p;


select s.name, p.name
from suppliers s left join products p on s.id = p.supplier_id;
select *
from suppliers s left join products p on s.id = p.supplier_id
where p.price > 800;
select *
from employees e join departments d on e.department_id = d.id
where d.name = 'ฝ่ายขาย';
select d.name, avg(salary)
from employees e join departments d on e.department_id = d.id
group by d.name;
select sum(p.price * o.amount * ( 1 - o.discount))
from products p join order_items o on p.id= o.product_id;
select sum(p.price * o.amount * ( 1 - o.discount)) , orders.date -- orders.date  -- sum(p.price * o.amount)
from products p join order_items o on p.id= o.product_id join orders on orders.id = o.order_id
group by orders.date;
select c.name, sum(oo.amount * oo.price * ( 1 - oo.discount))
from customers c left join orders o on c.id = o.customer_id left join order_items oo on o.id = oo.order_id
group by c.name;


select e.name, sum(oo.amount * oo.price * (1-oo.discount))
from employees e left join orders o on e.id = o.employee_id left join order_items oo on o.id = oo.order_id
group by e.name;
select p.name, sum(oo.amount * oo.price * ( 1 - oo.discount)) sum
from products p left join order_items oo on p.id = oo.product_id
group by p.name
having sum < 20000;
select p.name ,sum(oo.amount * oo.price * (1- oo.discount))
from suppliers s left join products p on s.id = p.supplier_id left join order_items oo on p.id = oo.product_id
group by p.name
order by sum(oo.amount * oo.price * (1- oo.discount)) desc
limit 5;
select sum(oo.amount), p.name
from products p left join order_items oo on p.id = oo.product_id
group by p.name
order by sum(oo.amount) desc
limit 1;
select c.name, p.name, sum(oo.price * oo.amount * ( 1 - oo.discount))
from customers c left join orders o on c.id = o.customer_id left join order_items oo on o.id = oo.order_id left join products p on oo.product_id = p.id
group by c.name, p.name;
select c.name, p.name, sum(oo.price * oo.amount * ( 1 - oo.discount))
from customers c left join orders o on c.id = o.customer_id left join order_items oo on o.id = oo.order_id left join products p on oo.product_id = p.id
where p.name = 'น้ำดื่มตรา ไฮยีน่า'
group by c.name, p.name
order by sum(oo.price * oo.amount * ( 1 - oo.discount)) desc
limit 5;
select c.name, sum(oo.price * oo.amount *(1-oo.discount))
from customers c left join orders o on c.id = o.customer_id left join order_items oo on o.id = oo.order_id
group by c.name
having sum(oo.price * oo.amount *(1-oo.discount)) > 10000;


-- ข้อ 1 หน้า 4
select e.id, e.name, sum(oo.price * oo.amount *(1-oo.discount)) total
from employees e left join orders o on e.id = o.employee_id left join order_items oo on o.id = oo.order_id
group by e.id
having total > (select avg(dt.total)
	from (
		select e.id, e.name, sum(oo.price * oo.amount *(1-oo.discount)) total
		from employees e left join orders o on e.id = o.employee_id left join order_items oo on o.id = oo.order_id
		group by e.id
		) dt
        );
select avg(dt.total)
from (
	select e.id, e.name, sum(oo.price * oo.amount *(1-oo.discount)) total
	from employees e left join orders o on e.id = o.employee_id left join order_items oo on o.id = oo.order_id
	group by e.id
) dt;

select *
from order_items oo left join
(select *
from customers c cross join 
(select e.name e_name, e.id e_id, o.id o_id, o.customer_id customer_id from employees e right join orders o on e.id = o.employee_id) h 
on c.id = h.customer_id) aa on oo.order_id = aa.id 
where (e_name is null or e_id is null) and name is not null;











