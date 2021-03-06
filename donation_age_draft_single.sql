/****** Script for SelectTopNRows command from SSMS  ******/


SELECT substring(convert(varchar(10),[rec_date],110),1,10)
FROM [CFScott].[dbo].[first_donation_age]

substring(convert(varchar(20),d,110),1,10)

DROP TABLE [CFScott].[dbo].[first_donation_single]
CREATE TABLE [CFScott].[dbo].[first_donation_single]
(	evnt NVARCHAR(50)
	,rec_date date
	,part_cons_id NVARCHAR(7)
)
INSERT INTO [CFScott].[dbo].[first_donation_single] (evnt,rec_date,part_cons_id)
SELECT [evnt],MIN([rec_date]),[part_cons_id]
FROM [CFScott].[dbo].[first_donation_age]
GROUP BY [evnt],[part_cons_id]
ORDER BY 3,2




DROP TABLE [CFScott].[dbo].[first_donation_age]
CREATE TABLE [CFScott].[dbo].[first_donation_age]
(	 part_cons_id NVARCHAR(7)
	,don_cons_id NVARCHAR(7)
	,reg_date date
	,rec_date date
	,gift_amt float
	,evnt NVARCHAR(50)
	,fname NVARCHAR(50)
	,lname NVARCHAR(50)
	,coach NVARCHAR(50)
	,part_type NVARCHAR(50)	
)

	BULK INSERT [CFScott].[dbo].[first_donation_age]
	FROM '\\Cf-finance\dbadmin\Robocleanup\first_donation_test.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
	
	
	SELECT TOP 1000 [part_cons_id]
      ,[don_cons_id]
      ,[reg_date]
      ,[rec_date]
      ,[gift_amt]
      ,[evnt]
      ,[fname]
      ,[lname]
      ,[coach]
      ,[part_type]
  FROM [CFScott].[dbo].[first_donation_age]
  
  
		[evnt]
		,[rec_date]
		,[part_cons_id]
  FROM [CFScott].[dbo].[first_donation_single]