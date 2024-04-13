create database ICT; # สร้าง database ที่ชื่อว่า ICT
create database MU;

drop database MU; # ลบ database ที่ชื่อว่า MU

USE ICT; # เวลาจะทำอะไรก็ต้องเลือก database ก่อนถึงจะทำได้

-- สร้าง columns ต่างๆเข้าไปที่  table Persons  เเละก็กำหนดค่าให้กับ  columns ได้ด้วย
create table Persons (
	PID int primary key,
    Lastname varchar(30) not null,
    Firstname varchar(40) not null,
    DOB date,
    City varchar(50),
    
    Gender varchar(2)
);

create table OrdePIDrs (
	OrderNo int,
    PID int not null,
    OrderDate datetime,
    primary key(OrderNo),
    constraint FK_PerOrders foreign key (PID) references Persons(PID)
);

-- อันนี้มาทำทีหลัง หมายถึงกำหนดทีหลัง
alter table Orders
add Amount int,
add Discount int;

describe Orders; # อธิบาย

alter table Orders
modify Amount decimal(7, 2);

create table Category (
CategoryID int primary key,
CategoryName varchar(60) not null
);

create table Prodects (
	ProductId int,
    ProductName varchar(60),
    CategoryID int,
    constraint PK_Product primary key (ProductID),
    constraint FK_CateProduct foreign key(CategoryID) references Category(CategoryID)
);

rename table Persons to Persons_data, Prodects to Products_data; # เปลี่ยนชื่อ table ใหม่ จากอะไรเป็นอะไร

rename table Category to Category_data;

drop table products_data; # ลบ table

insert into persons_data value (1, 'YAN', 'WEERAPHAT', '1985-07-02', 'Thailand', 'M'); # add data at columns ถ้าไม่กำหนด columns ก็ต้องใส่ให้ถูกต้องเเละครบ

UPDATE Persons_data 
SET City = 'Paris'
WHERE PID = 1; # เงื่อนไข

DELETE FROM Persons_data
WHERE PID = 1;


select * from student; # จะตบลงไปบรรทัดอื่นก็ได้

select class_code, COURSE_CODE from class;

SELECT DEPT_CODE, STU_FNAME # อยากให้เเสดง columns อะไรออกมาบ้าง
FROM student
order by STU_FNAME desc; # sort values

SELECT STU_NUM, STU_FNAME,STU_LNAME, STU_GPA # อยากให้เเสดง columns อะไรออกมาบ้าง
FROM student 
ORDER BY STU_GPA desc; # เหมือน sort values เเละมี asc

select STU_NUM, STU_FNAME, STU_DOB as A # ตั้งชื่อเเค่ STU_DOB เเละ as อยูาตรงไหนก็ได้
from student;

select STU_NUM, concat(STU_FNAME, '_', STU_LNAME) as HUN  # เอา columns STU_FNAME เเละ  STU_LNAME มา concat ด้วย _ เเล้วตั้งชื่อใหม่เป็น HUN
from student;

SELECT *, Credit *3000 AS TutionFee # เอา 3000 ไปคูณกับ Credit เเละตั้งชื่อให้ใหม่
FROM enroll
ORDER BY STU_NUM; # sort

SELECT *
FROM student
WHERE DEPT_CODE = 'ACCT'; # พิจารณา ทุก column เเละ จาก table student เเละพิจารณา columns DEPT_CODE ให้เเสดง ที่มีค่า  ACCT   คือ เลือกเเบบมี เงื่อนไข

SELECT COUNT(*) AS 'Number of Student' # นับ
FROM student;

select STU_NUM,CLASS_CODE
from enroll
order by STU_NUM;

select count(*), count(STU_NUM), count(distinct STU_NUM) # aggfunc   distinct คือ ไม่นับตัวซ้ำ
from enroll;

SELECT Max(CRS_CREDIT) As MaxCredit, Min(CRS_CREDIT) As MinCredit,   # aggfunc พร้อมตั้งชื่อ
Avg(CRS_CREDIT) As AvgCredit, Sum(CRS_CREDIT) As TotalCredit
FROM course;

drop table Persons; 


# วันที่ 2
SELECT CLASS_CODE, STU_NUM
FROM enroll;

SELECT CLASS_CODE, COUNT(STU_NUM)
FROM enroll
GROUP BY CLASS_CODE; # ถ้านับ ที่ซ้ำกันอ่ะ ก็ต้องมาคู่กัน

SELECT DEPT_CODE, COUNT(EMP_NUM)
FROM professor
GROUP BY DEPT_CODE
HAVING COUNT(EMP_NUM) > 2; # HAVING ใช้กับ GROUP BY   where ใช้ปกติ

SELECT STU_NUM, SUM(CREDIT)
FROM ENROLL
GROUP BY STU_NUM
HAVING SUM(CREDIT) > 18; # HAVING ใช้กับ aggfunc เท่านั้น

SELECT STU_NUM, SUM(CREDIT) AS TotalCredit
FROM enroll
GROUP BY STU_NUM
HAVING TotalCredit > 18 
ORDER bY TotalCredit;

select DEPT_CODE, avg(STU_GPA)
from student
group by DEPT_CODE
HAVING avg(STU_GPA) > 2.5;

select EMP_num, count(stu_num)
from student
Group by EMP_num
Having count(stu_num) > 3;

drop table orders;

select * from orders;

select orders.*, customer.*
from customer inner join orders on customer.customer_id = orders.customer_id;

select orders.*, customer.*
from customer left join orders on customer.customer_id = orders.customer_id;

select orders.*, customer.*
from customer right join orders on customer.customer_id = orders.customer_id; # เหมือน  merge เเล้ว how

# 1
SELECT *
FROM enroll E INNER JOIN student S ON E.STU_NUM = S.STU_NUM;

# 2 
SELECT *
FROM enroll E INNER JOIN student S ON E.STU_NUM = S.STU_NUM
	INNER JOIN department D ON S.DEPT_CODE = D.DEPT_CODE;

# 3
SELECT S.STU_NUM, S.STU_FNAME, S.STU_LNAME, DEPT_NAME, SUM(E.CREDIT) AS TotalCredit
FROM enroll E INNER JOIN student S ON E.STU_NUM = S.STU_NUM 
 INNER JOIN department D ON S.DEPT_CODE = D.DEPT_CODE
GROUP BY S.STU_NUM, S.STU_FNAME, S.STU_LNAME, DEPT_NAME
HAVING TotalCredit > 18  
ORDER BY TotalCredit DESC;

# 1
select *
from class C inner join course CS on C.COURSE_CODE = CS.COURSE_CODE;

# 2
select *
from class C inner join course CS on C.COURSE_CODE = CS.COURSE_CODE
	inner join professor P on C.EMP_NUM = P.EMP_NUM;

# 3
select *
from class C inner join course CS on C.COURSE_CODE = CS.COURSE_CODE
	inner join professor P on C.EMP_NUM = P.EMP_NUM
    inner join enroll E on C.CLASS_CODE = E.CLASS_CODE;

# 4
select C.CLASS_CODE, CS.COURSE_NAME, C.CLASS_SECTION, P.EMP_FNAME, count(E.STU_NUM)
from class C inner join course CS on C.COURSE_CODE = CS.COURSE_CODE
	inner join professor P on C.EMP_NUM = P.EMP_NUM
    inner join enroll E on C.CLASS_CODE = E.CLASS_CODE
group by C.CLASS_CODE, CS.COURSE_NAME, C.CLASS_SECTION, P.EMP_FNAME;

# ปกติ
SELECT c.customer_fname, c.customer_lname, o.amount
FROM customer c INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 1000;

# Subquery
select customer_id, amount
from orders
where amount > 1000;

SELECT c.customer_fname, c.customer_lname, o.amount
FROM customer c INNER JOIN 
(SELECT customer_id, amount FROM orders WHERE amount > 1000) o 
ON c.customer_id = o.customer_id;


# 1
select P.EMP_NUM, P.EMP_FNAME, P.EMP_LNAME, d.DEPT_NAME
from professor P inner join department D on P.EMP_NUM = D.EMP_NUM;


# Ex
# subqurey
select P.EMP_NUM, P.EMP_FNAME, P.EMP_LNAME, d.DEPT_NAME
from professor P inner join department D on P.EMP_NUM = D.EMP_NUM;

SELECT s.STU_FNAME, s.STU_LNAME, pd.EMP_FNAME, pd.EMP_LNAME, pd.DEPT_NAME
FROM student s INNER JOIN 
(SELECT p.EMP_NUM, p.EMP_FNAME, p.EMP_LNAME, d.DEPT_NAME
FROM professor p INNER JOIN department d ON p.EMP_NUM = d.EMP_NUM) pd
ON s.EMP_NUM = pd.EMP_NUM;


# where
select STU_NUM, STU_FNAME, STU_LNAME, STU_GPA
from student
where STU_GPA > 3;

select COURSE_CODE, COURSE_NAME, CRS_CREDIT
from course
where CRS_CREDIT > 3;

select STU_FNAME, STU_LNAME, STU_GPA
from student
where STU_GPA between 3 and 3.5;

select STU_FNAME, STU_LNAME
from student
where STU_FNAME like 'A%'; # ขึ้นต้นด้วย  A ตัวเเล็กตัวใหญ่ได้หมด    don't case      contains('A.*')

select STU_FNAME, STU_LNAME
from student
where STU_FNAME like '%A%'; # contains('a', case = False)

select *
from department
where DEPT_NAME like '%H%'; # contains('h', case = False)

select *
from class
where COURSE_CODE like 'H%' or COURSE_CODE like 'e%';

SELECT *  # vyoouh9hv'm;o ************************************************************
FROM Class
WHERE COURSE_CODE IN 
(SELECT COURSE_CODE
 FROM Course
 WHERE COURSE_CODE LIKE 'H%');

select *
from student
where DEPT_CODE like 'Hist' or DEPT_CODE like 'math';

select *
from student
where DEPT_CODE in ('Hist', 'math');

select CL.CLASS_CODE, C.COURSE_NAME, CLASS_ROOM
from class Cl inner join course C on CL.COURSE_CODE = C.COURSE_CODE
where CLASS_ROOM like 'K%';

select COURSE_NAME # อันนี้ยากละ ต้องอ่าน ******************************************************************************************
from course
where exists
(
	select DEPT_NAME
    from department d inner join professor p on d.EMP_NUM = p.EMP_NUM
    where p.EMP_FNAME like 'Gerald' and p.EMP_LNAME like 'Graztevski'
			and course.DEPT_CODE = d.DEPT_CODE
);

select  * 
from student
where STU_GPA > 3.2 and DEPT_CODE = 'ACCT';

select  * 
from student
where STU_GPA is null;

select  * 
from student
where STU_GPA is not null;

select concat_ws('-',COURSE_CODE, COURSE_NAME, CRS_CREDIT) info
from course; 

select STU_FNAME, STU_LNAME, year(current_date()) - year(STU_DOB)
from student;

select EMP_NUM,STDDEV_SAMP(STU_GPA) as 'Sample STDDEV', stddev(STU_GPA) as 'Pop STDDEV'
from student
Group by EMP_NUM;

select *
from professor P left join class C on P.EMP_NUM = C.EMP_NUM
where CLASS_CODE is null;


