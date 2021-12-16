select name
from Candidate
where id in
    (select a.CandidateId from   /*注意 IN OR ANY SOME 不能直接接limit 需要多套一层*/
    (
        select CandidateId
        from Vote
        group by CandidateId
        order by count(CandidateId) DESC
        limit 0,1
    ) a
    )

/*
limit 3,2 从第三条开始，读两条（即第四五条）
== limit 2 offset 3
*/