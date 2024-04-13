
-- lab 4
create database register_student;
use register_student;
create table if not exists user(
	student_id int not null unique primary key,
    name varchar(100) not null 
);

-- lab 5
create database expense_tracker;
use expense_tracker;
create table if not exists form(
	id int auto_increment unique,
    name varchar(100) not null,
    title varchar(100) not null
);


-- lab 6 
create database if not exists thailand;
use thailand;
create table if not exists region(
	id int auto_increment primary key,
    region_name varchar(100) not null unique
);
create table if not exists province(
	id int auto_increment primary key,
    province_name varchar(100) not null,
    region_id int ,
    foreign key (region_id) references region (id)
);
create table if not exists districts(
	id int auto_increment primary key,
    districts_name varchar(100) not null ,
    province_id int ,
    foreign key (province_id) references province (id)
);
create table if not exists subdistricts(
	id int auto_increment primary key,
    subdistricts_name varchar(100) not null ,
    districts_id int ,
    foreign key (districts_id) references districts (id)
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



-- 
-- update continent set name = 'South America' where id = 6;
-- lab 7
update subdistricts set name = 'กะรน' where id = 4;


-- 
-- delete from country where name = 'China';
-- lab 8
delete from subdistricts where id = 8;
delete from provinces where name = 'กรุงเทพ';









