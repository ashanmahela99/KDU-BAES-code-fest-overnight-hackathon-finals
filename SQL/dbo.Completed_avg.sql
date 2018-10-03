CREATE PROCEDURE [dbo].[Completed_avg]
	@StepID bigint
AS
	declare @IotCount int
declare @IotCom int
declare @answer int
select Count(Count)
from Productions where Okay = 1 and Id = @StepID