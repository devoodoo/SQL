/****** Script for SelectTopNRows command from SSMS  ******/
	/*
SELECT [budget_type]
      ,[amount]
      ,[evnt]
      ,[rec_date]
      ,[trid]
      ,[id]
  FROM [CFNew].[dbo].[fc_sponsorship]
  ORDER by id desc
  */

GO

  	INSERT INTO [CFNew].[dbo].[fc_sponsorship] 
  		([budget_type],[amount],[evnt],[rec_date],[trid])
			VALUES ('CS2',10000,'2013 Alberta RTCC','2013-9-18','1452')


GO


