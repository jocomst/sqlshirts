
-- 1. insert angel
insert into rental_records (veh_reg_no, customer_id, start_date, end_date)
values ('SBA1111A', (select customer_id from customers where name='Angel'), curdate(), date_add(curdate(),interval 10 day));

-- 2.

insert into rental_records (veh_reg_no, customer_id, start_date, end_date)
values ('GA5555E', (select customer_id from customers where name='Kumar'), date_add(curdate(), interval 1 day), date_add(curdate() + 1, interval 3 month));

-- 3. 

select t1.start_date, t1.end_date, t1.veh_reg_no, t2.brand, t3.name from rental_records as t1
left join vehicles as t2 on t1.veh_reg_no = t2.veh_reg_no
left join customers as t3 on t1.customer_id = t3.customer_id
order by t2.category, t1.start_date;

-- 4. 

select * from rental_records
where end_date < curdate();

-- 5. 

select t2.name, veh_reg_no, t1.start_date, t1.end_date from rental_records as t1
left join customers as t2 on t1.customer_id = t2.customer_id
where start_date < '2012-01-10' and end_date > '2012-01-10'
order by t1.start_date;

-- 6. 

select  t2.name, veh_reg_no, t1.start_date, t1.end_date from rental_records as t1
left join customers as t2 on t1.customer_id = t2.customer_id
where (start_date <= curdate() and end_date > curdate()) 
order by t1.start_date;

-- 7. 

select  t2.name, veh_reg_no, t1.start_date, t1.end_date from rental_records as t1
left join customers as t2 on t1.customer_id = t2.customer_id
where (start_date >= '2012-01-03' and start_date <= '2012-01-18') or (end_date <= '2012-01-18' and end_date >= '2012-01-03')  or (start_date <= '2012-01-03' and end_date >= '2012-01-18')
order by t1.start_date;

-- 8. 

SELECT 
    t1.veh_reg_no, t1.brand, t1.`desc`
FROM
    vehicles AS t1
        left JOIN
    rental_records AS t2 ON t1.veh_reg_no = t2.veh_reg_no
WHERE
    t1.veh_reg_no NOT IN (SELECT 
            veh_reg_no
        FROM
            rental_records
        WHERE
            (start_date <= '2012-01-10' and end_date >= '2012-01-10');


-- 9.

SELECT 
    t1.veh_reg_no, t1.brand, t1.`desc`
FROM
    vehicles AS t1
        LEFT JOIN
    rental_records AS t2 ON t1.veh_reg_no = t2.veh_reg_no
WHERE
    t1.veh_reg_no NOT IN (SELECT 
            veh_reg_no
        FROM
            rental_records
        WHERE
            (start_date >= '2012-01-03'
                AND start_date <= '2012-01-18')
                OR (end_date <= '2012-01-18'
                AND end_date >= '2012-01-03')
                OR (start_date <= '2012-01-03'
                AND end_date >= '2012-01-18'));

-- 10. 


SELECT 
    t1.veh_reg_no, t1.brand, t1.`desc`
FROM
    vehicles AS t1
        LEFT JOIN
    rental_records AS t2 ON t1.veh_reg_no = t2.veh_reg_no
WHERE
    t1.veh_reg_no NOT IN (SELECT 
            veh_reg_no
        FROM
            rental_records
        WHERE
            start_date BETWEEN CURDATE() AND CURDATE() + 10
                OR end_date BETWEEN CURDATE() AND CURDATE() + 10);