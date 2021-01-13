/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [rundate]
      ,[evnt]
      ,SUM([total]) Amt
      ,[type]
  FROM [CFScott].[dbo].[trying]
  where [type] <> ''
  group by [rundate],[evnt],[type]
  order by evnt
  
  