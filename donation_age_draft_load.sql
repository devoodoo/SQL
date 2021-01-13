
GO

	DROP TABLE [CFScott].[dbo].[first_donation_age]

GO

	CREATE TABLE [CFScott].[dbo].[first_donation_age] 
	(
	 evnt NVARCHAR(50) null
	,rec_date date null
	,gift_amt float null
	,part_cons_id NVARCHAR(7) null
	,reg_date date
	,coach NVARCHAR(50) null
	,don_cons_id NVARCHAR(7) null
	)

GO

	BULK INSERT [CFScott].[dbo].[first_donation_age]
	FROM '\\Cf-finance\dbadmin\Robocleanup\nz.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

GO

	DROP TABLE [CFScott].[dbo].[first_donation_single]

GO

	CREATE TABLE [CFScott].[dbo].[first_donation_single]
	(
	evnt NVARCHAR(50)
	,rec_date date
	,part_cons_id NVARCHAR(7)
	)

GO

INSERT INTO [CFScott].[dbo].[first_donation_single]
	([evnt],[rec_date],[part_cons_id])
SELECT [evnt],MIN([rec_date]),[part_cons_id]
	FROM [CFScott].[dbo].[first_donation_age]
		WHERE [part_cons_id] <> [don_cons_id] and [gift_amt] > 0
			GROUP BY [evnt],[part_cons_id]

GO

	DROP TABLE [CFScott].[dbo].[first_donation_dollars]

GO

	CREATE TABLE [CFScott].[dbo].[first_donation_dollars]
	(
	evnt NVARCHAR(50)
	,gift_total float
	,part_cons_id NVARCHAR(7)
	)

GO

INSERT INTO [CFScott].[dbo].[first_donation_dollars]
	([evnt],[gift_total],[part_cons_id])
SELECT [evnt],SUM([gift_amt]) gift_total,[part_cons_id]
	FROM [CFScott].[dbo].[first_donation_age]
		GROUP BY [evnt],[part_cons_id]

GO

SELECT a.[evnt]
      ,a.[part_cons_id] part_cons
      ,a.[don_cons_id] don_cons
      ,a.[reg_date]
      ,a.[rec_date]
      ,a.[gift_amt] first_gift
      ,a.[coach]
      ,c.gift_total
      ,abs(DATEDIFF(DD,b.[rec_date],a.[reg_date])) [days]
  FROM [CFScott].[dbo].[first_donation_age] a
	inner join [CFScott].[dbo].[first_donation_single] b
	on b.[rec_date] = a.[rec_date] and b.[part_cons_id] = a.[part_cons_id]
	and b.[part_cons_id] <> a.[don_cons_id] and b.[evnt] = a.[evnt]
	inner join [CFScott].[dbo].[first_donation_dollars] c
	on c.[part_cons_id] = a.[part_cons_id] and c.[evnt] = a.[evnt]

GO