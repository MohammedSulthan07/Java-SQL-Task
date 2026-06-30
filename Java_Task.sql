use mydatabase;

-- Creating the Table (Constraints)
create table Books (
    book_id int auto_increment primary key,
    title varchar(100) not null,
    isbn varchar(20) unique,
    price decimal(8,2),
    published_date date,
    in_stock int default 1
);

-- Inserting Data
insert into Books (title, isbn, price, published_date, in_stock) values
('Jujutsu Kaisen', 'ISBN0001', 500.00, '2018-09-30', 12),
('Attack On Titan', 'ISBN0002', 600.00, '2014-02-15', 7),
('Chainsaw Man', 'ISBN0003', 750.00, '2012-01-02', 2),
('Demon Slayer', 'ISBN0004', 800.00, '2019-04-05', 0);

insert into Books (title, isbn, price, published_date) values ('Spy X Family', 'ISBN0005', 450.00, '2015-09-21');

-- extra
select * from Books;

-- Renaming a Column
alter table Books rename column title to manga_title;

-- Changing a Column's Data Type
alter table Books modify column price float;

-- Adding a New Column with a Constraint
alter table Books add column author_name varchar(50) not null default 'Unknown';

-- Updating Existing Data
update Books set price = price * 0.90 where published_date < '2020-01-01';

-- Deleting Specific Records
delete from Books where in_stock = 0;

-- Resetting the Auto-Increment Value
alter table Books auto_increment = 101;

-- Conditional SELECT with Pattern Matching
select manga_title, price, published_date from Books where manga_title like '%Attack%' and price > 300 order by price desc;

-- Working with a Second Table (Joins-ready setup)
create table Members (
    member_id int auto_increment primary key,
    member_name varchar(100) not null,
    join_date date not null default (curdate())
);

insert into Members (member_name, join_date) values 
('Ai', '2024-01-15'),
('Mohammed Sulthan', '2024-03-20'),
('Rem', '2023-09-18'),
('Alice', '2024-07-10');

select * from Members where year(join_date) = 2024 order by member_name asc;
