# Write your MySQL query statement below
select followee as follower,count(distinct follower) as num
from follow
where followee in
(
    select distinct follower from follow
)
group by followee