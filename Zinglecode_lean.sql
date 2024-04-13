create database Zinglecode;

use Zinglecode;

select * 
from products;

select title, price
from products;

select * 
from products
where is_neccessary=1;

select *
from products
where price >= 4000 and price <= 10000;

select *
from products
where is_neccessary = 1 or price <= 5000; # เงื่อไนไข 2 เงื่อนไข

select *
from products
where title like '%ยน%'; # contains '%ยน%'

select *
from products
order by title desc; # sort values

select *
from products
order by title desc
limit 2; # head(2)

select *
from products
limit 2 offset 1; # offset 1 เเปลว่าเริ่ม row2 เเละ  limit 2 เเปลว่าเอามา 2 row

insert into products (title, price, is_neccessary) # add data จะกำหนด columns หรือไม่กำหนดก็ได้ถ้าใส่ทั้งหมด
values ('จอยสติ๊ก', 1500, 0);

insert into products (title, price, is_neccessary) # add data จะกำหนด columns หรือไม่กำหนดก็ได้ถ้าใส่ทั้งหมด
values ('จอยสติ๊ก', 1500, 0), ('เผือก', 25, 1), ('หมู', 500, 1);

# update
update products
set title = 'HUN'
where id = 7; # ได้เเต่  id เท่านั้น ไม่รู้ทำไม





select * from products;