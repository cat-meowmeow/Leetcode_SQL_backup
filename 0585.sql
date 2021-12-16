/* Write your T-SQL query statement below */
With table_TIV as(
    select *,count(TIV_2015)over(partition by TIV_2015) as count_2015
    from insurance
),
table_LL as(
    select *,count(TIV_2015)over(partition by LAT,LON) as count_LL
    from insurance
)

select sum(a.TIV_2016) as TIV_2016 from
(
    select * from table_TIV
    where count_2015>1
) as a
inner join
(
    select * from table_LL
    where count_LL=1
) as b
on a.PID=b.PID

/* where 相当于判断语句，不能写在With table里，
要放在后面
 */
 
 /* 优化后 */
select sum(a.TIV_2016) as TIV_2016 from
(
    select *,count(TIV_2015)over(partition by TIV_2015) as count_2015 from insurance
    
) as a
inner join
(
    select * ,count(TIV_2015)over(partition by LAT,LON) as count_LL from insurance
   
) as b 
on a.PID=b.PID
where a.count_2015>1 and b.count_LL=1