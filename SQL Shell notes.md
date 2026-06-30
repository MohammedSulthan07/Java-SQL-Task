# SQL Shell notes





**show databases;**



+--------------------+

| Database           |

+--------------------+

| emp                |

| employee           |

| information\_schema |

| mydatabase         |

| mysql              |

| owner\_pet\_details  |

| performance\_schema |

| pet\_db             |

| problem            |

| salesdb            |

| student            |

| student\_db         |

| sys                |

+--------------------+



13 rows in set (0.0044 sec)





### creating table



**create table customer(customer\_id int primary key, name varchar(20), city varchar(15));**

Query OK, 0 rows affected (0.0408 sec)



**alter table customer rename column name to customer\_name;**

Query OK, 0 rows affected (0.0324 sec)



Records: 0  Duplicates: 0  Warnings: 0



&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > **desc customer;**

+---------------+-------------+------+-----+---------+-------+

| Field         | Type        | Null | Key | Default | Extra |

+---------------+-------------+------+-----+---------+-------+

| customer\_id   | int         | NO   | PRI | NULL    |       |

| customer\_name | varchar(20) | YES  |     | NULL    |       |

| city          | varchar(15) | YES  |     | NULL    |       |

+---------------+-------------+------+-----+---------+-------+

3 rows in set (0.0028 sec)



**desc customer;**

+-------------+-------------+------+-----+---------+-------+

| Field       | Type        | Null | Key | Default | Extra |

+-------------+-------------+------+-----+---------+-------+

| customer\_id | int         | NO   | PRI | NULL    |       |

| name        | varchar(20) | YES  |     | NULL    |       |

| city        | varchar(15) | YES  |     | NULL    |       |

+-------------+-------------+------+-----+---------+-------+

3 rows in set (0.0045 sec)



**show tables;**

+----------------------+

| Tables\_in\_mydatabase |

+----------------------+

| books                |

| customer             |

| customers            |

| members              |

| orders               |

| persons              |

| students             |

+----------------------+

7 rows in set (0.0042 sec)



**create table customer(customer\_id int primary key auto\_increment, customer\_name varchar(20), city varchar(15), mobile varchar(15) unique);**

Query OK, 0 rows affected (0.0720 sec)



desc customer;

+---------------+-------------+------+-----+---------+----------------+

| Field         | Type        | Null | Key | Default | Extra          |

+---------------+-------------+------+-----+---------+----------------+

| customer\_id   | int         | NO   | PRI | NULL    | auto\_increment |

| customer\_name | varchar(20) | YES  |     | NULL    |                |

| city          | varchar(15) | YES  |     | NULL    |                |

| mobile        | varchar(15) | YES  | UNI | NULL    |                |

+---------------+-------------+------+-----+---------+----------------+

4 rows in set (0.0040 sec)



**insert into customer(customer\_name,city,mobile) values ('Ai','Tokyo',8778192240), ('MS','Chennai',8778145510), ('Rem','isekai',1234567891);**

Query OK, 3 rows affected (0.0106 sec)



select \* from customer;

+-------------+---------------+---------+------------+

| customer\_id | customer\_name | city    | mobile     |

+-------------+---------------+---------+------------+

|           1 | Ai            | Tokyo   | 8778192240 |

|           2 | MS            | Chennai | 8778145510 |

|           3 | Rem           | isekai  | 1234567891 |

+-------------+---------------+---------+------------+

3 rows in set (0.0017 sec)



**create table sales\_details(sale\_id int primary key auto\_increment, customer\_id int not null,product\_name varchar(50),quantity int default 1, amount decimal(10,2), foreign key(customer\_id) references customer(customer\_id));**

Query OK, 0 rows affected (0.0664 sec)



**desc sales\_details;**

+--------------+---------------+------+-----+---------+----------------+

| Field        | Type          | Null | Key | Default | Extra          |

+--------------+---------------+------+-----+---------+----------------+

| sale\_id      | int           | NO   | PRI | NULL    | auto\_increment |

| customer\_id  | int           | NO   | MUL | NULL    |                |

| product\_name | varchar(50)   | YES  |     | NULL    |                |

| quantity     | int           | YES  |     | 1       |                |

| amount       | decimal(10,2) | YES  |     | NULL    |                |

+--------------+---------------+------+-----+---------+----------------+

5 rows in set (0.0051 sec)



**insert into sales\_details(customer\_id,product\_name,quantity,amount) values (1,'Laptop',1,55000), (1,'Mouse',2,1200), (2,'Keyboard',1,1800),(3,'Monitor',2,24000),(3,'Pen Drive',3,1800);**

Query OK, 5 rows affected (0.0113 sec)



Records: 5  Duplicates: 0  Warnings: 0



**select \* from sales\_details;**

+---------+-------------+--------------+----------+----------+

| sale\_id | customer\_id | product\_name | quantity | amount   |

+---------+-------------+--------------+----------+----------+

|       1 |           1 | Laptop       |        1 | 55000.00 |

|       2 |           1 | Mouse        |        2 |  1200.00 |

|       3 |           2 | Keyboard     |        1 |  1800.00 |

|       4 |           3 | Monitor      |        2 | 24000.00 |

|       5 |           3 | Pen Drive    |        3 |  1800.00 |

+---------+-------------+--------------+----------+----------+

5 rows in set (0.0019 sec)



&#x20;**show create table sales\_details;**

+---------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

| Table         | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

+---------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

| sales\_details | CREATE TABLE `sales\_details` (

&#x20; `sale\_id` int NOT NULL AUTO\_INCREMENT,

&#x20; `customer\_id` int NOT NULL,

&#x20; `product\_name` varchar(50) DEFAULT NULL,

&#x20; `quantity` int DEFAULT '1',

&#x20; `amount` decimal(10,2) DEFAULT NULL,

&#x20; PRIMARY KEY (`sale\_id`),

&#x20; KEY `customer\_id` (`customer\_id`),

&#x20; CONSTRAINT `sales\_details\_ibfk\_1` FOREIGN KEY (`customer\_id`) REFERENCES `customer` (`customer\_id`)

) ENGINE=InnoDB AUTO\_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4\_0900\_ai\_ci |

+---------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+



1 row in set (0.0027 sec)



alter table sales\_details drop foreign key sales\_details\_ibfk\_1;

Query OK, 0 rows affected (0.0216 sec)



Records: 0  Duplicates: 0  Warnings: 0



\-- create a table student with id as auto increment, regno as primary key, name, email, dob;

\-- create a table called dept in that dept\_id as auto increment, regno as foreign key from student table, dept\_name

and perform on delete cascade on reference table;



create table dept (dept\_id int auto\_increment , regno varchar(30),dept\_name varchar(15), foregin key(regno) references student(regno));

ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'key(regno) references student(regno))' at line 1

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > create table dept (dept\_id int auto\_increment , regno varchar(30),dept\_name varchar(15), foreign key(regno) references student(regno));

ERROR: 1075: Incorrect table definition; there can be only one auto column and it must be defined as a key

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > create table dept (dept\_id int auto\_increment unique, regno varchar(30),dept\_name varchar(15), foreign key(regno) references student(regno));

Query OK, 0 rows affected (0.0707 sec)



desc student;

+-------+-------------+------+-----+---------+----------------+

| Field | Type        | Null | Key | Default | Extra          |

+-------+-------------+------+-----+---------+----------------+

| id    | int         | NO   | UNI | NULL    | auto\_increment |

| regno | varchar(30) | NO   | PRI | NULL    |                |

| name  | varchar(20) | YES  |     | NULL    |                |

| email | varchar(20) | YES  |     | NULL    |                |

| dob   | date        | YES  |     | NULL    |                |

+-------+-------------+------



desc dept;

+-----------+-------------+------+-----+---------+----------------+

| Field     | Type        | Null | Key | Default | Extra          |

+-----------+-------------+------+-----+---------+----------------+

| dept\_id   | int         | NO   | PRI | NULL    | auto\_increment |

| regno     | varchar(30) | YES  | MUL | NULL    |                |

| dept\_name | varchar(15) | YES  |     | NULL    |                |

+-----------+-------------+------+-----+---------+----------------+

3 rows in set (0.0046 sec)



insert into student(regno,name,email,dob) values(4071,'Ai','msulthan139@gmail.com','2005-09-13')(4072,'MS','ms@gmail.com','2005-08-13')(4073,'Rem','remrezeo@gmail.com','2007-06-12');

ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(4072,'MS','ms@gmail.com','2005-08-13')(4073,'Rem','remrezeo@gmail.com','2007-06' at line 1

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > insert into student(regno,name,email,dob) values(4071,'Ai','msulthan139@gmail.com','2005-09-13'),(4072,'MS','ms@gmail.com','2005-08-13')(4073,'Rem','remrezeo@gmail.com','2007-06-12');

ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(4073,'Rem','remrezeo@gmail.com','2007-06-12')' at line 1

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > insert into student(regno,name,email,dob) values(4071,'Ai','msulthan139@gmail.com','2005-09-13'),(4072,'MS','ms@gmail.com','2005-08-13'),(4073,'Rem','remrezeo@gmail.com','2007-06-12');

ERROR: 1406: Data too long for column 'email' at row 1

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > insert into student(regno,name,email,dob) values(4071,'Ai','msulthan@gmail.com','2005-09-13'),(4072,'MS','ms@gmail.com','2005-08-13'),(4073,'Rem','remrezeo@gmail.com','2007-06-12');

Query OK, 3 rows affected (0.0103 sec)



Records: 3  Duplicates: 0  Warnings: 0



&#x20;select \* from student;

+----+-------+------+--------------------+------------+

| id | regno | name | email              | dob        |

+----+-------+------+--------------------+------------+

|  1 | 4071  | Ai   | msulthan@gmail.com | 2005-09-13 |

|  2 | 4072  | MS   | ms@gmail.com       | 2005-08-13 |

|  3 | 4073  | Rem  | remrezeo@gmail.com | 2007-06-12 |

+----+-------+------+--------------------+------------+

3 rows in set (0.0017 sec)



insert into dept(regno , dept\_name) values( '4071','CSE'),('4072','CSE'),('4073','AI\&DS');

Query OK, 3 rows affected (0.0122 sec)



Records: 3  Duplicates: 0  Warnings: 0

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from dept;

+---------+-------+-----------+

| dept\_id | regno | dept\_name |

+---------+-------+-----------+

|       1 | 4071  | CSE       |

|       2 | 4072  | CSE       |

|       3 | 4073  | AI\&DS     |

+---------+-------+-----------+

3 rows in set (0.0017 sec)



&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > show create table dept;

+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                |

+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

| dept  | CREATE TABLE `dept` (

&#x20; `dept\_id` int NOT NULL AUTO\_INCREMENT,

&#x20; `regno` varchar(30) DEFAULT NULL,

&#x20; `dept\_name` varchar(15) DEFAULT NULL,

&#x20; UNIQUE KEY `dept\_id` (`dept\_id`),

&#x20; KEY `regno` (`regno`),

&#x20; CONSTRAINT `dept\_ibfk\_1` FOREIGN KEY (`regno`) REFERENCES `student` (`regno`)

) ENGINE=InnoDB AUTO\_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4\_0900\_ai\_ci |

+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

1 row in set (0.0020 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > alter table dept drop foreign key dept\_ibfk\_1;

Query OK, 0 rows affected (0.0229 sec)



Records: 0  Duplicates: 0  Warnings: 0

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > delete from student where id=3;

Query OK, 1 row affected (0.0109 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from student;

+----+-------+------+--------------------+------------+

| id | regno | name | email              | dob        |

+----+-------+------+--------------------+------------+

|  1 | 4071  | Ai   | msulthan@gmail.com | 2005-09-13 |

|  2 | 4072  | MS   | ms@gmail.com       | 2005-08-13 |

+----+-------+------+--------------------+------------+

2 rows in set (0.0014 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from dept;

+---------+-------+-----------+

| dept\_id | regno | dept\_name |

+---------+-------+-----------+

|       1 | 4071  | CSE       |

|       2 | 4072  | CSE       |

|       3 | 4073  | AI\&DS     |

+---------+-------+-----------+

3 rows in set (0.0013 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > delete from dept where dept\_id=3;

Query OK, 1 row affected (0.0083 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from dept;

+---------+-------+-----------+

| dept\_id | regno | dept\_name |

+---------+-------+-----------+

|       1 | 4071  | CSE       |

|       2 | 4072  | CSE       |

+---------+-------+-----------+

2 rows in set (0.0015 sec)



\-------------------------------------------------------------------------------------------------------------------------------------------------------------New



&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > show tables;

+----------------------+

| Tables\_in\_mydatabase |

+----------------------+

| books                |

| customer             |

| customers            |

| dept                 |

| members              |

| orders               |

| persons              |

| sales\_details        |

| student              |

| students             |

+----------------------+

10 rows in set (0.0355 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from customer;

+-------------+---------------+---------+------------+

| customer\_id | customer\_name | city    | mobile     |

+-------------+---------------+---------+------------+

|           1 | Ai            | Tokyo   | 8778192240 |

|           2 | MS            | Chennai | 8778145510 |

+-------------+---------------+---------+------------+

2 rows in set (0.0020 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > drop database mydatabas;

ERROR: 1008: Can't drop database 'mydatabas'; database doesn't exist

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > drop database mydatabase;

Query OK, 10 rows affected (0.2365 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > show databases;

+--------------------+

| Database           |

+--------------------+

| emp                |

| employee           |

| information\_schema |

| mydatabase         |

| mysql              |

| owner\_pet\_details  |

| performance\_schema |

| pet\_db             |

| problem            |

| salesdb            |

| student            |

| student\_db         |

| sys                |

+--------------------+

13 rows in set (0.0039 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > use mydatabase;

Default schema set to `mydatabase`.

Fetching global names, object names from `mydatabase` for auto-completion... Press ^C to stop.

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > show tables;

+----------------------+

| Tables\_in\_mydatabase |

+----------------------+

| customers            |

| orders               |

+----------------------+

2 rows in set (0.0037 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from customers;

+----+------------+---------+-------+

| id | first\_name | country | score |

+----+------------+---------+-------+

|  1 | Maria      | Germany |   350 |

|  2 |  John      | USA     |   900 |

|  3 | Georg      | UK      |   750 |

|  4 | Martin     | Germany |   500 |

|  5 | Peter      | USA     |     0 |

+----+------------+---------+-------+

5 rows in set (0.0021 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from orders;

+----------+-------------+------------+-------+

| order\_id | customer\_id | order\_date | sales |

+----------+-------------+------------+-------+

|     1001 |           1 | 2021-01-11 |    35 |

|     1002 |           2 | 2021-04-05 |    15 |

|     1003 |           3 | 2021-06-18 |    20 |

|     1004 |           6 | 2021-08-31 |    10 |

+----------+-------------+------------+-------+

4 rows in set (0.0014 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from customers inner join orders on id=customer\_id;

+----+------------+---------+-------+----------+-------------+------------+-------+

| id | first\_name | country | score | order\_id | customer\_id | order\_date | sales |

+----+------------+---------+-------+----------+-------------+------------+-------+

|  1 | Maria      | Germany |   350 |     1001 |           1 | 2021-01-11 |    35 |

|  2 |  John      | USA     |   900 |     1002 |           2 | 2021-04-05 |    15 |

|  3 | Georg      | UK      |   750 |     1003 |           3 | 2021-06-18 |    20 |

+----+------------+---------+-------+----------+-------------+------------+-------+

3 rows in set (0.0048 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select id,first\_name,orders.order\_id,orders.sales from customers inner join orders on id=customer\_id;

+----+------------+----------+-------+

| id | first\_name | order\_id | sales |

+----+------------+----------+-------+

|  1 | Maria      |     1001 |    35 |

|  2 |  John      |     1002 |    15 |

|  3 | Georg      |     1003 |    20 |

+----+------------+----------+-------+

3 rows in set (0.0020 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select

&#x20;                                            -> c.id,

&#x20;                                            -> c.first\_name,

&#x20;                                            -> o.order\_id,

&#x20;                                            -> o.sales

&#x20;                                            -> from customers as c

&#x20;                                            -> inner join orders as o

&#x20;                                            -> on c.id = o.customer\_id;

+----+------------+----------+-------+

| id | first\_name | order\_id | sales |

+----+------------+----------+-------+

|  1 | Maria      |     1001 |    35 |

|  2 |  John      |     1002 |    15 |

|  3 | Georg      |     1003 |    20 |

+----+------------+----------+-------+

3 rows in set (0.0013 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select id,first\_name,orders.order\_id,orders.sales from customers left join orders on id=customer\_id;

+----+------------+----------+-------+

| id | first\_name | order\_id | sales |

+----+------------+----------+-------+

|  1 | Maria      |     1001 |    35 |

|  2 |  John      |     1002 |    15 |

|  3 | Georg      |     1003 |    20 |

|  4 | Martin     |     NULL |  NULL |

|  5 | Peter      |     NULL |  NULL |

+----+------------+----------+-------+

5 rows in set (0.0030 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select \* from customers left join orders on id=customer\_id;

+----+------------+---------+-------+----------+-------------+------------+-------+

| id | first\_name | country | score | order\_id | customer\_id | order\_date | sales |

+----+------------+---------+-------+----------+-------------+------------+-------+

|  1 | Maria      | Germany |   350 |     1001 |           1 | 2021-01-11 |    35 |

|  2 |  John      | USA     |   900 |     1002 |           2 | 2021-04-05 |    15 |

|  3 | Georg      | UK      |   750 |     1003 |           3 | 2021-06-18 |    20 |

|  4 | Martin     | Germany |   500 |     NULL |        NULL | NULL       |  NULL |

|  5 | Peter      | USA     |     0 |     NULL |        NULL | NULL       |  NULL |

+----+------------+---------+-------+----------+-------------+------------+-------+

5 rows in set (0.0033 sec)

&#x20;MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from customers as c right join orders as o on c.id=o.customer_id;
+------+------------+----------+-------+
| id   | first_name | order_id | sales |
+------+------------+----------+-------+
|    1 | Maria      |     1001 |    35 |
|    2 |  John      |     1002 |    15 |
|    3 | Georg      |     1003 |    20 |
| NULL | NULL       |     1004 |    10 |
+------+------------+----------+-------+
4 rows in set (0.0033 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from orders as o right join customers as c on c.id=o.customer_id;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |
+----+------------+----------+-------+
5 rows in set (0.0022 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from orders as o left join customers as c on c.id=o.customer_id;
+------+------------+----------+-------+
| id   | first_name | order_id | sales |
+------+------------+----------+-------+
|    1 | Maria      |     1001 |    35 |
|    2 |  John      |     1002 |    15 |
|    3 | Georg      |     1003 |    20 |
| NULL | NULL       |     1004 |    10 |
+------+------------+----------+-------+
4 rows in set (0.0015 sec)

select c.id,c.first_name,o.order_id,o.sales from customers as c left join orders as o on c.id=o.customer_id where o.order_id is null;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |
+----+------------+----------+-------+
2 rows in set (0.0031 sec)

select c.id,c.first_name,o.order_id,o.sales from customers as c right join orders as o on c.id=o.customer_id where o.order_id is null;
Empty set (0.0029 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from customers as c right join orders as o on c.id=o.customer_id where c.id is null;
+------+------------+----------+-------+
| id   | first_name | order_id | sales |
+------+------------+----------+-------+
| NULL | NULL       |     1004 |    10 |
+------+------------+----------+-------+
1 row in set (0.0012 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from orders as o right join customers as c on c.id=o.customer_id where o.order_id is null;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |
+----+------------+----------+-------+
2 rows in set (0.0026 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from customers as c cross join orders as o;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1004 |    10 |
|  1 | Maria      |     1003 |    20 |
|  1 | Maria      |     1002 |    15 |
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1004 |    10 |
|  2 |  John      |     1003 |    20 |
|  2 |  John      |     1002 |    15 |
|  2 |  John      |     1001 |    35 |
|  3 | Georg      |     1004 |    10 |
|  3 | Georg      |     1003 |    20 |
|  3 | Georg      |     1002 |    15 |
|  3 | Georg      |     1001 |    35 |
|  4 | Martin     |     1004 |    10 |
|  4 | Martin     |     1003 |    20 |
|  4 | Martin     |     1002 |    15 |
|  4 | Martin     |     1001 |    35 |
|  5 | Peter      |     1004 |    10 |
|  5 | Peter      |     1003 |    20 |
|  5 | Peter      |     1002 |    15 |
|  5 | Peter      |     1001 |    35 |
+----+------------+----------+-------+
20 rows in set (0.0075 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL >select c.id,c.first_name,o.order_id,o.sales from customers as c left join orders as o on c.id=o.customer_id where o.customer_id is not null;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
+----+------------+----------+-------+
3 rows in set (0.0080 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select e.emp_name as Employee,m.emp_name as Manager from employees e join employees m on e.manager_id=m.emp_id;
+------------------+---------+
| Employee         | Manager |
+------------------+---------+
| Mohammed Sulthan | Ai      |
| Asuna            | Rem     |
| yuki             | Rem     |
| ruby             | Akane   |
+------------------+---------+
4 rows in set (0.0021 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from employees;
+--------+------------------+------------+--------+------------+
| emp_id | emp_name         | department | salary | manager_id |
+--------+------------------+------------+--------+------------+
|      1 | Ai               | HR         |  90000 |       NULL |
|      2 | Mohammed Sulthan | HR         |  60000 |          1 |
|      3 | Rem              | IT         |  85000 |       NULL |
|      4 | Asuna            | IT         |  55000 |          3 |
|      5 | yuki             | IT         |  50000 |          3 |
|      6 | ruby             | Sales      | 450000 |          7 |
|      7 | Akane            | Sales      |  95000 |       NULL |
+--------+------------------+------------+--------+------------+
7 rows in set (0.0022 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select e.emp_name as Employee,m.emp_name as Manager from employees e left join employees m on e.manager_id=m.emp_id;
+------------------+---------+
| Employee         | Manager |
+------------------+---------+
| Ai               | NULL    |
| Mohammed Sulthan | Ai      |
| Rem              | NULL    |
| Asuna            | Rem     |
| yuki             | Rem     |
| ruby             | Akane   |
| Akane            | NULL    |
+------------------+---------+
7 rows in set (0.0014 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL >