CREATE VIEW [dbo].[Complete_Ratio]
	AS SELECT sum(case when Okay = 1 then 1 else 0 end)/COUNT(*) as Complete_Ratio
	From Productions