-- LAB 5 SQL

-- 1. Drop column picture from staff. CHECK 
use sakila;
select * from staff;
alter table staff
drop column picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer where first_name regexp ("Tammy");
select * from staff;
insert into staff
values (3, "Tammy","Sanders",5,"abc@abc.de",1,1,"Tammy","abcdefgh","2006-02-15 03:57:16");

Update staff set email = "Tammy.Sanders@sakilastaff.com" where staff_id = 3; -- just updating the data to a diff email
select * from staff;


-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

select * from rental limit 100000;
insert into rental
values (
16050,
"2022-08-24 13:43:12",
9,
130,
"2022-08-31 13:43:12",
1,
"2022-08-24 13:43:12");

-- select inventory_id from sakila.invetory where film_id = 1; -- looking for inventory_id
-- select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- looking for customer id
-- select staff_id from sakila.staff where first_name = 'Mike' and last_name = 'Hillyer'    - looking for staff id


-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

-- Check if there are any non-active users
use sakila;
select count(*) from customer where active = 0; -- assume 0 is inactive

-- Create a table backup table as suggested

use sakila;
create table deleted_users(
customer_id int UNIQUE NOT NULL,
email char(150) default null,
dateuser date default null,
constraint primary key (customer_id));


-- Insert the non active users in the table backup table
insert into deleted_users (customer_id, email, dateuser) -- basically here i am trying to directly insert data from the customer table into the newly created table, not working though 
select customer_id, left(email,6),create_date from customer where active = 0;

select * from deleted_users ;

select customer_id, email, create_date from customer where active = 0; -- assume 0 is inactive

-- Delete the non active users from the table customer

delete from customer where active = 0;





