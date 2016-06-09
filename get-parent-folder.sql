-- 2013-06-03 (Raj)
-- Get parent folder from a column containing fully qualfied path

declare @x varchar(200) 
select @x = '\\servername\subfld1\Images\PRFX\PRFX_230B\PRFX_230B_1.tif'
select CHARINDEX('\',@x,1)
select CHARINDEX('\',REVERSE(@x),1) 
select REVERSE(SUBSTRING(REVERSE(@x),CHARINDEX('\',REVERSE(@x),1)+1,200 ))
select REVERSE(SUBSTRING(REVERSE(@x),CHARINDEX('\',REVERSE(@x),1)+1,LEN(@x)))
-- outcome = \\servername\subfld1\Images\PRFX\PRFX_230B