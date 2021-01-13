GO
/*
	DROP TABLE [CFScott].[dbo].[roboclean1]
	DROP TABLE [CFScott].[dbo].[roboclean2]
	DROP TABLE [CFScott].[dbo].[roboclean3]
	DROP TABLE [CFScott].[dbo].[roboclean4]
	DROP TABLE [CFScott].[dbo].[roboclean5]
	DROP TABLE [CFScott].[dbo].[roboclean6]
	DROP TABLE [CFScott].[dbo].[roboclean7]
	DROP TABLE [CFScott].[dbo].[roboclean8]
	DROP TABLE [CFScott].[dbo].[roboclean9]
	DROP TABLE [CFScott].[dbo].[roboclean0]
	CREATE TABLE [CFScott].[dbo].[roboclean1] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean2] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean3] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean4] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean5] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean6] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean7] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean8] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean9] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[roboclean0] (DNC NVARCHAR(50), PHONE NVARCHAR(50), MOBILE NVARCHAR(50))
*/

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean2]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean3]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean4]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean5]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean6]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean7]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean8]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean9]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean0]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\weekendTO13March1.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
/*
	--CREATE BACKUP COPY
	TRUNCATE TABLE [CFScott].[dbo].[roboclean2]
	INSERT INTO [CFScott].[dbo].[roboclean2] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

	--UNDO CHANGES AND RESTART
	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	INSERT INTO [CFScott].[dbo].[roboclean1] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean2]
*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE]
	WHERE [PHONE] is null and [MOBILE] is not null
	
   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'
/*
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = REPLACE([MOBILE],'x','')
	WHERE [MOBILE] LIKE '%x%'
*/
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10
/*
	INSERT INTO [CFScott].[dbo].[roboclean1] ([DNC],[PHONE],[MOBILE])
	VALUES ('FALSE','3236549255','254')
*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean3]
	INSERT INTO [CFScott].[dbo].[roboclean3] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]
/*
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean3]
	ORDER BY [MOBILE] DESC
*/
GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\va13_cch_reg.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean4]
	INSERT INTO [CFScott].[dbo].[roboclean4] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\test0.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean5]
	INSERT INTO [CFScott].[dbo].[roboclean5] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\test0.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean6]
	INSERT INTO [CFScott].[dbo].[roboclean6] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\test0.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean7]
	INSERT INTO [CFScott].[dbo].[roboclean7] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\test0.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean8]
	INSERT INTO [CFScott].[dbo].[roboclean8] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\test0.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean9]
	INSERT INTO [CFScott].[dbo].[roboclean9] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	
	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\test0.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [DNC] = 'true'
	or [MOBILE] like '%dnc%' or [MOBILE] like '%donotcall%' or [MOBILE] like '%wrong%' or [MOBILE] like '%invalid%'
	or [PHONE] like '%dnc%' or [PHONE] like '%donotcall%' or [PHONE] like '%wrong%' or [PHONE] like '%invalid%'

   --remove characters
	DECLARE @alpha int = 33
	while @alpha < 123
	BEGIN
	if @alpha = 48 --skip numerals
		set @alpha = 58
	if @alpha = 88 --skip X
		set @alpha = 89
	if @alpha = 120 -- skip x
		set @alpha = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha), '')
	where [PHONE] like '%' + char(@alpha) + '%'
		set @alpha = @alpha + 1
	END

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-1)
	WHERE SUBSTRING([PHONE],1,1) = '1'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = RIGHT([PHONE], LEN([PHONE]) - PATINDEX('%[^0-9]%',[PHONE]))
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = LEFT([PHONE],LEN([PHONE]) - LEN([MOBILE]) - 1)
	WHERE SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'x' 
	or SUBSTRING([PHONE],PATINDEX('%[^0-9]%',[PHONE]),1) = 'X' 
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null
	WHERE SUBSTRING([MOBILE],1,1) NOT IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = '|' + [MOBILE]
	WHERE SUBSTRING([MOBILE],1,1) IN ('1','2','3','4','5','6','7','8','9','0')
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE [PHONE] IN ('1111111111','2222222222','3333333333','4444444444','5555555555','6666666666','7777777777','8888888888','9999999999','0000000000',
	'0123456789','0987654321','9876543210','1234567890')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE SUBSTRING([PHONE],1,1) = '0' or SUBSTRING([PHONE],1,1) = '1' or SUBSTRING([PHONE],4,3) = '555' or LEN([PHONE]) <> 10

	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] is null;

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean0]
	INSERT INTO [CFScott].[dbo].[roboclean0] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

GO

	--BEGIN DE-DUPING PROCESS ON ALL FILES
	
	--delete * from table1 intersect select * from table2

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean4] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean9]
	FROM [CFScott].[dbo].[roboclean9] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

/*
	DECLARE @phone NVARCHAR(50)
	DECLARE phone_cursor CURSOR FOR
	SELECT [PHONE] FROM [CFScott].[dbo].[roboclean3]
	OPEN phone_cursor   
	FETCH NEXT FROM phone_cursor INTO @phone
	WHILE @@FETCH_STATUS = 0   
	BEGIN

	FETCH NEXT FROM phone_cursor INTO @phone  
	SELECT @@FETCH_STATUS AS fetch_status   
	END  
	CLOSE phone_cursor   
	DEALLOCATE phone_cursor
*/
	GO

BEGIN
USE msdb
	EXEC sp_start_job roboclean_export
END