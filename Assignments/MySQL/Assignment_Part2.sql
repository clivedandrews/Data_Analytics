# -----------------------------------------------------#
# ASSIGNMENT PART 2 #
# -----------------------------------------------------#


# -----------------------------------------------------#
# TASK 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected.

select *
from employee
where deptno = 10
and salary > 3000;

# -----------------------------------------------------#
# TASK 2. The grading of students based on the marks they have obtained is done as follows:
#			40 to 50 -> Second Class
#			50 to 60 -> First Class
#			60 to 80 -> First Class
#			80 to 100 -> Distinctions
#
#			a. How many students have graduated with first class?
#			b. How many students have obtained distinction? [table: students]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# -----------------------------------------------------#
# The below query will give the counts based on the grading
# This is extra information
# -----------------------------------------------------#

select Grading, count(Grading) as Count
from (select
case 
	when (marks >= 40 and marks < 50) then "Second Class"
	when (marks >= 50 and marks < 80) then "First Class"
	when (marks >= 80 and marks <= 100) then "Distinction"
	else "Fail"
end as Grading,
marks
from students) grades
group by Grading;

# -----------------------------------------------------#
#	a. How many students have graduated with first class?
# -----------------------------------------------------#

select Count(id) as `First Class Count`
from students
where marks >= 50 and marks < 80;

# -----------------------------------------------------#
#	b. How many students have obtained distinction? [table: students]
# -----------------------------------------------------#

select Count(id) as `Distiction Count`
from students
where marks >= 80 and marks <= 100;


# -----------------------------------------------------#
# TASK 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select distinct city from station
where id % 2 = 0;


select count(id) from station;

select count(id) from station
where id % 2 <> 0;
select count(id) from station
where id % 2 = 0;


# -----------------------------------------------------#
# TASK 4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.[table: station]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# Here Repeats is the difference between total number of city entries and the number of distinct city entries
select (count(city) - count(distinct city)) as `Repeats` from station;


# -----------------------------------------------------#
# TASK 5.
#	Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
# 	Proactively doing an order by to ensure all in sorted in alphabetical order so it is easier to check
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select distinct city from station 
where left(city,1) in ('a', 'e', 'i', 'o', 'u')
order by city;

# -----------------------------------------------------#
# TASK 5.
#	b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select distinct city from station 
where left(city,1) in ('a', 'e', 'i', 'o', 'u')
and right(city,1) in ('a', 'e', 'i', 'o', 'u')
order by city;

# -----------------------------------------------------#
# TASK 5.
#	c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select distinct city from station 
where left(city,1) not in ('a', 'e', 'i', 'o', 'u')
order by city;

# -----------------------------------------------------#
# TASK 5.
#	d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select distinct city from station 
where left(city,1) not in ('a', 'e', 'i', 'o', 'u')
or right(city,1) not in ('a', 'e', 'i', 'o', 'u')
order by city;


# -----------------------------------------------------#
# TASK 6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

# Datediff will give the difference between dates in days. 
# we convert the no of days into years as we need to get those employees who are employed within 3 years (i.e., 36 months)

select concat(`first_name`, " ", `last_name`) as Name
from emp
where salary > 2000
and DATEDIFF(current_date(),hire_date) / 365.25 < 3
order by salary desc;


# -----------------------------------------------------#
# TASK 7. How much money does the company spend every month on salaries for each department? [table: employee]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select deptno, sum(salary) as total_salary 
from employee
group by deptno;

# -----------------------------------------------------#
# TASK 8. How many cities in the CITY table have a Population larger than 100000. [table: city]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select count(name) as `City with Population > 100000`
from city
where population > 100000;

# -----------------------------------------------------#
# TASK 9. What is the total population of California? [table: city]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select sum(population) as `California Population`
from city
where district = "California"
group by district;

# -----------------------------------------------------#
# TASK 10. What is the average population of the districts in each country? [table: city]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is used in case only the below query is to be executed afresh

# Proactively taking the country into consideration as well when ordering
select countrycode as country, district,  abs(avg(population)) as `Average Population`
from city
group by countrycode, district
order by countrycode, `Average Population` desc;


# -----------------------------------------------------#
# TASK 11. Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]
# -----------------------------------------------------#

use assignment; # Ensuring the correct database is selected in case only the below query is to be executed afresh

select o.ordernumber as `Order No`, o.status as `Status`, c.customernumber as `Customer No`, c.customername as `Customer Name`, o.comments as `Comments` 
from orders o join customers c
on o.customernumber = c.customernumber
where status = "Disputed";
