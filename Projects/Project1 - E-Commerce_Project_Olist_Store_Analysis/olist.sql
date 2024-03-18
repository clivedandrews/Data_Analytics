use olistdb;
show tables;

select * from olist_customers_dataset;
describe olist_customers_dataset;

describe olist_orders_dataset;



select * from olist_orders_dataset LIMIT 10;

select * from olist_customers_dataset; # Count is 99441, which is matching with the CSV file.
select * from olist_order_items_dataset; # Count is 112650, which is matching with the CSV file.
select * from olist_geolocation_dataset; # Could not import this entire CSV file as it was hanging.
select * from olist_order_payments_dataset; # Count is 103886, which is matching with the CSV file
select * from olist_order_reviews_dataset; # Count is 99224, which is matching with the CSV file.
select * from olist_orders_dataset; # Count is 99441, which is matching with the CSV file
select * from olist_products_dataset; # Count is showing as 32340 rows, where as the count in the CSV file is 32951. The other rows are null for product name.
select * from olist_sellers_dataset; # Count is showing as 3095 rows, which matches with the CSV file.  
select * from olist_order_reviews_dataset_updated; # Count is 99224, which is matching with the CSV file.
select * from olist_products_dataset_updated; # Count is showing as 32949, where as the count in the CSV file is 32951,  the others are null values.
select * from olist_order_reviews_dataset_latest;



# Changing the data types for the table 'olist_orders_dataset' to the correct ones
# order_purchase_timestamp
# order_approved_at
# order_delivered_carrier_date
# order_delivered_customer_date
# order_estimated_delivery_date

use olistdb;
select * from olist_orders_dataset
where order_approved_at = "";
alter table olist_orders_dataset change column order_purchase_timestamp order_purchase_timestamp datetime;
describe olist_orders_dataset;
#select order_approved_at,tempstamp from olist_orders_dataset where order_approved_at IS NULL;



# Updating the columns to change the data type to DATETIME. If error is observed, we need to run the other commands in next block to change individual columns to DATETIME data type.
alter table olist_orders_dataset change column order_approved_at order_approved_at datetime NULL;
alter table olist_orders_dataset change column order_delivered_carrier_date order_delivered_carrier_date datetime;
alter table olist_orders_dataset change column order_delivered_customer_date order_delivered_customer_date datetime;
alter table olist_orders_dataset change column order_estimated_delivery_date order_estimated_delivery_date datetime;


use olistdb;
describe olist_orders_dataset;
ALTER TABLE olist_orders_dataset ADD COLUMN tempstamp DATETIME NULL; # Creating a new column 'tempstamp' with DATETIME data type that accepts null values
# ALTER TABLE olist_orders_dataset MODIFY tempstamp DATETIME NULL;
UPDATE olist_orders_dataset SET order_approved_at=NULL WHERE order_approved_at="";  # Replacing blank values with NULL for column 'order_delivered_customer_date'
UPDATE olist_orders_dataset SET tempstamp = STR_TO_DATE(order_approved_at, '%Y-%m-%d %T') WHERE order_approved_at IS NOT NULL;
select order_approved_at, tempstamp from olist_orders_dataset;
alter table olist_orders_dataset drop column order_approved_at;
alter table olist_orders_dataset change column tempstamp order_approved_at DATETIME;
select * from olist_orders_dataset;

alter table olist_orders_dataset drop column tempstamp;

use olistdb;
describe olist_orders_dataset;
ALTER TABLE olist_orders_dataset ADD COLUMN tempstamp DATETIME NULL;  # Creating a new column 'tempstamp' with DATETIME data type that accepts null values
UPDATE olist_orders_dataset SET order_delivered_carrier_date=NULL WHERE order_delivered_carrier_date=""; # Replacing blank values with NULL for column 'order_delivered_customer_date'
UPDATE olist_orders_dataset SET tempstamp = STR_TO_DATE(order_delivered_carrier_date, '%Y-%m-%d %T') WHERE order_delivered_carrier_date IS NOT NULL;
select order_delivered_carrier_date, tempstamp from olist_orders_dataset;
alter table olist_orders_dataset drop column order_delivered_carrier_date;
alter table olist_orders_dataset change column tempstamp order_delivered_carrier_date DATETIME;
select * from olist_orders_dataset;

select * from olist_orders_dataset where order_delivered_customer_date="";

select * from olist_orders_dataset;
ALTER TABLE olist_orders_dataset ADD COLUMN tempstamp DATETIME NULL;  # Creating a new column 'tempstamp' with DATETIME data type that accepts null values


use olistdb;
describe olist_orders_dataset;
ALTER TABLE olist_orders_dataset ADD COLUMN tempstamp DATETIME NULL; # Creating a new column 'tempstamp' with DATETIME data type that accepts null values
UPDATE olist_orders_dataset SET order_delivered_customer_date=NULL WHERE order_delivered_customer_date=""; # Replacing blank values with NULL for column 'order_delivered_customer_date'
UPDATE olist_orders_dataset SET tempstamp = STR_TO_DATE(order_delivered_customer_date, '%Y-%m-%d %T') WHERE order_delivered_customer_date IS NOT NULL; # Updating temp column 'tempstamp' with values of 'order_delivered_customer_date' if NOT NULL
select order_delivered_customer_date, tempstamp from olist_orders_dataset;
select order_delivered_customer_date from olist_orders_dataset where order_delivered_customer_date is NOT NULL;
select tempstamp from olist_orders_dataset where tempstamp is NOT NULL;
alter table olist_orders_dataset drop column order_delivered_customer_date;
alter table olist_orders_dataset change column tempstamp order_delivered_customer_date DATETIME;
select * from olist_orders_dataset;


alter table olist_orders_dataset drop column Weekday_Weekend;
alter table olist_orders_dataset add column Weekday_Weekend varchar(30); # Creating a new column for Weekend/Weekday stats # This we are creating using default option available.
alter table olist_orders_dataset add column Days_From_Delivered_Customer_Date float(7); # Creating a new column with the date difference
alter table olist_orders_dataset add column Day_of_Week tinyint; # Creating a new column for the day number
alter table olist_orders_dataset add column Day_Name varchar(30); # Creating a new column for the day name

# Adding new columns 'Day_of_Week', 'Day_Name' and 'Weekday_Weekend' and getting their values
UPDATE olist_orders_dataset SET Day_of_Week = dayofweek(`order_purchase_timestamp`), Day_Name = dayname(`order_purchase_timestamp`);
UPDATE olist_orders_dataset SET Weekday_Weekend = "Weekday" WHERE Day_Name IN ('Monday','Tuesday','Wednesday','Thursday','Friday');
UPDATE olist_orders_dataset SET Weekday_Weekend = "Weekend" WHERE Day_Name IN ('Saturday','Sunday');

# Updating the new column 'Days_From_Delivered_Customer_Date' as the difference of 'order_purchase_timestamp' and 'order_delivered_customer_date'
UPDATE olist_orders_dataset SET Days_From_Delivered_Customer_Date = datediff(order_delivered_customer_date, order_purchase_timestamp);

# Fixing the header for the table product_category_name_translation
describe product_category_name_translation;
alter table product_category_name_translation change column `ï»¿product_category_name` `product_category_name` VARCHAR(100);
alter table product_category_name_translation change column `product_category_name_english` `product_category_name_english` VARCHAR(100);
select * from product_category_name_translation;


#------------------------------- CHANGING DATA TYPE FOR TABLE 'olist_order_reviews_dataset_updated' ------------------------------------------


use olistdb;
describe olist_order_reviews_dataset_updated;

# Updating the columns to change the data type to DATETIME. If error is observed, we need to run the other commands in next block to change individual columns to DATETIME data type.
select review_creation_date from olist_order_reviews_dataset_updated;
alter table olist_order_reviews_dataset_updated change column review_creation_date review_creation_date datetime NULL;
alter table olist_orders_dataset change column order_delivered_carrier_date order_delivered_carrier_date datetime;
alter table olist_orders_dataset change column order_delivered_customer_date order_delivered_customer_date datetime;
alter table olist_orders_dataset change column order_estimated_delivery_date order_estimated_delivery_date datetime;


ALTER TABLE olist_order_reviews_dataset_updated ADD COLUMN tempstamp DATETIME NULL; # Creating a new column 'tempstamp' with DATETIME data type that accepts null values
UPDATE olist_orders_dataset SET order_delivered_customer_date=NULL WHERE order_delivered_customer_date=""; # Replacing blank values with NULL for column 'order_delivered_customer_date'
UPDATE olist_orders_dataset SET tempstamp = STR_TO_DATE(order_delivered_customer_date, '%Y-%m-%d %T') WHERE order_delivered_customer_date IS NOT NULL; # Updating temp column 'tempstamp' with values of 'order_delivered_customer_date' if NOT NULL
select order_delivered_customer_date, tempstamp from olist_orders_dataset;
select order_delivered_customer_date from olist_orders_dataset where order_delivered_customer_date is NOT NULL;
select tempstamp from olist_orders_dataset where tempstamp is NOT NULL;
alter table olist_orders_dataset drop column order_delivered_customer_date;
alter table olist_orders_dataset change column tempstamp order_delivered_customer_date DATETIME;
select * from olist_orders_dataset;

#------------------------------- KPI 1 ------------------------------------------
use olistdb;

create table `K1_Weekend_Weekday_Sum_PayVal`(
	`Day Type` varchar(10) NOT NULL,
    `Sum of Payment Value` decimal(10,2) NOT NULL
);

insert into `K1_Weekend_Weekday_Sum_PayVal` (`Day Type`, `Sum of Payment Value`)
# KPI 1 Query - The Payment Value for Weekend Vs Weekday 
SELECT ord.Weekday_Weekend, ROUND(SUM(pay.payment_value),2) `Sum of Payment Value`
FROM olist_orders_dataset ord, olist_order_payments_dataset pay
WHERE ord.order_id = pay.order_id
GROUP BY ord.Weekday_Weekend;

select * from `K1_Weekend_Weekday_Sum_PayVal`;

#-------------------------------------------------------------------------


#------------------------------- KPI 2 ------------------------------------------

use olistdb;

create table `K2_Review_Score_5_Orders_Count`(
	`Payment Type` varchar(30),
	`Review Score` TINYINT NOT NULL,
    `Order Count` double NOT NULL
);


insert into `K2_Review_Score_5_Orders_Count` (`Payment Type`, `Review Score`, `Order Count`)
# RESULT - Payment_type = 'credit_card', 'review_score' = 5 and 'Order Count' = 44333
SELECT pay.payment_type as `Payment Type`, rev.review_score as `Review Score`, COUNT(rev.order_id) as `Order Count`
FROM olist_orders_dataset ord
LEFT JOIN olist_order_payments_dataset pay
ON ord.order_id = pay.order_id
LEFT JOIN olist_order_reviews_dataset_latest rev
ON ord.order_id = rev.order_id
WHERE rev.review_score = '5'
AND pay.payment_type = 'credit_card'
GROUP BY pay.payment_type, rev.review_score;


select * from `K2_Review_Score_5_Orders_Count`;

#-------------------------------------------------------------------------

#-------------------------------- KPI 3 ---------------------------------------

use olistdb;

create table `K3_AvgDeliveryDays_pet_shop`(
  `Product Name` varchar(100) NOT NULL,
  `Average Delivery Days` decimal(10,2) NOT NULL
);

insert into `K3_AvgDeliveryDays_pet_shop` (`Product Name`, `Average Delivery Days`)
# This returns 11.17 as "Average Delivery Days" for "pet_shop" product name.
SELECT pro.product_category_name as `Product Name`, ROUND(AVG(ord.Days_From_Delivered_Customer_Date),2) as `Average Delivery Days`
FROM olist_orders_dataset ord
JOIN olist_order_items_dataset items
ON ord.order_id = items.order_id
JOIN olist_products_dataset pro
ON items.product_id = pro.product_id
WHERE pro.product_category_name = "pet_shop"
GROUP BY pro.product_category_name;


select * from `K3_AvgDeliveryDays_pet_shop`;



#------------------------------------------------------------------------------

#-------------------------------- KPI 4 ----------------------------------------

use olistdb;

create table `K4_Avg_Price_PayVal_sao_paulo`(
	`City` varchar(100) NOT NULL,
    `Price` decimal(10,2) NOT NULL,
    `Payment Value` decimal(10,2) NOT NULL
);

insert into `K4_Avg_Price_PayVal_sao_paulo` (`City`, `Price`, `Payment Value`)
# This returns "Price" as 108.03 and "Payment Value" is 152.77
SELECT cus.customer_city as `City`, ROUND(AVG(items.price),2) as `Price`, ROUND(AVG(pay.payment_value),2) as `Payment Value`
FROM olist_orders_dataset ord
JOIN olist_order_payments_dataset pay
ON ord.order_id = pay.order_id
JOIN olist_customers_dataset cus
ON ord.customer_id = cus.customer_id
JOIN olist_order_items_dataset items
ON ord.order_id = items.order_id
WHERE cus.customer_city = 'sao paulo';

select * from `K4_Avg_Price_PayVal_sao_paulo`;

select * from olist_customers_dataset;

#------------------------------------------------------------------------------

#-------------------------------- KPI 5 ----------------------------------------

create table `K5_Revew_Score_Vs_Avg_Delivery_Days`(
	`Review Score` tinyint,
    `Avg Delivery Days` decimal(10,2) NOT NULL
);


insert into `K5_Revew_Score_Vs_Avg_Delivery_Days` (`Review Score`, `Avg Delivery Days`)
# This returns 21.25, 16.61, 14.2, 12.25, 10.63 for 1, 2, 3, 4 and 5 review scores respectively.
SELECT rev.review_score as `Review Score`, ROUND(AVG(ord.Days_From_Delivered_Customer_Date),2) as `Avg Delivery Days`
FROM olist_orders_dataset ord, olist_order_reviews_dataset_latest rev
WHERE ord.order_id = rev.order_id
GROUP BY rev.review_score
ORDER BY rev.review_score;

select * from `K5_Revew_Score_Vs_Avg_Delivery_Days`;


#------------------------------------------------------------------------------

use olistdb;
select * from product_category_name_translation;
select * from olist_products_dataset;
select * from olist_orders_dataset;
select * from olist_order_payments_dataset;

create table `Product_Category_Vs_Payment_Value` (
	`Product Name` VARCHAR(100) NOT NULL,
    `Total Payment` DECIMAL(10,2) NOT NULL
);

insert into `Product_Category_Vs_Payment_Value` (`Product Name`, `Total Payment`)
SELECT pro_trans.product_category_name_english as `Product Name`, ROUND(SUM(pay.payment_value),2) as `Total Payment`
FROM olist_orders_dataset ord
JOIN olist_order_items_dataset items
ON ord.order_id = items.order_id
JOIN olist_order_payments_dataset pay
ON ord.order_id = pay.order_id
JOIN olist_products_dataset pro
ON items.product_id = pro.product_id
JOIN product_category_name_translation pro_trans
ON pro.product_category_name = pro_trans.product_category_name
GROUP BY pro_trans.product_category_name_english
ORDER BY `Total Payment` DESC
limit 10;


#------------------------------------------------------------------------------
use olistdb;

show tables;


select * from `K1_Weekend_Weekday_Sum_PayVal`;
select * from `K2_Review_Score_5_Orders_Count`;
select * from `K3_AvgDeliveryDays_pet_shop`;
select * from `K4_Avg_Price_PayVal_sao_paulo`;
select * from `K5_Revew_Score_Vs_Avg_Delivery_Days`;
select * from `Product_Category_Vs_Payment_Value`;

#------------------------------------------------------------------------------

