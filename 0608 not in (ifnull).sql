Select Id,
CASE WHEN p_id is null THEN 'Root'
     WHEN id not in (select ifnull(p_id,0) from tree) THEN 'Leaf'
     ELSE 'Inner'
END
as Type
from tree



/*如果table2中存在一个null，  not in的查询永远都会返回false，即查询结果永远为空*/
Select Id,
CASE WHEN p_id is null THEN 'Root'
     WHEN tree.id not in (select p_id from tree) THEN 'Leaf'/*错误 有NULL时不选Not in*/
     ELSE 'Inner'
END
as Type
from tree