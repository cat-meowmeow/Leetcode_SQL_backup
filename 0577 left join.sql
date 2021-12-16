SELECT
    e.name, b.bonus
FROM
    Employee e
        LEFT JOIN
    Bonus b
        ON e.empid = b.empid
WHERE
    b.bonus < 1000 OR b.bonus IS NULL




/* 这样写不对*/
select e.name,b.bonus
from
(    #不能将join之后的部分用select制成新表，否则会报错出现两个empID。直接From this table 就能避免
select * from 
    Employee e
        LEFT JOIN
    Bonus b
        ON e.empid = b.empid
) a
WHERE
    b.bonus < 1000 OR b.bonus IS NULL

