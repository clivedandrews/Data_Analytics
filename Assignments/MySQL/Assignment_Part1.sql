# -----------------------------------------------------#
# ASSIGNMENT PART 1 #
# -----------------------------------------------------#


# -----------------------------------------------------#
# TASK 1. create a database called 'assignment' (Note please do the assignment tasks in this database)
# -----------------------------------------------------#

show databases; # This command is show all the current databases
# drop database assignment;	# This command will drop any database with the name "assignment" if already existing
create database assignment;	# This command is to create a database with the name "assignment"
use assignment; 		# This command will help us use the database assignment i.e., ensuring the correct database 'assignment' is selected and is active.
show tables;			# This will show the tables created. There are none currently at this step

# -----------------------------------------------------#
# TASK 2. Create the tables from ConsolidatedTables.sql and enter the records as specified in it.
# -----------------------------------------------------#

# We start by ensuring that the correct Database is selected as the active database by using the below command
use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# Done creating the following tables from the ConsolidatedTables.sql - city, customers, emp, employee, movies, orderdetails, orders, payments, productlines, products, rentals, station, students

show tables;			# This will show the tables created. There are none currently at this step

# -----------------------------------------------------#
# TASK 3. Create a table called countries with the following columns
# 		a) Insert the following data into the table
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

create table countries(name varchar(100), population int, capital varchar(100));

# truncate table countries; # Just to clear all entries in this table to re-enter fresh entries once again

insert into countries values
("China ","1382","Beijing"),
("India","1326","Delhi"),
("United States","324","Washington D.C."),
("Indonesia","260","Jakarta"),
("Brazil","209","Brasilia"),
("Pakistan","193","Islamabad"),
("Nigeria","187","Abuja"),
("Bangladesh","163","Dhaka"),
("Russia","143","Moscow"),
("Mexico","128","Mexico City"),
("Japan","126","Tokyo"),
("Philippines","102","Manila"),
("Ethiopia","101","Addis Ababa"),
("Vietnam ","94","Hanoi"),
("Egypt","93","Cairo"),
("Germany","81","Berlin"),
("Iran","80","Tehran"),
("Turkey","79","Ankara"),
("Congo","79","Kinshasa"),
("France","64","Paris"),
("United Kingdom","65","London"),
("Italy","60","Rome"),
("South Africa","55","Pretoria"),
("Myanmar","54","Naypyidaw");

select * from countries;

# -----------------------------------------------------#
# TASK 3. Create a table called countries
# 		b) Add a couple of countries of your choice
# -----------------------------------------------------#

# Added 19 more country details based on my choice

insert into countries values
("Denmark","31","Copenhagen"),
("Hungary","73","Budapest"),
("Italy","178","Rome"),
("Netherlands","87","Amsterdam"),
("Norway","68","Oslo"),
("Poland","77","Warsaw"),
("Portugal","25","Lisbon"),
("Spain","152","Madrid"),
("Sweden","55","Stockholm"),
("Switzerland","6","Bern"),
("Ukraine","96","Kyiv"),
("Algeria","71","Algiers"),
("Angola","57","Luanda"),
("Benin","16","Porto-Novo"),
("Botswana","13","Gaborone"),
("Cameroon","76","Yaounde"),
("Egypt","253","Cairo"),
("Ethiopia","135","Addis Ababa"),
("Australia","23","Canberra");

select * from countries; # Total entries are 43 now after adding the 19 new entries

# -----------------------------------------------------#
# TASK 3. For the table countries
# 		c) Change ‘Delhi' to ‘New Delhi'
# -----------------------------------------------------#

UPDATE countries    
SET capital = 'New Delhi' where name = 'India';

select * from countries where name = 'India'; 	# For cross checking the change from 'Delhi' to 'New Delhi'


# -----------------------------------------------------#
# TASK 4. Rename the table countries to big_countries
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

rename table countries to big_countries;
show tables; # Just checking to ensure that countries has been changed to big_countries

# -----------------------------------------------------#
# TASK 5. Create the following tables. Use auto increment wherever applicable
# -----------------------------------------------------#

# -----------------------------------------------------#
# These commands are added here in case we need to drop some tables,
# in case of an error and recreate tables from scratch
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# drop table product;
# drop table Suppliers;
# drop table Stock;

# -------------#
# METHOD 1: Creation of the Product Table and later altering the Foreign key
# -------------#

create table Product(
product_id int primary key not null auto_increment, 
product_name varchar(100) unique not null, 
description varchar(300), 
supplier_id int
);

create table Suppliers(
supplier_id int primary key not null auto_increment, 
supplier_name varchar(100), 
location varchar(100)
);

alter table Product
add constraint p_check_1
foreign key (supplier_id)
references Suppliers(supplier_id);

alter table Product
auto_increment=200;

desc Product;
desc Suppliers;


# -------------#
# METHOD 2: Creation of the Supplier Table first and later creating the Product table with the Foreign key
# -------------#

# create table Suppliers(
# supplier_id int primary key not null auto_increment, 
# supplier_name varchar(100), 
# location varchar(100)
# );

# create table Product(
# product_id int primary key not null auto_increment, 
# product_name varchar(100) unique not null, 
# description varchar(300), 
# supplier_id int,
# foreign key (supplier_id)
# references Suppliers(supplier_id)
# );

# alter table Product
# auto_increment=200;

# -----------------------------------------------------#

create table Stock(
id int primary key, 
product_id int, 
balance_stock int
);

# -----------------------------------------------------#
# These commands are to check the attributes for the tables created
# -----------------------------------------------------#
desc Product;
desc Suppliers;
desc Stock;



# -----------------------------------------------------#
# TASK 6. Enter some records into the three tables.
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# Just in case we need to remove all entries from the table Suppliers to re-enter fresh data
# -----------------------------------------------------#
# truncate table Suppliers;

# Entering fresh records into the table Stock
# -----------------------------------------------------#
# Note: The supplier_id will be auto incremented from 1 as the default value
insert into Suppliers (supplier_name, location) values
("Anil Trading","Kharkhana, Hyderabad"),
("Vishal Megamart","Housing Board, Jodhpur"),
("Mehta Traders","Badi Choupad, Jaipur"),
("Surya Sarees","Egmore, Chennai"),
("Pavitra Emporium","Cannought Place, Delhi");

select * from Suppliers;

# Just in case we need to remove all entries from the table Product to re-enter fresh data
# -----------------------------------------------------#
# truncate table Product;

# Entering fresh records into the table Stock
# -----------------------------------------------------#
# Note: The product_id will be auto incremented from 200 onwards as defined in the alter statement earlier
insert into Product (`product_name`, `description`, `supplier_id`) values
("Levis Mens Jeans","This blue jeans is only for Men", "1"),
("Swara Dresses","Ready made dresses","2"),
("Avasa","Dresses for women","2"),
("Vishudh","Ready made suits for women","3"),
("Varanga","Ready made dresses for women","3"),
("Libas","Dresses for women","3"),
("W","Ready made dresses for women","4"),
("Gerua","Premium ready made dresses and material for women","5");

Select * from product;

# Just in case we need to remove all entries from the table Stock to re-enter fresh data
# -----------------------------------------------------#
# truncate table Stock;

# Entering fresh records into the table Stock
# -----------------------------------------------------#
insert into Stock values
("2938","112", "23125"),
("1201","137","971"),
("1218","279","4270"),
("765","67","1022"),
("1212","354","160"),
("2951","134", "23125"),
("6201","243","971"),
("2218","211","470"),
("4765","121","122"),
("1112","54","10"),
("2562","119", "2125"),
("12001","192","91"),
("8121","270","4070"),
("7121","607","1822"),
("10121","334","1600");


# -----------------------------------------------------#
# TASK 7. Modify the supplier table to make supplier name unique and not null.
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

alter table Suppliers modify column supplier_name varchar(100) unique not null;
desc Suppliers; # Checking if the changes made to the supplier name is reflecting as not null

# As a result the below sql statement will  throw an ERROR "Duplicate entry 'Anil Trading' for key 'suppliers.supplier_name'" because of the above condition
insert into Suppliers (supplier_name, location) values
("Anil Trading","Kharkhana, Hyderabad");

# -----------------------------------------------------#
# TASK 8. Modify the emp table
# 		
#	a. Add a column called deptno
#	b. Set the value of deptno in the following order
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

desc emp; 				# checking the current attributes for this table
alter table emp add column deptno int; 	# Adding a new column dept no to table emp


UPDATE emp    
SET deptno = (
	case 
		when (emp_no % 2) = 0 then 20 
		when (emp_no % 3) = 0 then 30 
		when (emp_no % 4) = 0 then 40 
		when (emp_no % 5) = 0 then 50 
		else 10 
	end 
);  

select * from emp; 	# Just created to check the column values for deptno


# -----------------------------------------------------#
# TASK 9. Create a unique index on the emp_id column.
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

create unique index uni_id on emp (emp_no);
show indexes from emp;		# This will show the indexes created on the table emp which shows the newly created index 'uni_id'

# -----------------------------------------------------#
# TASK 10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
#			Fields - emp_no, first_name, last_name, salary
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

drop view emp_sal;

# Creation of the view emp_sal
Create View emp_sal AS 
select emp_no, first_name, last_name, salary from emp 
ORDER BY salary DESC;

select * from emp_sal;
