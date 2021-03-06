/****** Script for SelectTopNRows command from SSMS  ******/

	BULK INSERT [CFNew].[dbo].[Participants]
	FROM '\\Cf-finance\dbadmin\Robocleanup\Quebec_Zips.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
	
SELECT
[Cons_id]
,[Fname]
,[Lname]
,[PartType]
,[TotGifts]
,[Evnt]
,[Zip3]
,[City]
,[area]
FROM [CFNew].[dbo].[Participants]

 TRUNCATE TABLE  [CFNew].[dbo].[Participants]
 
 
SELECT 
COUNT(DISTINCT [Cons_id]) #parts
 ,[PartType]
 ,SUM([TotGifts]) Total_Gifts
 ,b.[Area]
 ,[City]
 ,[Evnt]
 
FROM [CFNew].[dbo].[Participants] a inner join [CFNew].[dbo].[Postal] b on 
SUBSTRING(ltrim(rtrim(b.[Zip3])),1,3) = SUBSTRING(ltrim(rtrim(a.[Zip3])),1,3)
GROUP BY [PartType],b.[area],[City],[Evnt]