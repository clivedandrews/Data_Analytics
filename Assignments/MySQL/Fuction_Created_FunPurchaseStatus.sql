CREATE DEFINER=`root`@`localhost` FUNCTION `FunPurchaseStatus`(customernumber int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
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
 END