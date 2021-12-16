# Write your MySQL query statement below
select name as Name from Employee
where Id in
(
    select ManagerId from Employee
    group by ManagerId
    having count(ManagerId)>4
)


/*注意group by 后面是having进行筛选*/