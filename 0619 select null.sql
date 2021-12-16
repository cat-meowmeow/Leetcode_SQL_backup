select
(
select ifnull(num,null) from my_numbers
group by num
having count(num)<2
order by num DESC
limit 0,1
) num

/*在select语句中写入空值，直接运行select语句，我们将会得到null值*/