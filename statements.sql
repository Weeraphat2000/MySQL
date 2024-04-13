SELECT * FROM cashflowtacker.statements;

select sum(amount) sum, TransactionType, date(createdAt) as date
                    from statements s inner join categorys c on s.category_id = c.id
                    where (user_id = 2 and createdAt between '2024-01-01' and '2024-02-21') or (user_id = 2 and createdAt = '2024-01-01T15:26:08.000Z') or (user_id = 2 and createdAt = '2024-02-21')
                    group by TransactionType, date(createdAt)
                    order by date(createdAt) asc;


select sum(amount) sum, TransactionType, date(createdAt) as date
                from statements s inner join categorys c on s.category_id = c.id
                where user_id = 1 and createdAt between '2024-01-01' and '2024-12-12'
                group by TransactionType, date(createdAt)
                order by date(createdAt) asc;

select sum(amount) sum, TransactionType, month(createdAt) as date
                    from statements s inner join categorys c on s.category_id = c.id
                    where year(createdAt) = year(current_date()) and user_id = 36
                    group by month(createdAt), TransactionType
                    order by month(createdAt) asc;

select sum(amount) sum, TransactionType, monthname(createdAt) as month
                from statements s inner join categorys c on s.category_id = c.id
                where year(createdAt) = year(current_date()) and user_id = 36
                group by TransactionType, monthname(createdAt)
                order by monthname(createdAt);


select sum(amount) sum, category_name
                from statements s inner join categorys c on s.category_id = c.id
                where date(createdAt) = date(current_date()) and user_id = 36
                group by category_name
                order by date(createdAt);


select sum(amount),TransactionType,  date(createdAt)
from statements s inner join categorys c on s.category_id = c.id
where month(createdAt) = month(CURRENT_DATE()) and user_id = 36 
group by date(createdAt), TransactionType
order by date(createdAt);

-- ดูเฉพาะวัน group by category_id
select sum(amount), category_name, transactionType
from statements s inner join categorys c on s.category_id = c.id
where date(createdAt) = date(CURRENT_DATE()) and user_id = 36 
group by category_id, TransactionType;

select *
from statements s inner join categorys c on s.category_id = c.id
where date(createdAt) = date(CURRENT_DATE()) and user_id = 36
group by category_id;

select sum(amount) sum, category_name
from statements s inner join categorys c on s.category_id = c.id
where month(createdAt) = month(current_date()) and user_id = 36;



-- ดูเฉพาะวัน group by transactionType
select sum(amount), transactionType
from statements s inner join categorys c on s.category_id = c.id
where date(createdAt) = date(CURRENT_DATE()) and user_id = 36
group by transactionType;






-- ดึงเฉพาะ เดือน
SELECT * 
FROM statements 
WHERE MONTH(createdAt) = MONTH(CURRENT_DATE());

-- ดึงเอาทุกอย่างออกมา เฉพาะเดือน
SELECT * 
FROM statements s inner join categorys c on s.category_id = c.id  
WHERE MONTH(createdAt) = MONTH(CURRENT_DATE()) and user_id = 30;

-- ดึงเฉาพเดือนแบบ sum มาให้แล้ว
select transactionType, sum(amount) 
from statements s inner join categorys c on s.category_id = c.id
where month(createdAt) = month(current_date()) and user_id = 30
group by transactionType;





SELECT 
    DATE(createdAt) AS date,
    SUM(amount) AS sum
from statements s inner join categorys c on s.category_id = c.id
WHERE 
    YEAR(createdAt) = YEAR(CURRENT_DATE()) AND MONTH(createdAt) = MONTH(CURRENT_DATE()) and user_id = 36
GROUP BY 
    DATE(createdAt);
    
    
SELECT 
    MONTHNAME(createdAt) AS Month,
    TransactionType,
    AmountType,
    SUM(amount) AS TotalAmount
from statements s inner join categorys c on s.category_id = c.id
GROUP BY 
    MONTH(createdAt),
    TransactionType,
    AmountType;






