create database pre_test;
use pre_test;

create table if not exists test (
	id int auto_increment primary key,
    name  varchar(40) not null,
    age int not null,
    tall float not null,
    create_at datetime,
    update_at datetime on update now()
);

create table if not exists orders (
	id int auto_increment primary key,
    test_id int,
    name varchar(200),
    foreign key (test_id) references test(id)
);



alter table test
add address varchar(100);

alter table test
modify column tall int;

alter table test
drop column create_at;

insert into test (name, age, tall) value ('hun', 20, 180);

update test 
set name = "weeraphat", age = 10
where id = 1;

delete from test 
where id = 1;

drop table if exists test;

drop database pre_test;

truncate table test; -- ลบข้อมูลทั้งหมดออกจาก table

select *
from test;

select *
from test
where id in (2,3,4);

select id, name as fullname, age ages
from test;

select distinct name -- เอา column name ที่ไม่ซ้ำกันออกมา
from test;

select *
from test
where age > 20;

select *
from test 
where age > 15 or age < 30;

select *
from test 
where age between 15 and 30;

select age + 10
from test;

select * 
from test
where name like '_';

select *
from test
where name like 'h%';

select *
from test
order by name asc;

select *
from test
order by name desc;

select name
from test
group by name;

select name, avg(age) average
from test
group by name
having average;

select name, avg(age) average
from test
group by name
having average > 20;
 













