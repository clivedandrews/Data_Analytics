# -----------------------------------------------------#
# ASSIGNMENT PART 3 #
# -----------------------------------------------------#


# -----------------------------------------------------#
# TASK 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected.

select * from orders;
# drop procedure order_status; # just in case we need to update or change the procedure details

# Creating a procedure to extract the orders within a month and year
DELIMITER $$
create procedure `order_status`(yr int, mth int)
begin
select ordernumber as `Order No`, orderdate as `Order Date`, status as `Status` 
from orders
where year(orderdate) = yr
and month(orderdate) = mth;
end$$
DELIMITER ;

call order_status(2003, 03);
call order_status(2004, 08);
call order_status(2005, 05);
call order_status(2005, 11);

# -----------------------------------------------------#
# TASK 2. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
#			if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
#			if amount > 50000 Platinum
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

Delimiter $$
 Create function `FunPurchaseStatus` (customernumber int)
 returns varchar(20)
 Deterministic
 BEGIN
 declare purchase_status varchar(20);
 if customernumber < 25000 then
 set purchase_status = "Silver";
 elseif customernumber between 25000 and 50000 then
 set purchase_status = "Gold";
 elseif customernumber > 50000 then
 set purchase_status = "Platinum";
 end if;
 return purchase_status;
 END $$
Delimiter ;

# Running some checks to ensure that all conditions are matching and output of the function is as desired.
select FunPurchaseStatus(1) from dual;	 	# Output is 'Silver'
select FunPurchaseStatus(20000) from dual;	 # Output is 'Silver'
select FunPurchaseStatus(24999) from dual;	 # Output is 'Silver'
select FunPurchaseStatus(25000) from dual;	 # Output is 'Gold'
select FunPurchaseStatus(30000) from dual;	 # Output is 'Gold'
select FunPurchaseStatus(45000) from dual;	 # Output is 'Gold'
select FunPurchaseStatus(50000) from dual;	 # Output is 'Gold'
select FunPurchaseStatus(50001) from dual;	 # Output is 'Platinum'
select FunPurchaseStatus(75000) from dual;	 # Output is 'Platinum'

# -----------------------------------------------------#
# TASK 2. b. Write a query that displays customerNumber, customername and purchase_status from customers table.
#			if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
#			if amount > 50000 Platinum
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select c.customerNumber as `Customer No`, c.customerName as `Customer Name`, FunPurchaseStatus(p.amount) as `Purchase Status`
from customers c join payments p
on c.customerNumber = p.customerNumber;


# -----------------------------------------------------#
# TASK 3. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. 
#			Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# select * from movies;		# Just to view all the entries in movies
# select * from rentals;	# Just to view all the entries in rentals

desc movies;		# Just to view data types for movies
desc rentals;		# Just to view data types for rentals

# Added 2 entries to the movies table for testing the changes later
insert into movies values (11, "Speed", "Action");
insert into movies values (12, "When Harry Met Sally", "Romance");

select * from movies;

# Added 2 entries to the rentals table for testing the changes later
insert into rentals values (11, "Clive", "Andrews", 11);
insert into rentals values (12, "Dominic", "Andy", 12);

select * from rentals;

# drop trigger `ON_DELETE_CASCADE_REPLICATE`;		# This was created here in case we need to delete the trigger and make changes
# Creating a 'ON DELETE CASCADE' replica trigger to automatically delete the associated entry in the rentals table based on the movies table
DELIMITER $$
CREATE TRIGGER `ON_DELETE_CASCADE_REPLICATE` 
AFTER DELETE ON `movies` FOR EACH ROW 
BEGIN
delete from rentals where movieid = OLD.id;
END$$
DELIMITER ;

# Executing the below sql statement for movies table automatically triggers deletion of 'movieid' entry with value as 11 in rentals table
delete from movies where id = 11;

# We can now see that the 'movieid' entry with value of 11 is deleted from the rentals table
select * from rentals;

# drop trigger `ON_UPDATE_CASCADE_REPLICATE`;		# This was created here in case we need to delete the trigger and make changes
# Creating a 'ON UPDATE CASCADE' replica trigger to automatically update the associated entry in the rentals table based on the movies table changes
DELIMITER $$
CREATE TRIGGER `ON_UPDATE_CASCADE_REPLICATE` 
AFTER UPDATE ON `movies` FOR EACH ROW 
BEGIN
update rentals set movieid = NEW.id
where movieid = OLD.id;
END$$
DELIMITER ;

# Executing the below sql statement for movies table automatically triggers updation of 'movieid' entry to 15 in rentals table
update movies set id = 15 where title = "When Harry Met Sally";


# -----------------------------------------------------#
# TASK 4. Select the first name of the employee who gets the third highest salary. [table: employee]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# Using limit to ensure that only 1 name is selected with the same rank. Adding this condition because for Rank 4 we have 2 names 
Select `RankedSalary`.`First Name` as `First Name of 3 rank` from (SELECT fname as `First Name`, salary, rank() 
OVER (order by salary desc ) 
AS `RankSal` FROM employee) as `RankedSalary`
where `RankedSalary`.`RankSal` = 3 limit 1;

# -----------------------------------------------------#
# TASK 5. Assign a rank to each employee based on their salary. The person having the highest salary has rank 1. [table: employee]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# Adding concatenate logic as well to ensure that the first and last name are merged as 'Employee Name', this is extra
SELECT concat(if(fname <> "NULL",fname,''), ' ', if(lname <> "NULL",lname,''))  as `Employee Name`, salary, rank() 
OVER (order by salary desc ) 
AS `rank` FROM employee;

