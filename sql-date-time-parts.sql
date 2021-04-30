-- get date only
select cast(floor(cast(getdate() as float)) as datetime)
-- Output is -- 2021-04-30 00:00:00.000

select cast(floor(cast(datecreated as float)) as datetime), count(*) 
from Table1
group by cast(floor(cast(datecreated as float)) as datetime)
