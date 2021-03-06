/****** Script for SelectTopNRows command from SSMS  ******/

GO

	DROP TABLE [CFScott].[dbo].[self]

GO

	CREATE TABLE [CFScott].[dbo].[self] 
	(
	 evnt NVARCHAR(50) null
	,rec_date date null
	,gift_amt float null
	,don_cons_id NVARCHAR(7) null
	,part_cons_id NVARCHAR(7) null
	,reg_date date
	,tgift_amt float null
	)

GO

	BULK INSERT [CFScott].[dbo].[self]
	FROM '\\Cf-finance\dbadmin\Robocleanup\self_don.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
	
GO

	DROP TABLE [CFScott].[dbo].[selfone]

GO

	CREATE TABLE [CFScott].[dbo].[selfone] 
	(
	 evnt NVARCHAR(50) null
	,rec_date date null
	,gift_amt float null
	,don_cons_id NVARCHAR(7) null
	,part_cons_id NVARCHAR(7) null
	,reg_date date
	,tgift_amt float null
	)

GO

INSERT INTO [CFScott].[dbo].[selfone] 
([evnt],[rec_date],[gift_amt],[don_cons_id],[part_cons_id],[reg_date],[tgift_amt])
SELECT [evnt]
      ,[rec_date]
      ,[gift_amt]
      ,[don_cons_id]
      ,[part_cons_id]
      ,[reg_date]
      ,[tgift_amt]
  FROM [CFScott].[dbo].[self]
  WHERE [don_cons_id] = [part_cons_id]
  ORDER BY [rec_date]

GO

	DROP TABLE [CFScott].[dbo].[selftwo]

GO

	CREATE TABLE [CFScott].[dbo].[selftwo] 
	(
	 evnt NVARCHAR(50) null
	,mrec_date date null
	,part_cons_id NVARCHAR(7) null
	)

GO

INSERT INTO [CFScott].[dbo].[selftwo] 
([evnt],[mrec_date],[part_cons_id])
SELECT [evnt]
      ,MIN([rec_date]) mrec_date
      ,[part_cons_id]
  FROM [CFScott].[dbo].[selfone]
  WHERE [don_cons_id] = [part_cons_id]
  GROUP BY [evnt],[part_cons_id]

GO

SELECT a.[evnt]
      ,[don_cons_id]
      ,a.[part_cons_id]
      ,[rec_date]
      ,[gift_amt]
      ,[reg_date]
      ,[tgift_amt]
      ,abs(DATEDIFF(DD,[reg_date],[rec_date])) [days]
  FROM [CFScott].[dbo].[selfone] a inner join [CFScott].[dbo].[selftwo] b
  on a.[part_cons_id] = b.[part_cons_id] and a.[evnt] = b.[evnt]
  and [mrec_date] = [rec_date]