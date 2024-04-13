-- if not exists world_city ถ้าไม่มี world_city ให้สร้าง  แต่ถ้ามีอยู่แล้วก็ไม่สรา้ง ไม่ error
-- create database if not exists world_city;

-- if exists world_city ถ้ามีให้ลบ world_city
-- drop database if exists world_city;


-- use คือ เลือกใช้งาน database อันไหน
use world_city;

create table if not exists continent(
	-- <name column> <datatype> [auto_increment คือ เพิ่มค่าให้ auto]
    id int auto_increment,
    -- <name column> <datatype varchar(20) 20ตัวอัษร> <not null คือ ต้องใส่ข้อมูล> <unique คือ ห้ามซ้ำกัน>
    name varchar(20) not null unique,
    -- ให้ columns id เป็น primary key
    primary key (id)
);

create table if not exists country(
	id int auto_increment primary key ,
    name varchar(100) not null unique,
    population float check(population >= 0),
    -- default false คือ กำหนดค่าเริ่มต้นเป็น false 
    is_empty boolean not null default false,
    continent_id int not null ,
    -- references continent (id) คือ references ไปที่ table continent ที่ column id ไปที่ foreign key
    -- foreign key (foreign key) คือ เอาไว้อ้างอิงจาก column นอกมาที่ foreign key
    foreign key (continent_id) references continent (id)
);

-- alter เปลี่ยนแปลง ที่ table country เพิ่ม(add) column area datatype เป็น float
alter table country add column area float check(area >= 0);

create table city(
	id int primary key
);

-- ลบ table
drop table city;

--
-- 
-- lab 1
create database if not exists test_db;
use test_db;
drop database test_db;

--
--
-- lab 2
create database if not exists todo_list;
use todo_list;
create table if not exists users(
	id int auto_increment primary key ,
    username varchar(50) not null unique ,
    email varchar(50) not null unique,
    password varchar(50) not null check(password >= 8)
);
create table if not exists todos(
	id int primary key auto_increment ,
    title varchar(50) not null,
    status boolean default false ,
    due_date date not null,
    user_id int not null,
    foreign key (user_id) references users(id)
);

-- 
--
-- lab 3
create database if not exists country;
use country;
create table if not exists regions(
	id int auto_increment primary key ,
    name varchar(100) unique not null
);
create table if not exists provinces(
	id int auto_increment unique not null primary key,
    name varchar(100) not null unique,
    region_id int not null,
    foreign key (region_id) references regions(id)
);
create table if not exists districts(
	id int auto_increment not null unique primary key,
    name varchar(100) not null ,
    province_id int not null,
    foreign key (province_id) references provinces(id)
);
create table if not exists subdistricts(
	id int auto_increment not null primary key,
    name varchar(100) not null ,
    district_id int not null,
    foreign key (district_id) references districts(id),
    postal_code int not null unique check(postal_code >= 10000)
);
use country;
insert into regions (name) values('ภาคเหนือ'), ('ภาคใต้'), ('ภาคตะวันออก'), ('ภาคตะวันตก'), ('ภาคกลาง'), ('ภาคตะวันออกเฉียงเหนือ');
insert into provinces (name, region_id) values('กรุงเทพ', 5), ('นครราชสีมา', 6), ('ภูเก็ต', 2), ('เชียงใหม่', 1), ('กระบี่', 2));
insert into districts (name, province_id) values('จคุจักร', 1), ('ลาดยาว', 1), ('ภนนเพชรบุรี', 1), ('พระสมุทรเจดีย์', 12);
insert into provinces (name, region_id) values('สมุทรปราการ', 5);
insert into subdistricts (name, district_id, postal_code) values('นาเหลือ', 4,10000);
insert into provinces (name,region_id) values('อุบล', 6);
insert into districts (name, province_id) values('พิบูลบังสาหาร', 13);
insert into subdistricts (name, district_id, postal_code) values('อ่างศิลา', 5, 10001);




-- ต้องเลือก database ก่อน
use world_city;
-- เพิ่มข้อมูลไปที่ table continent column name ด้วยค่า Asia
insert into continent (name) values('Asia');
insert into continent (name) values('Europe'), ('Africa'), ('Oceania'), ('Noth America'), ('Sounth America');
insert into country (name, area, population, is_empty, continent_id) values('Thailand', 581, 71.6, false, 1);
insert into country (continent_id, name) values(1, 'china');
insert into country (continent_id, name) values(100, 'India'); -- error เพราะว่า continent_id เป็น foreign key แล้วยังไม่มีเลย error
insert into country (continent_id, name) values(-200, 'Lao'); -- error เพราะว่า continent_id ตั้งค่าเป็น ต้อง >= 0


update country set area = 555, population = 444 where id = 1;

-- update table continent column name ที่ id = 6 ด้วยค่า south america
update continent set name = 'South America' where id = 6;

-- delete ที่ table country ที่ name = 'China'
delete from country where name = 'China';

delete from country where id = 6000;

-- ลบไม่ได้ เพราะว่า ติด foreign key อยู่  country ใช้ foreign key จาก continent อยู่
delete from continent where id = 1;
-- set delete   cascade เมื่อหายก็จะทำให้หายๆไปหมดต่อๆไป

delete from continent where id = 6;


