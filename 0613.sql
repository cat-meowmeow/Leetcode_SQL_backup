# Write your MySQL query statement below
select min(abs(a.x-b.x)) as shortest
from point a
left join 
point b
on a.x != b.x