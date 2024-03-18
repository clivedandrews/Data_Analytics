CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(yr int, mth int)
begin
select ordernumber as `Order No`, orderdate as `Order Date`, status as `Status` 
from orders
where year(orderdate) = yr
and month(orderdate) = mth;
end