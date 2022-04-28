-- first step
create database shirts_db;

--second step
create table shirts (shirt_id int not null auto_increment, article varchar(15), color varchar(15), shirt_size varchar(5), last_worn int, primary key (shirt_id));

-- 1. adding data into db / third step
insert into shirts (article, color, shirt_size, last_worn)
values ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

-- 2. adding new data
insert into shirts (article, color, shirt_size, last_worn)
values ('t-shirt', 'purple', 'M', 50);

-- 3. select article and color
select article, color from shirts;

-- 4. medium shirts and values
select article, color, shirt_size, last_worn from shirts where shirt_size='M';

-- 5. update polos to L
update shirts
set shirt_size='L'
where article='polo shirt';

-- 6. update last worn 15 days

update shirts 
set last_worn=0
where last_worn=15;

-- 7. update white shirts
update shirts
set shirt_size='XS', color='off white'
where color='white';

-- 8. delete old shirts last worn 200
delete from shirts 
where last_worn=200;

-- 9. delete all tank tops
delete from shirts
where article='tank top';

-- 10. delete all shirts
delete from shirts;

-- 11. drop table
drop table shirts;