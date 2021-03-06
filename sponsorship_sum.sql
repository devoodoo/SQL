/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [budget_type]
      ,SUM([amount]) tot
      ,[evnt]
      ,[rec_date]
      ,[trid]
      ,[id]
  FROM [CFNew].[dbo].[fc_sponsorship]
  group by [budget_type],[evnt],[rec_date],[trid],[id]
  order by [rec_date]