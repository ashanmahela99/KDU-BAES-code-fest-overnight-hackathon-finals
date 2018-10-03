CREATE VIEW [dbo].[ProductionCount]
	AS SELECT Id, Count, Okay, Date from Productions
	where Okay = 0;