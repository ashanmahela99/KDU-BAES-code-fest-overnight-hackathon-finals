CREATE trigger Get_Date_Time_On_Shift
ON Shift_Info
AFTER INSERT, UPDATE 
AS UPDATE Shift_Info SET Date = CURRENT_TIMESTAMP
      FROM Shift_Info t
	    INNER JOIN inserted i
		  ON t.Rows = i.Rows