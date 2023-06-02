-- сейчас поле статус есть, представим, что его удалили.

create table analysis.Orders_1 as
select order_id,order_ts,user_id,bonus_payment,payment,"cost",bonus_grant from analysis.Orders;


-- соберём витрину analysis.order_info
create table analysis.order_info as
select 
osl.order_id,
osl.status_id,
os."key"
from production.orderstatuslog as osl
join analysis.orderstatuses as os on 
osl.status_id = os.id;




ALTER TABLE analysis.Orders_1
ADD status int4 null;


UPDATE analysis.Orders_1
SET status = order_info.status_id
FROM analysis.order_info
WHERE analysis.Orders_1.order_id = analysis.order_info.order_id;


select * from analysis.Orders_1


