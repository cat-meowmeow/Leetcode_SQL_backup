/* Write your MySQL query statement below */
SELECT player_id,device_id FROM
    (SELECT
        player_id,device_id,
        RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS rnFROM Activity
	) as a                                # In mysql , must use () as table
WHERE rn = 1


/* Write your PL/SQL query statement below */
select player_id,device_id from 
	(
    select player_id,device_id,
    RANK()over(partition by player_id order by  event_date ) as rank_date from Activity 
	)
where rank_date = 1



/* Write your MS SQL SEVER query statement below */
select player_id,device_id from 
(
    select player_id,device_id,
    RANK()over(partition by player_id order by  event_date ) rank_date from Activity 
) a										# In sqlsever, no need t use as
where rank_date = 1