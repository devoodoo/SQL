
/*
	SELECT [name],[rdate],[lname],[fname],[city]
	FROM [CFScott].[dbo].[whowhatwhere]
*/
GO
	TRUNCATE TABLE [CFScott].[dbo].[whowhatwhere]
GO
	BULK INSERT [CFScott].[dbo].[whowhatwhere]
	FROM '\\Cf-finance\dbadmin\Robocleanup\UA13.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
GO
	WITH DUP AS (SELECT [name],
	ROW_NUMBER() OVER (PARTITION BY [name] 
	ORDER BY [name]) AS ROWCNT
	FROM [CFScott].[dbo].[whowhatwhere])
	DELETE DUP WHERE ROWCNT > 1
GO