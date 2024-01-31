

# KPI-1 Sub Dashboard - Which day had the highest flights, how many flights were delayed, how many flights got cancelled, What was the reason for the cancellation, etc.
# KP1-2 Sub Dashboard - What is the status of different airlines on the same date and where does jet blue stand?
# KPI-3 Sub Dashboard - week-wise, state, city, airline-wise count; For American Airlines, what are the states and city from which this activity is happening every week, what are the reasons for cancellation, delay, etc reasons
# KPI-4 - which countries, states, countries and city

# Make use of actions, parameters, tiled container only, background color and image etc. 



# ------------------------------------------------------------------------------------------------------------- #
# ------------------------------------- CREATING THE DATABASE 'ProjectAviationDB' ------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #
drop database ProjectAviationDB;
create database ProjectAviationDB;
drop table airlines;
drop table airports;
drop table flights;

use ProjectAviationDB;

# ------------------------------------------------------------------------------------------------------------- #
# -------------------------------------   CREATING THE TABLE 'airlines'  ------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #
CREATE TABLE airlines (
  IATA_CODE varchar(20),
  AIRLINE varchar(100)
);

# --------------------------------------------------------------- #
# Checking some basic attributes for the newly created table 'airlines'
# --------------------------------------------------------------- #
select * from airlines;
describe airlines;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ----------------------   IMPORTING THE FILE 'airlines.csv' TO THE TABLE 'airlines'  ----------------------- #
# ------------------------------------------------------------------------------------------------------------- #

# --------------------------------------------------------------- #
# Finding out the path where we can store the file 'airlines.csv' to be imported
# --------------------------------------------------------------- #
show variables like "secure_file_priv";

# --------------------------------------------------------------- #
# Loading the table 'airlines' with data from 'airlines.csv'
# --------------------------------------------------------------- #
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airlines.csv'
INTO TABLE airlines
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


# --------------------------------------------------------------- #
# Checking some basic attributes for the newly created table 'airlines'
# --------------------------------------------------------------- #
use ProjectAviationDB;
select * from airlines;
describe airlines;
# ------------------------------------------------------------------------------------------------------------- #




# ------------------------------------------------------------------------------------------------------------- #
# -------------------------------------   CREATING THE TABLE 'airports'  ------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

drop table airports;
CREATE TABLE airports (
  IATA_CODE varchar(20),
  AIRPORT varchar(150),
  CITY varchar(50),
  STATE varchar(10),
  COUNTRY varchar(20),
  #LATITUDE varchar(50) null,
  #LONGITUDE varchar(50) null
  LATITUDE float null,
  LONGITUDE float null
);

# --------------------------------------------------------------- #
# Checking some basic attributes for the newly created table 'airports'
# --------------------------------------------------------------- #
select * from airports;
describe airports;
# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ----------------------   IMPORTING THE FILE 'airports.csv' TO THE TABLE 'airports'  ----------------------- #
# ------------------------------------------------------------------------------------------------------------- #

# --------------------------------------------------------------- #
# Loading the table 'airports' with data from 'airports.csv'
# --------------------------------------------------------------- #
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airports.csv'
INTO TABLE airports
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(IATA_CODE,AIRPORT,CITY,STATE,COUNTRY,@LATITUDE,@LONGITUDE)
SET 
LATITUDE = NULLIF(@LATITUDE,''),
LONGITUDE = NULLIF(@LONGITUDE,'');
# ------------------------------------------------------------------------------------------------------------- #



# ------------------------------------------------------------------------------------------------------------- #
# -------------------------------------   CREATING THE TABLE 'flights'  ------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB;
drop table flights;
CREATE TABLE flights (
YEAR int,
MONTH int,
DAY int,
DAY_OF_WEEK smallint,
AIRLINE varchar(10),
FLIGHT_NUMBER int,
TAIL_NUMBER varchar(20),
ORIGIN_AIRPORT varchar(10),
DESTINATION_AIRPORT varchar(10),
SCHEDULED_DEPARTURE varchar(4),
DEPARTURE_TIME varchar(4),
DEPARTURE_DELAY int null,
TAXI_OUT int null,
WHEELS_OFF int null,
SCHEDULED_TIME int null,
ELAPSED_TIME int null,
AIR_TIME int null,
DISTANCE int null,
WHEELS_ON int null,
TAXI_IN int null,
SCHEDULED_ARRIVAL varchar(4),
ARRIVAL_TIME varchar(4),
ARRIVAL_DELAY int null,
DIVERTED int null,
CANCELLED int null,
CANCELLATION_REASON varchar(50),
AIR_SYSTEM_DELAY int null,
SECURITY_DELAY int null,
AIRLINE_DELAY int null,
LATE_AIRCRAFT_DELAY int null,
WEATHER_DELAY int null
);

# --------------------------------------------------------------- #
# Checking some basic attributes for the newly created table 'flights'
# --------------------------------------------------------------- #
use ProjectAviationDB;
select * from flights;
describe flights;


# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ----------------------   IMPORTING THE FILE 'flights.csv' TO THE TABLE 'flights'  ----------------------- #
# ------------------------------------------------------------------------------------------------------------- #

# --------------------------------------------------------------- #
# Loading the table 'flights' with data from 'flights.csv'
# --------------------------------------------------------------- #
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights.csv'
INTO TABLE flights
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(@YEAR,@MONTH,@DAY,@DAY_OF_WEEK,@AIRLINE,@FLIGHT_NUMBER,@TAIL_NUMBER,@ORIGIN_AIRPORT,@DESTINATION_AIRPORT,@SCHEDULED_DEPARTURE,@DEPARTURE_TIME,@DEPARTURE_DELAY,@TAXI_OUT,@WHEELS_OFF,@SCHEDULED_TIME,@ELAPSED_TIME,@AIR_TIME,@DISTANCE,@WHEELS_ON,@TAXI_IN,@SCHEDULED_ARRIVAL,@ARRIVAL_TIME,@ARRIVAL_DELAY,@DIVERTED,@CANCELLED,@CANCELLATION_REASON,@AIR_SYSTEM_DELAY,@SECURITY_DELAY,@AIRLINE_DELAY,@LATE_AIRCRAFT_DELAY,@WEATHER_DELAY)
SET 
YEAR = NULLIF(@YEAR,''),
MONTH = NULLIF(@MONTH,''),
DAY = NULLIF(@DAY,''),
DAY_OF_WEEK = NULLIF(@DAY_OF_WEEK,''),
AIRLINE = NULLIF(@AIRLINE,''),
FLIGHT_NUMBER = NULLIF(@FLIGHT_NUMBER,''),
TAIL_NUMBER = NULLIF(@TAIL_NUMBER,''),
ORIGIN_AIRPORT = NULLIF(@ORIGIN_AIRPORT,''),
DESTINATION_AIRPORT = NULLIF(@DESTINATION_AIRPORT,''),
SCHEDULED_DEPARTURE = NULLIF(@SCHEDULED_DEPARTURE,''),
DEPARTURE_TIME = NULLIF(@DEPARTURE_TIME,''),
DEPARTURE_DELAY = NULLIF(@DEPARTURE_DELAY,''),
TAXI_OUT = NULLIF(@TAXI_OUT,''),
WHEELS_OFF = NULLIF(@WHEELS_OFF,''),
SCHEDULED_TIME = NULLIF(@SCHEDULED_TIME,''),
ELAPSED_TIME = NULLIF(@ELAPSED_TIME,''),
AIR_TIME = NULLIF(@AIR_TIME,''),
DISTANCE = NULLIF(@DISTANCE,''),
WHEELS_ON = NULLIF(@WHEELS_ON,''),
TAXI_IN = NULLIF(@TAXI_IN,''),
SCHEDULED_ARRIVAL = NULLIF(@SCHEDULED_ARRIVAL,''),
ARRIVAL_TIME = NULLIF(@ARRIVAL_TIME,''),
ARRIVAL_DELAY = NULLIF(@ARRIVAL_DELAY,''),
DIVERTED = NULLIF(@DIVERTED,''),
CANCELLED = NULLIF(@CANCELLED,''),
CANCELLATION_REASON = NULLIF(@CANCELLATION_REASON,''),
AIR_SYSTEM_DELAY = NULLIF(@AIR_SYSTEM_DELAY,''),
SECURITY_DELAY = NULLIF(@SECURITY_DELAY,''),
AIRLINE_DELAY = NULLIF(@AIRLINE_DELAY,''),
LATE_AIRCRAFT_DELAY = NULLIF(@LATE_AIRCRAFT_DELAY,''),
WEATHER_DELAY = NULLIF(@WEATHER_DELAY,'')
;
# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# ------------------------------   FIXING ALL THE COLUMNS OF THE TABLE 'flights'  ----------------------------- #
# ------------------------------------------------------------------------------------------------------------- #


use ProjectAviationDB;
alter table flights drop column Weekday_Weekend;
alter table flights add column Weekday_Weekend varchar(30); # Creating a new column for Weekend/Weekday stats # This we are creating using default option available.
alter table flights drop column Day_of_Week_mysql;
alter table flights add column Day_of_Week_mysql tinyint; # Creating a new column for the day number
alter table flights drop column Day_Name;
alter table flights add column Day_Name varchar(30); # Creating a new column for the day name
alter table flights drop column Flight_Date;
alter table flights add column Flight_Date varchar(30); # Creating a new column for the day name
alter table flights drop column Week_Num;
alter table flights add column Week_Num decimal(10); # Creating a new column for the number of the week
alter table flights drop column Month_Name_Short;
alter table flights add column Month_Name_Short varchar(10) null; # Creating a new column for Month_Name_Short stats


# Adding new columns 'Day_of_Week_mysql', 'Day_Name' and 'Weekday_Weekend' and getting their values
UPDATE flights SET Flight_Date = STR_TO_DATE(CONCAT(YEAR,'-',LPAD(MONTH,2,'00'),'-',LPAD(DAY,2,'00')), '%Y-%m-%d') where Flight_Date is null; # Added null condition to run multiple times due to time-out
select Flight_Date from flights where Flight_Date is not null; # Checking to ensure that all records were updated - Count should be 5819079
UPDATE flights SET Day_of_Week_mysql = dayofweek(`Flight_Date`), Day_Name = dayname(`Flight_Date`);
UPDATE flights SET Weekday_Weekend = "Weekday" WHERE Day_Name IN ('Monday','Tuesday','Wednesday','Thursday','Friday');
UPDATE flights SET Weekday_Weekend = "Weekend" WHERE Day_Name IN ('Saturday','Sunday');
UPDATE flights SET Month_Name_Short = DATE_FORMAT(`Flight_Date`, '%b') where Month_Name_Short is null;
UPDATE flights SET Week_Num = (week(`Flight_Date`) + 1) where Week_Num is null;



# ------------------------------------------------------------------------------------------------------------- #
# ----------------------------   KPI 1: Weekday Vs Weekend total flights statistics  -------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K1_Weekend_Weekday_total_flights`;
create table `K1_Weekend_Weekday_total_flights`(
	`Day Type` varchar(10) NOT NULL,
    `Flight Count` decimal(10) NOT NULL,
    `Flight Percentage` float NOT NULL
);


insert into `K1_Weekend_Weekday_total_flights` (`Day Type`, `Flight Count`, `Flight Percentage`)
SELECT `Weekday_Weekend` as Weekday_Weekend, count(flight_number) as `Count`, round(count(flight_number) * 100 / (SELECT count(flight_number) AS c FROM flights),2) as `percent of total`
FROM flights
GROUP BY `Weekday_Weekend`;

select * from `K1_Weekend_Weekday_total_flights`;


# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# ----------------------------   KPI 1: Week-wise, Day-Wise total flights statistics  ------------------------- #
# ------------------------------------------------------------------------------------------------------------- #
use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.
drop table `K1_Day-wise_total_flights`;
create table `K1_Day-wise_total_flights`(
	`Weekday_Weekend` varchar(10) NOT NULL,
	`Day_Name` varchar(10) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `K1_Day-wise_total_flights`;
insert into `K1_Day-wise_total_flights` (`Weekday_Weekend`, `Day_Name`, `Flight Count`)
select `Weekday_Weekend` as Weekday_Weekend, `Day_Name` as `Day_Name`, count(flight_number) as `Flight Count`
FROM flights
GROUP BY `Weekday_Weekend`, `Day_Name`
ORDER BY `Weekday_Weekend`, `Day_Name`;

select * from `K1_Day-wise_total_flights`;


# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# ------------------------------   KPI 1: Week-wise, Day-Wise Total Flight Status  ---------------------------- #
# ------------------------------------------------------------------------------------------------------------- #


use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K1_Week_Day_Status_Flights`;
create table `K1_Week_Day_Status_Flights`(
	`Weekday_Weekend` varchar(10) NOT NULL,
	`Day_Name` varchar(10) NOT NULL,
    `Cancelled Flights` decimal(10) NOT NULL, 
    `Diverted Flights` decimal(10) NOT NULL, 
    `Delayed Flights` decimal(10) NOT NULL, 
    `On Time Flights` decimal(10) NOT NULL
);

#insert into `K1_Week_Day_Status_Flights` (`Weekday_Weekend`, `Day_Name`, `Cancelled Flights`, `Diverted Flights`, `Delayed Flights`, `On Time Flights`)
select
  `Weekday_Weekend`, `Day_Name`,
  sum(case when CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
  sum(case when DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
  sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
  sum(case when ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`
from `flights`
GROUP BY `Weekday_Weekend`, `Day_Name`
ORDER BY `Weekday_Weekend`, `Day_Name`;

select * from `K1_Week_Day_Status_Flights`;

# ------------------------------------------------------------------------------------------------------------- #



# ------------------------------------------------------------------------------------------------------------- #
# ----------------------------   KPI 1: Week-wise, Day-Wise Delayed Flight Reasons  --------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K1_Week_Day_Delayed_Flights_Reason`;
create table `K1_Week_Day_Delayed_Flights_Reason`(
	`Weekday_Weekend` varchar(10) NOT NULL,
	`Day_Name` varchar(10) NOT NULL, 
    `Delayed Flights` decimal(10) NOT NULL,
    `LATE_AIRCRAFT_DELAY` decimal(10,2) NOT NULL,
    `AIRLINE_DELAY` decimal(10,2) NOT NULL,
    `AIR_SYSTEM_DELAY` decimal(10,2) NOT NULL,
    `WEATHER_DELAY` decimal(10,2) NOT NULL
);
describe `K1_Week_Day_Delayed_Flights_Reason`;

insert into `K1_Week_Day_Delayed_Flights_Reason` (`Weekday_Weekend`, `Day_Name`, `Delayed Flights`, `LATE_AIRCRAFT_DELAY`, `AIRLINE_DELAY`, `AIR_SYSTEM_DELAY`, `WEATHER_DELAY`)
select
`Weekday_Weekend`, `Day_Name`,
  sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
  round(avg(WEATHER_DELAY),2) as WEATHER_DELAY, 
  round(avg(AIR_SYSTEM_DELAY),2) as AIR_SYSTEM_DELAY, 
  round(avg(AIRLINE_DELAY),2) as AIRLINE_DELAY, 
  round(avg(LATE_AIRCRAFT_DELAY),2) as LATE_AIRCRAFT_DELAY
from `flights`
group by `Weekday_Weekend`, `Day_Name`
order by `Weekday_Weekend`, `Day_Name`;

select * from `K1_Week_Day_Delayed_Flights_Reason`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ---------------------------  KPI 1: Week-wise, Day-Wise Cancelled Flight Reasons  --------------------------- #
# ------------------------------------------------------------------------------------------------------------- #


use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K1_Week_Day_Cancellation_Reason`;
create table `K1_Week_Day_Cancellation_Reason`(
	`Weekday_Weekend` varchar(10) NOT NULL,
	`Day_Name` varchar(10) NOT NULL, 
    `Cancellation Reason` varchar(2) NOT NULL,
    `Cancelled Flights` decimal(10) NOT NULL
);
describe `K1_Week_Day_Cancellation_Reason`;

insert into `K1_Week_Day_Cancellation_Reason` (`Weekday_Weekend`, `Day_Name`, `Cancellation Reason`, `Cancelled Flights`)
select
`Weekday_Weekend`, `Day_Name`,
`CANCELLATION_REASON` as `Cancellation Reason`,
sum(case when CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`
from `flights`
where `CANCELLATION_REASON` is not null
group by `Weekday_Weekend`, `Day_Name`, `CANCELLATION_REASON`
order by `Weekday_Weekend`, `Day_Name`, `CANCELLATION_REASON`;

select * from `K1_Week_Day_Cancellation_Reason`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# --------   KPI 2: Total number of cancelled flights for JetBlue Airways on first date of every month  ------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K2_Cancelled_JetBlue_Flts_day_1_everymonth`;
create table `K2_Cancelled_JetBlue_Flts_day_1_everymonth`(
	`Airline` varchar(100) NOT NULL,
    `Month` varchar(10) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `K2_Cancelled_JetBlue_Flts_day_1_everymonth`;
insert into `K2_Cancelled_JetBlue_Flts_day_1_everymonth` (`Airline`, `Month`, `Flight Count`)
select al.AIRLINE as `Airline`, ft.Month_Name_Short as `Month`, count(ft.flight_number) as `Count`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
where ft.AIRLINE = 'B6'
and ft.DAY = '1'
and ft.CANCELLED = '1'
group by al.AIRLINE, ft.Month_Name_Short;

select * from `K2_Cancelled_JetBlue_Flts_day_1_everymonth`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# ------------   KPI 2: Comparitive study of Total flights cancelled on first date of every month  ------------ #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K2_Comparitive_JetBlue_day_1_everymonth`;
create table `K2_Comparitive_JetBlue_day_1_everymonth`(
	`Airline` varchar(100) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

insert into `K2_Comparitive_JetBlue_day_1_everymonth` (`Airline`, `Flight Count`)
select al.AIRLINE as `Airline`, count(ft.flight_number) as `Count`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
where ft.DAY = '1'
and ft.CANCELLED = '1'
group by al.AIRLINE
order by count(ft.flight_number);

select * from `K2_Comparitive_JetBlue_day_1_everymonth`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ------------   KPI 2: Comparitive study of Total flights cancelled on first date of every month  ------------ #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K2_Comparitive_Cancellation_Reason_Day1_everymonth`;
create table `K2_Comparitive_Cancellation_Reason_Day1_everymonth`(
	`Airline` varchar(100) NOT NULL,
    `Cancellation Reason` varchar(2) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `K2_Comparitive_Cancellation_Reason_Day1_everymonth`;
insert into `K2_Comparitive_Cancellation_Reason_Day1_everymonth` (`Airline`, `Cancellation Reason`, `Flight Count`)
select al.AIRLINE as `Airline`, `CANCELLATION_REASON` as `Cancellation Reason`, count(ft.flight_number) as `Count`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
where ft.DAY = '1'
and ft.CANCELLED = '1'
and `CANCELLATION_REASON` is not null
group by al.AIRLINE, `CANCELLATION_REASON`
order by `CANCELLATION_REASON`, count(ft.flight_number);


select * from `K2_Comparitive_Cancellation_Reason_Day1_everymonth`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# -------------------------   KPI 3: Week wise, State wise and City wise flight delay  ------------------------ #
# ------------------------------------------------------------------------------------------------------------- #
use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.
# ----------------   Arrival Delay  --------------- #
drop table `K3_Week_State_City_Wise_Flt_Delay`;
create table `K3_Week_State_City_Wise_Flt_Delay`(
	`Week` decimal(10) NOT NULL,
    `State` varchar(10) NOT NULL,
    `City` varchar(30) NOT NULL,
    `Flight Count` decimal(50) NOT NULL
);

describe `K3_Week_State_City_Wise_Flt_Delay`;
truncate table `K3_Week_State_City_Wise_Flt_Delay`;
insert into `K3_Week_State_City_Wise_Flt_Delay` (`Week`, `State`, `City`, `Flight Count`)
select fl.Week_Num as `Week`, ap.`State`, ap.`City`, count(fl.FLIGHT_NUMBER) as `Flight Count`
from flights fl
left outer join airports ap
on fl.DESTINATION_AIRPORT=ap.IATA_CODE
where fl.ARRIVAL_DELAY > 0
and ap.`State` is not null
#and ap.STATE in ('CA')
#and ap.CITY in ('San Jose')
group by fl.Week_Num, ap.`State`, ap.`City`
order by fl.Week_Num, ap.`State`, ap.`City`;

select * from `K3_Week_State_City_Wise_Flt_Delay`;

# --------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# -----------------------------  KPI 3: Week, State, City, Airline Wise Flight Status ------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K3_Week_Airline_Origin_Destination_Airport_Flt_Status`;
create table `K3_Week_Airline_Origin_Destination_Airport_Flt_Status`(
	`Week` decimal(10) NOT NULL,
	`Airline` varchar(100) NOT NULL,
    `Airline_Code` varchar(5) NOT NULL,
    `Origin Country` varchar(5) NULL,
    `Origin State` varchar(5) NULL, 
    `Origin City` varchar(40) NULL,
    `Destination Country` varchar(5) NULL,
    `Destination State` varchar(5) NULL,
    `Destination City` varchar(40) NULL,
    `Total Flight Count` decimal(10) NOT NULL,
    `Cancelled Flights` decimal(10) NOT NULL,
    `Diverted Flights` decimal(10) NOT NULL,
    `Delayed Flights` decimal(10) NOT NULL,
    `On Time Flights` decimal(10) NOT NULL
);

truncate table `K3_Week_Airline_Origin_Destination_Airport_Flt_Status`;

insert into `K3_Week_Airline_Origin_Destination_Airport_Flt_Status` (`Week`, `Airline`, `Airline_Code`, `Origin Country`, `Origin State`, `Origin City`,`Destination Country`, `Destination State`, `Destination City`, `Total Flight Count`, `Cancelled Flights`, `Diverted Flights`, `Delayed Flights`, `On Time Flights`)
select ft.Week_Num as `Week`, al.AIRLINE as `Airline`, ft.AIRLINE as `Airline_Code`, o_ap.country as `Origin Country`, o_ap.state as `Origin State`, o_ap.city as `Origin City`, d_ap.country as `Destination Country`, d_ap.state as `Destination State`, d_ap.city  as `Destination City`, 
count(ft.FLIGHT_NUMBER) as `Flight Count`,
sum(case when CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
sum(case when DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
sum(case when ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
left outer join airports as o_ap
on ft.ORIGIN_AIRPORT = o_ap.IATA_CODE
left outer join airports as d_ap
on ft.DESTINATION_AIRPORT = d_ap.IATA_CODE
group by ft.Week_Num, al.AIRLINE, ft.AIRLINE, o_ap.country, o_ap.state, o_ap.city, d_ap.country, d_ap.state, d_ap.city
order by ft.Week_Num, al.AIRLINE, ft.AIRLINE, o_ap.country, o_ap.state, o_ap.city, d_ap.country, d_ap.state, d_ap.city;

select * from `K3_Week_Airline_Origin_Destination_Airport_Flt_Status`;

# ------------------------------------------------------------------------------------------------------------- #



# ------------------------------------------------------------------------------------------------------------- #
# ----------------   KPI 4: Airlines with No delay with distance covered between 2500 and 3000  --------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.
drop table `K4_Airlines_With_NoDelay_Distance_Between_2500_3000`;
create table `K4_Airlines_With_NoDelay_Distance_Between_2500_3000`(
	`Airline` varchar(100) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `K4_Airlines_With_NoDelay_Distance_Between_2500_3000`;
insert into `K4_Airlines_With_NoDelay_Distance_Between_2500_3000` (`Airline`, `Flight Count`)
select al.AIRLINE as `Airline`, count(ft.flight_number) as `Count`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
where ft.DEPARTURE_DELAY <= 0
and ft.ARRIVAL_DELAY <= 0
and ft.DISTANCE between 2500 and 3000
group by al.AIRLINE
order by count(ft.flight_number) desc;

select * from `K4_Airlines_With_NoDelay_Distance_Between_2500_3000`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# ---------   KPI 4: Airlines Operating in Countries, State, City with distance between 2500 and 3000  -------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K4_Al_Country_State_City_Operating_Dist_BW_2500_3000`;
create table `K4_Al_Country_State_City_Operating_Dist_BW_2500_3000`(
	`Airline` varchar(100) NOT NULL,
    `Origin Country` varchar(5) NULL,
    `Origin State` varchar(5) NULL, 
    `Origin City` varchar(40) NULL,
    `Destination Country` varchar(5) NULL,
    `Destination State` varchar(5) NULL,
    `Destination City` varchar(40) NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `K4_Al_Country_State_City_Operating_Dist_BW_2500_3000`;

insert into `K4_Al_Country_State_City_Operating_Dist_BW_2500_3000` (`Airline`, `Origin Country`, `Origin State`, `Origin City`,`Destination Country`, `Destination State`, `Destination City`, `Flight Count`)
select ft.AIRLINE as `Airline`, o_ap.country as `Origin Country`, o_ap.state as `Origin State`, o_ap.city as `Origin City`, d_ap.country as `Destination Country`, d_ap.state as `Destination State`, d_ap.city  as `Destination City`, count(ft.flight_number) as `Flight Count`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
left outer join airports as o_ap
on ft.ORIGIN_AIRPORT = o_ap.IATA_CODE
left outer join airports as d_ap
on ft.DESTINATION_AIRPORT = d_ap.IATA_CODE
where ft.DISTANCE between 2500 and 3000
and ft.ORIGIN_AIRPORT is not null
and ft.DESTINATION_AIRPORT is not null
group by ft.AIRLINE, o_ap.country, o_ap.state, o_ap.city, d_ap.country, d_ap.state, d_ap.city
order by ft.AIRLINE, o_ap.country, o_ap.state, o_ap.city, d_ap.country, d_ap.state, d_ap.city;

select * from `K4_Al_Country_State_City_Operating_Dist_BW_2500_3000`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ----------------------   KPI 4: Airlines Count Operating on distance between 2500 and 3000  ----------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K4_Airlines_Operating_Distance_Between_2500_3000`;
create table `K4_Airlines_Operating_Distance_Between_2500_3000`(
	`Airline` varchar(100) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `K4_Airlines_Operating_Distance_Between_2500_3000`;

insert into `K4_Airlines_Operating_Distance_Between_2500_3000` (`Airline`, `Flight Count`)
select AIRLINE, count(flight_number) as `Count`
from flights
where DISTANCE between 2500 and 3000
group by AIRLINE
order by AIRLINE;

select * from `K4_Airlines_Operating_Distance_Between_2500_3000`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# ----------------------   KPI 4: Airlines Status Operating on distance between 2500 and 3000  ----------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K4_Airlines_Status_Operating_Distance_Between_2500_3000`;
create table `K4_Airlines_Status_Operating_Distance_Between_2500_3000`(
	`Airline` varchar(100) NOT NULL,
    `Airline_Code` varchar(10) NOT NULL,
    `Cancelled Flights` decimal(10) NOT NULL,
    `Diverted Flights` decimal(10) NOT NULL,
    `Delayed Flights` decimal(10) NOT NULL,
    `On Time Flights` decimal(10) NOT NULL
);

truncate table `K4_Airlines_Status_Operating_Distance_Between_2500_3000`;

insert into `K4_Airlines_Status_Operating_Distance_Between_2500_3000` (`Airline`, `Airline_Code`, `Cancelled Flights`,`Diverted Flights`, `Delayed Flights`, `On Time Flights`)
select al.AIRLINE as `Airline Code`,
ft.AIRLINE as `Airline`,
sum(case when ft.CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
sum(case when ft.DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
sum(case when ft.ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
sum(case when ft.ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`
from `flights` as ft
left outer join `airlines` as al
on ft.AIRLINE = al.IATA_CODE
where ft.DISTANCE between 2500 and 3000
group by ft.AIRLINE, al.AIRLINE
order by ft.AIRLINE, al.AIRLINE;

select * from `K4_Airlines_Status_Operating_Distance_Between_2500_3000`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# -  KPI 4: Flight Status of Airlines Operating in Countries, State, City with distance between 2500 and 3000 - #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K4_Country_State_City_FTStatus_Op_Dist_BW_2500_3000`;
create table `K4_Country_State_City_FTStatus_Op_Dist_BW_2500_3000`(
	`Airline` varchar(100) NOT NULL,
    `Airline_Code` varchar(5) NOT NULL,
    `Origin Country` varchar(5) NULL,
    `Origin State` varchar(5) NULL, 
    `Origin City` varchar(40) NULL,
    `Destination Country` varchar(5) NULL,
    `Destination State` varchar(5) NULL,
    `Destination City` varchar(40) NULL,
    `Cancelled Flights` decimal(10) NOT NULL,
    `Diverted Flights` decimal(10) NOT NULL,
    `Delayed Flights` decimal(10) NOT NULL,
    `On Time Flights` decimal(10) NOT NULL
);

truncate table `K4_Country_State_City_FTStatus_Op_Dist_BW_2500_3000`;

insert into `K4_Country_State_City_FTStatus_Op_Dist_BW_2500_3000` (`Airline`, `Airline_Code`, `Origin Country`, `Origin State`, `Origin City`,`Destination Country`, `Destination State`, `Destination City`, `Cancelled Flights`, `Diverted Flights`, `Delayed Flights`, `On Time Flights`)
select al.AIRLINE as `Airline`, ft.AIRLINE as `Airline_Code`, o_ap.country as `Origin Country`, o_ap.state as `Origin State`, o_ap.city as `Origin City`, d_ap.country as `Destination Country`, d_ap.state as `Destination State`, d_ap.city  as `Destination City`, 
sum(case when CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
sum(case when DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
sum(case when ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`
from flights as ft
left outer join airlines as al
on ft.AIRLINE = al.IATA_CODE
left outer join airports as o_ap
on ft.ORIGIN_AIRPORT = o_ap.IATA_CODE
left outer join airports as d_ap
on ft.DESTINATION_AIRPORT = d_ap.IATA_CODE
where ft.DISTANCE between 2500 and 3000
group by al.AIRLINE, ft.AIRLINE, o_ap.country, o_ap.state, o_ap.city, d_ap.country, d_ap.state, d_ap.city
order by al.AIRLINE, ft.AIRLINE, o_ap.country, o_ap.state, o_ap.city, d_ap.country, d_ap.state, d_ap.city;

select * from `K4_Country_State_City_FTStatus_Op_Dist_BW_2500_3000`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# -----------------------------------------   Reasons for Delay  ---------------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

drop table `Reason_for_Delay`;

create table `Reason_for_Delay`(
	WEATHER_DELAY decimal(10,2) NOT NULL,
    AIR_SYSTEM_DELAY decimal(10,2) NOT NULL,
    AIRLINE_DELAY decimal(10,2) NOT NULL,
    LATE_AIRCRAFT_DELAY decimal(10,2) NOT NULL
);

truncate table `Reason_for_Delay`;

insert into `Reason_for_Delay` (WEATHER_DELAY, AIR_SYSTEM_DELAY, AIRLINE_DELAY, LATE_AIRCRAFT_DELAY)
select round(avg(WEATHER_DELAY),2) as WEATHER_DELAY, round(avg(AIR_SYSTEM_DELAY),2) as AIR_SYSTEM_DELAY, round(avg(AIRLINE_DELAY),2) as AIRLINE_DELAY, round(avg(LATE_AIRCRAFT_DELAY),2) as LATE_AIRCRAFT_DELAY
from flights fl;

select * from `Reason_for_Delay`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------   Flights on Time ------------------------------------------------ #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `Flights_On_Time`;
create table `Flights_On_Time`(
	`Airline` varchar(100) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `Flights_On_Time`;

insert into `Flights_On_Time` (`Airline`, `Flight Count`)
select AIRLINE as `Airline`, count(flight_number) as `Count`
from flights
where ARRIVAL_DELAY <= 0
group by AIRLINE
order by count(flight_number) desc;


select * from `Flights_On_Time`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------   Flights Delayed  ----------------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `Flights_Delayed`;
create table `Flights_Delayed`(
	`Airline` varchar(100) NOT NULL,
    `Flight Count` decimal(10) NOT NULL
);

truncate table `Flights_Delayed`;

insert into `Flights_Delayed` (`Airline`, `Flight Count`)
select AIRLINE as `Airline`, count(flight_number) as `Count`
from flights
where ARRIVAL_DELAY > 0
group by AIRLINE
order by count(flight_number) desc;


select * from `Flights_Delayed`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# -----------------------------------------   Total Flight Status  -------------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

drop table `Total_Flights_Cancelled_Diverted_Delayed_OnTime`;
create table `Total_Flights_Cancelled_Diverted_Delayed_OnTime`(
	`Cancelled Flights` varchar(100) NOT NULL,
    `Diverted Flights` varchar(100) NOT NULL,
	`Delayed Flights` varchar(100) NOT NULL,
    `On Time Flights` varchar(100) NOT NULL,
    `Total Flights` varchar(100) NOT NULL
);

insert into `Total_Flights_Cancelled_Diverted_Delayed_OnTime` (`Cancelled Flights`,`Diverted Flights`, `Delayed Flights`, `On Time Flights`, `Total Flights`)
select
sum(case when CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
sum(case when DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
sum(case when ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`,
count(`flight_number`) as `Total Flights`
from `flights`;

select * from `Total_Flights_Cancelled_Diverted_Delayed_OnTime`;

# ------------------------------------------------------------------------------------------------------------- #


# ------------------------------------------------------------------------------------------------------------- #
# ----------------------------------  Additional: Month-wise Flight Count  ------------------------------------ #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `K1_Month_Wise_Flight_Count`;
create table `K1_Month_Wise_Flight_Count`(
	`Month` varchar(10) NOT NULL,
	`Flight Count` decimal(10) NOT NULL
);
describe `K1_Month_Wise_Flight_Count`;

insert into `K1_Month_Wise_Flight_Count` (`Month`, `Flight Count`)
select Month_Name_Short as `Month`, count(FLIGHT_NUMBER) as `Flight Count`
from flights
group by Month_Name_Short;

select * from `K1_Month_Wise_Flight_Count`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# -----------------------------------   Airline wise Total Flight Status  ------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`;

create table `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`(
	`Airline` varchar(30) NOT NULL,
    `Airline_Code` varchar(10) NOT NULL,
	`Cancelled Flights` decimal(20) NOT NULL,
    `Diverted Flights` decimal(20) NOT NULL,
	`Delayed Flights` decimal(20) NOT NULL,
    `On Time Flights` decimal(20) NOT NULL,
    `Total Flights` decimal(20) NOT NULL
);


insert into `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime` (`Airline`, `Airline_Code`, `Cancelled Flights`,`Diverted Flights`, `Delayed Flights`, `On Time Flights`, `Total Flights`)
select
al.AIRLINE as `Airline`, ft.AIRLINE as `Airline_Code`, 
sum(case when ft.CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
sum(case when ft.DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
sum(case when ft.ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
sum(case when ft.ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`,
count(ft.`flight_number`) as `Total Flights`
from `flights` as ft
left outer join `airlines` as al
on ft.AIRLINE = al.IATA_CODE
group by al.AIRLINE, ft.AIRLINE
order by al.AIRLINE, ft.AIRLINE;

select * from `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`;

# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# -----------------------------------------   Total Flight Status  -------------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

drop table `Total_Flight_Status`;

# Total Flight Status Query - Absolute Count
select
sum(case when CANCELLED = 1 then 1 else 0 end) `Cancelled Flights`,
sum(case when DIVERTED = 1 then 1 else 0 end) `Diverted Flights`,
sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) `Delayed Flights`,
sum(case when ARRIVAL_DELAY <= 0 then 1 else 0 end) `On Time Flights`,
count(`flight_number`) as `Total Flights`
from `flights`;

create table `Total_Flight_Status`(
	`Total Flights` decimal(20) NOT NULL,
    `Delayed Flights` decimal(20) NOT NULL,
    `Cancelled Flights` decimal(20) NOT NULL,
    `Diverted Flights` decimal(20) NOT NULL,
	`On Time Flights` decimal(20) NOT NULL
);

truncate table  `Total_Flight_Status`;

insert into `Total_Flight_Status` (`Total Flights`, `On Time Flights`, `Delayed Flights`, `Cancelled Flights`, `Diverted Flights`)
select
round(count(`flight_number`) * 100 /count(`flight_number`)) as `Total Flights`, 
round(sum(case when ARRIVAL_DELAY <= 0 then 1 else 0 end) * 100 /count(`flight_number`)) as `On Time`,
round(sum(case when ARRIVAL_DELAY > 0 then 1 else 0 end) * 100 /count(`flight_number`)) as `Delayed`, 
round(sum(case when CANCELLED = 1 then 1 else 0 end) * 100 /count(`flight_number`)) as `Cancelled`, 
round(sum(case when DIVERTED = 1 then 1 else 0 end) * 100 /count(`flight_number`)) as `Diverted`
from `flights`;

select * from `Total_Flight_Status`;
# ------------------------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------------------------- #
# -----------------------------------   Airline wise Flight Status - Top 3  ------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #

use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.

select `Airline`, `Airline_Code`, `Delayed Flights` 
from `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`
group by `Airline`, `Airline_Code`, `Delayed Flights` 
Order by `Delayed Flights` desc
limit 3;

select `Airline`, `Airline_Code`, `On Time Flights` 
from `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`
group by `Airline`, `Airline_Code`, `On Time Flights` 
Order by `On Time Flights` desc
limit 3;

select `Airline`, `Airline_Code`, `Cancelled Flights` 
from `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`
group by `Airline`, `Airline_Code`, `Cancelled Flights` 
Order by `Cancelled Flights` desc
limit 3;
# ------------------------------------------------------------------------------------------------------------- #


select `Airline`, `Airline_Code`, `Delayed Flights` 
from `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`
group by `Airline`, `Airline_Code`, `Delayed Flights` 
Order by `Delayed Flights` desc
limit 3;



# ------------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------   Final KPIs  ------------------------------------------------- #
# ------------------------------------------------------------------------------------------------------------- #
use ProjectAviationDB; # Adding just incase one of the below sql queries alone needs to be executed first.
select * from `K1_Weekend_Weekday_total_flights`;
select * from `K1_Day-wise_total_flights`;
select * from `K1_Week_Day_Status_Flights`;
select * from `K1_Week_Day_Delayed_Flights_Reason`;
select * from `K1_Week_Day_Cancellation_Reason`;
select * from `K2_Cancelled_JetBlue_Flts_day_1_everymonth`;
select * from `K2_Comparitive_JetBlue_day_1_everymonth`;
select * from `K2_Comparitive_Cancellation_Reason_Day1_everymonth`;
select * from `K3_Week_State_City_Wise_Flt_Delay`;
select * from `K3_Week_Airline_Origin_Destination_Airport_Flt_Status`;
select * from `K4_Airlines_With_NoDelay_Distance_Between_2500_3000`;
select * from `K4_Al_Country_State_City_Operating_Dist_BW_2500_3000`;
select * from `K4_Airlines_Operating_Distance_Between_2500_3000`;
select * from `K4_Airlines_Status_Operating_Distance_Between_2500_3000`;
select * from `K4_Country_State_City_FTStatus_Op_Dist_BW_2500_3000`;
select * from `Flights_On_Time`;
select * from `Flights_Delayed`;
select * from `Total_Flights_Cancelled_Diverted_Delayed_OnTime`;
select * from `Airlines_Flight_Status_Cancelled_Diverted_Delayed_OnTime`;
select * from `Flights_Delay_OnTime`;
select * from `K1_Month_Wise_Flight_Count`;

# ------------------------------------------------------------------------------------------------------------- #