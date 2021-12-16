# Write your MySQL query statement below

select 
ROUND(
    count(distinct player_id)/(select count(distinct player_id) from Activity),2
) as  fraction
from Activity 
where (player_id,event_date) in
(select player_id,date(min(event_date)+1) as event_date 
from Activity 
group by player_id)


/* 先写date(min)+1 得到判断语句，   
再用where in 写出判断，最好不拆分表格
最后写select后面的逻辑运算过程 */