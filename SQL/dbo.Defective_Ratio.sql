CREATE VIEW [dbo].[Defective_Ratio]
	AS SELECT sum(case when Okay = 0 then 1 else 0 end)/COUNT(*) as Defective_Ratio
	From Productions