-- select ทุก column จาก table branch
select * from branch;

-- select column branch_id, name จาก table branch
select branch_id, name from branch;

-- select column cc16_banking เอาไปคูณ column cust_id จาก table account.  result คือ เปลี่ยนชื่อ column เป็น result ได้เลย
select avail_balance * cust_id result from account ;

select avail_balance * cust_id result, avail_balance a, cust_id b from account ;

select *, avail_balance * cust_id result from account ;

-- account.avail_balance => table.column
select account.avail_balance from account;

-- เปลี่ยนชื่อ table ก่อนจะเลือก column.  a.* คือ table a เอาทุก column
select a.avail_balance, a.* from account a;

-- เลือกทุก column จาก table INDIVIDUAL ที่ column CUST_ID = 5
select * from INDIVIDUAL where CUST_ID = 5;

-- เอา column i.FIRST_NAME, i.LAST_NAME จาก table INDIVIDUAL i เงื่อนไข column CUST_ID > 5
select i.FIRST_NAME, i.LAST_NAME from INDIVIDUAL i where CUST_ID > 5;

-- เอา column i.FIRST_NAME, i.LAST_NAME จาก table INDIVIDUAL i เงื่อนไข column. 3 <= CUST_ID <= 5 
select i.FIRST_NAME, i.LAST_NAME, CUST_ID from INDIVIDUAL i where CUST_ID between 3 and 5;

-- from => where => select

select i.first_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
where CUST_ID = 5 or CUST_ID = 9;  -- เงื่อนไข ที่ column CUST_ID = 5 or CUST_ID = 9

select i.first_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
where CUST_ID != 5 ;  -- เงื่อนไข ที่ column CUST_ID != 5 or CUST_ID != 9

select i.first_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
where CUST_ID in (5, 9, 1, 2);  -- เงื่อนไข ที่ column CUST_ID เท่ากับ 5, 9, 1, 2

select i.first_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
where FIRST_NAME = 'john' and CUST_ID > 5 ; -- เงื่อนไข column FIRST_NAME = 'john' และ column CUST_ID > 5

select i.first_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
where (FIRST_NAME = 'john' and CUST_ID > 5) or CUST_ID = 2 ;

select i.first_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
order by first_name asc; -- เรียง column first_name  asc คือ น้อยไปมา a-z. desc คือ มากไปน้อย z-a

select i.first_name, i.last_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
order by first_name asc, last_name desc; -- เรียง column first_name แบบ asc ก่อน แล้วถ้ามีอะไรซ้ำกันก็เรียงตาม column last_name แบบ desc

select i.first_name, i.last_name, i.cust_id  -- เลือก column
from INDIVIDUAL i -- จาก table ไหน
where cust_id > 4 -- เงื่อนไข column cust_id > 4
order by first_name asc, last_name desc; -- เรียง column first_name แบบ asc ก่อน แล้วถ้ามีอะไรซ้ำกันก็เรียงตาม column last_name แบบ desc

-- from => where => select => order by

select distinct(first_name) -- เลือก column first_name distinct(column) คือ เอา value ออกมาแต่ไม่ค่าที่ซ้ำออกมา
from INDIVIDUAL ;

select * -- เลือกทุก column
from account -- จาก table account
order by pending_balance desc -- เรียง column pending_balance แบบ desc
limit 5 -- เอามาแค่ 5 แถว
offset 3; -- ข้าม 3 แถว

select * 
from account
limit 3, 5; -- offset 3  limit 5   เขียนแบบย่อ


select *
from account
where open_branch_id = 2 -- เงื่อนไข column open_branch_id = 2
order by avail_balance desc -- เรียง column avail_balance แบบ desc
limit 5; -- เลือกมา 5 แถวแรก

-- from => where => select => order by => limit

select *
from INDIVIDUAL
where first_name like 'j%'; -- เงื่อนไข column first_name like 'j%'  % คือ เป็นอะไรก็ได้กี่ตัวก็ได้

select *
from INDIVIDUAL
where first_name like '_____'; -- เงื่อนไข column first_name like '_____'  _ คือ เป็นอะไรก็ได้ เป็นได้ 1 ตัว

select *
from INDIVIDUAL
where first_name like '_o%'; -- ตัวแรกเป็นอะไรก็ได้ 1 ตัว  ตัวที่ 2 เป็น o  % เป็นอะไรก็ได้ กี่ตัวก็ได้



--
--
--
use cc16_banking;
select count(*) -- นับจำนวนของทุก column
from account;

select count(close_date) -- นับเฉพาะ column close_date อันไหนเป็น null ก็จะไม่นับ
from account;

select count(*)
from account 
where avail_balance < 10000;

select count(distinct(first_name)) as total -- as คือ ตั้งชื่อให้ column
from individual;

select sum(avail_balance) as total -- sum คือ หาผลรวม
from account;

select sum(avail_balance * cust_id) -- เอามาคูณกันก่อน แล้วค่อยเอามา sum
from account;

select avg(avail_balance) -- avg คือ หาค่าเฉลี่ย
from account;

select max(avail_balance) -- max ค่าค่าที่มากที่สุด
from account;

select min(avail_balance) -- min ค่าค่าที่น้อยที่สุด
from account;

select max(avail_balance)
from account 
where avail_balance < 10000;  -- หาค่า avail_balance ที่มากที่สุดแต่น้อยกว่า 10000

select concat_ws(' - ', first_name, last_name) fullname -- concat_ws('เชื่อมด้วยอะไร', value, value)
from individual;

select format(123456.12121212, 2); -- ทศนิยม 2 ตำแหน่ง
select format(avg(avail_balance), 2) as avg
from account;


--
--
-- group by
select count(*), cust_id
from account
group by cust_id; -- จัดกลุ่มตาม value ใน column cust_id

select sum(avail_balance), avg(avail_balance), max(avail_balance), min(avail_balance), count(avail_balance), cust_id
from account
group by cust_id
order by sum(avail_balance) desc;

select sum(avail_balance) balance, avg(avail_balance) average, max(avail_balance) max, min(avail_balance) min, count(avail_balance) count, cust_id
from account
group by cust_id
order by sum(avail_balance) desc
limit 5;

select cust_id, sum(avail_balance) balance
from account
where avail_balance < 10000
group by cust_id
order by balance
limit 5;

-- from => where => group by => select => order by => limit

select cust_id, sum(avail_balance) balance
from account 
group by cust_id 
having balance > 10000;  -- having จะใช้กับ aggregate function sum, max, min, avg, count

select cust_id, sum(avail_balance) balance
from account 
where avail_balance < 10000
group by cust_id 
having balance > 1000
order by balance desc
limit 5;  -- having จะใช้กับ aggregate function sum, max, min, avg, count

-- from => where => group by => having => select => order by => limit

--
--
-- join
use cc16_banking;
select i.first_name, i.last_name , a.avail_balance, i.cust_id -- ถ้าชื่อ column ไม่ซ้ำกัน ไม่ต้อง . ก็ได้
from individual i inner join account a on i.cust_id = a.cust_id; -- inner join คือ ต้องมีทั้ง 2 ตาราง

select i.first_name, i.last_name , i.cust_id , sum(a.avail_balance) balance
from individual i join account a on i.cust_id = a.cust_id -- inner join ไม่ต้องเขียน join ก็ได้
group by i.cust_id
order by balance desc;

select i.first_name, i.last_name , i.cust_id i_cust_id, a.cust_id a_cust_id
from individual i right join account a on i.cust_id = a.cust_id; -- right join คือ เอา table ขวาเป็ยหลัก

select i.first_name, i.last_name , i.cust_id i_cust_id, a.cust_id a_cust_id
from individual i right join account a on i.cust_id = a.cust_id
where a.cust_id > 8;

select i.first_name, i.last_name , i.cust_id i_cust_id, a.cust_id a_cust_id
from individual i left join account a on i.cust_id = a.cust_id; -- left join

select *
from individual i cross join account a ; -- cross join

select *
from individual i, account a, customer c ; -- ไม่เขียน cross join แต่ต้องมี ,

select i.first_name, i.last_name, c.address, c.city, a.avail_balance
from individual i join customer c on i.cust_id = c.cust_id join account a on i.cust_id = a.cust_id;










