/****** Script for SelectTopNRows command from SSMS  ******/
GO

DROP TABLE [CFScott].[dbo].[rtkoi_date]
CREATE TABLE [CFScott].[dbo].[rtkoi_date]
(rundate date)
INSERT INTO [CFScott].[dbo].[rtkoi_date] ([rundate])
SELECT DISTINCT [rundate]
  FROM [CFNew].[dbo].[fc_rtkoi]
  ORDER BY 1 desc
  
  GO
  
DROP TABLE [CFScott].[dbo].[sponsorship_sum]
CREATE TABLE [CFScott].[dbo].[sponsorship_sum]
([budget_type] nvarchar(10),[amount] numeric(19,2),[evnt] nvarchar(50),[rec_date] date)
INSERT INTO [CFScott].[dbo].[sponsorship_sum]
([budget_type],[amount],[evnt],[rec_date])
SELECT [budget_type],[amount],[evnt],[rec_date]
  FROM [CFNew].[dbo].[fc_sponsorship]
  WHERE [budget_type] like 'SUM%'
  
  GO
  
DROP TABLE [CFScott].[dbo].[rtkoi_event]
CREATE TABLE [CFScott].[dbo].[rtkoi_event]
(evnt nvarchar(50))
INSERT INTO [CFScott].[dbo].[rtkoi_event] (evnt)
SELECT DISTINCT LTRIM(RTRIM([evnt]))
  FROM [CFNew].[dbo].[fc_rtkoi]
  WHERE SUBSTRING([evnt],1,4) >= convert(nvarchar(4),GETDATE(),112) and [evnt] not like '%Custom%'
  ORDER BY 1
  
  GO
  
DROP TABLE [CFScott].[dbo].[rtkoi_fc]
CREATE TABLE [CFScott].[dbo].[rtkoi_fc]
(
      [rundate] date
      ,[evnt] varchar(50)
      ,[edate] date
      ,[part_type] varchar(50)
      ,[bracket0] int
      ,[bracket1] int
      ,[bracket2] int
      ,[bracket3] int
      ,[bracket4] int
      ,[bracket5] int
      ,[bracket6] int
      ,[bracket7] int
      ,[bracket8] int
      )
INSERT INTO [CFScott].[dbo].[rtkoi_fc] ([rundate],[evnt],[edate],[part_type],[bracket0],[bracket1],[bracket2],[bracket3],[bracket4],[bracket5],[bracket6],[bracket7],[bracket8])
SELECT [rundate],LTRIM(RTRIM([evnt])),[edate],[part_type]
      ,[bracket0],[bracket1],[bracket2],[bracket3]
      ,[bracket4],[bracket5],[bracket6],[bracket7],[bracket8]
  FROM [CFNew].[dbo].[fc_previous]
  WHERE SUBSTRING([evnt],1,4) >= convert(nvarchar(4),GETDATE(),112) and [evnt] not like '%Custom%'
  ORDER BY 1 desc
  
  GO
  
drop table [CFScott].[dbo].[rtkoi_alt]
create table [CFScott].[dbo].[rtkoi_alt]
	(
       [date] date
      ,[instance] nvarchar(6)
      ,[fr_id] int
      ,[evnt] nvarchar(50)
      ,[part_type] nvarchar(50)
      ,[new] numeric(19,2)
	)

insert into [CFScott].[dbo].[rtkoi_alt] ([date],[instance],[fr_id],[evnt],[part_type],[new])
SELECT [rundate]
      ,[instance]
      ,[fr_id]
      ,[evnt]
      ,[part_type]
      ,[num]
  FROM [CFNew].[dbo].[fc_rtkoi]
  WHERE [rundate] between '2011-01-01' and '2013-09-19'

UNION	

SELECT [rundate]
      ,[instance]
      ,[fr_id]
      ,[evnt]
      ,[part_type]
      ,[num]
  FROM [CFNew].[dbo].[fc_rtkoi_all]
  WHERE [rundate] between '2006-07-19' and '2010-12-31'
  ORDER BY 1 desc