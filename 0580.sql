select distinct a.dept_name,count(a.student_name) as student_number
from
(
select d.dept_id,d.dept_name,s.student_name
from department d 
left join 
student s
on s.dept_id = d.dept_id
) a
group by a.dept_name
order by student_number DESC