CREATE PROCEDURE [dbo].[Emp_Performance]
	@Shift varchar , @StepID varchar
AS
	SELECT s.Employee_ID , s.Line_Manager, s.Shift, s.StepID, p.Okay 
	from Shift_Info s inner join
	Productions p on p.Id = @StepID
	where p.Okay = 'false' and s.Shift = @Shift