# Write your MySQL query statement below

select customer_number from(
select *,count(customer_number) as num from Orders
group by customer_number
order by num desc) a
limit 1

/*可以优化，将a与num直接写在里面*/
select customer_number from Orders
group by customer_number
order by count(customer_number) desc
limit 1