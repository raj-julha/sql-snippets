-- Get filename from a column containing fully qualfied path

declare @x varchar(200) 
select @x = '\\servername\subfld1\Images\PRFX\PRFX_230B\PRFX_230B_1.tif'
select CHARINDEX('\',@x,1) -- 1
select CHARINDEX('\',REVERSE(@x),1) -- 16
select REVERSE(@x) -- fit.1_B032_XFRP\B032_XFRP\XFRP\segamI\1dlfbus\emanrevres\\
select LEFT(REVERSE(@x), CHARINDEX('\',REVERSE(@x))-1) -- fit.1_B032_XFRP
select REVERSE(LEFT(REVERSE(@x), CHARINDEX('\',REVERSE(@x))-1)) -- PRFX_230B_1.tif
