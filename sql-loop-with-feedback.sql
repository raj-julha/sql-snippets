/*
2016-04-06 (Raj)
T-SQL sample loop with feedback
This sample demonstrates how to show progress messages within a loop

If you use the print @msg technique to display messages inside a loop nothing is displayed
until the completion of the loop. The code snippet below demonstrates usage of 
RAISERROR WITH NOWAIT to achieve the expected behaviour

Pre-requisites
==============
1) Ensure that the "Results to Text" option is selected in the SQL Management Studio
*/

declare @ctr int
declare @startProcessDate DateTime
declare @msg varchar(max)
declare @rundurationInSecs int
select @startProcessDate = getdate()
select @ctr = 1
select @rundurationInSecs = 30
select @msg = 'Run actions for ' + convert(varchar, @rundurationInSecs) + ' seconds, provide feedback after each.'
RAISERROR (@msg, 0, 1) WITH NOWAIT
waitfor delay '00:00:01'
while (datediff(second,  @startProcessDate, GETDATE()) < @rundurationInSecs)
begin    
    select @msg = 'Sequence ' + convert(varchar, @ctr) + ' -> ' + convert(varchar, getdate(), 121)
    
    -- http://stackoverflow.com/questions/2072417/sql-server-print-affected-rows-during-while-loop
    -- print @msg
    RAISERROR (@msg, 0, 1) WITH NOWAIT
    select @ctr = @ctr + 1
    waitfor delay '00:00:05'
end
