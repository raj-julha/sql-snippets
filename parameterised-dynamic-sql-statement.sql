/*
This sample demonstrates usage of parameterised arguments when building 
dynamic sql statements for execution with sp_executesql command
*/
declare @tableName nvarchar(50)
declare @sql nvarchar(max) 
declare @whereclause nvarchar(max)
declare @ParmDefinition NVARCHAR(max)
declare @StartDate datetime, @EndDate datetime

-- The value of @TableName should be an existing tabloe or a work table that starts with #
-- Using a table variable created with statement below doesn't seem to work
/*
DECLARE @DemoTable1 AS TABLE (ID INT NOT NULL IDENTITY PRIMARY KEY,
 Name varchar(50) null,
 Description varchar(50),
 DateCreated datetime null
 )
*/
select @tableName = '[SomeTableName]'

select @StartDate = dateadd(DAY, -2, getdate()), @EndDate = getdate()
select @ParmDefinition = N' @pStartDate datetime, @pEndDate datetime'
select @sql = 'SELECT * FROM ' + @tableName + '  WHERE DateCreated BETWEEN @pStartDate AND @pEndDate'
-- print @sql
-- print statement will show line below
-- SELECT * FROM [SomeTableName]  WHERE DateCreated BETWEEN @pStartDate AND @pEndDate

EXECUTE sp_executesql @sql, @ParmDefinition , @pStartDate = @startDate, @pEndDate = @endDate 
