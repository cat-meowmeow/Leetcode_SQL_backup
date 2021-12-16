# Write your MySQL query statement below
select 
question_id as survey_log
from survey_log
where answer_id is not null
group by question_id
order by count(answer_id) DESC
limit 1