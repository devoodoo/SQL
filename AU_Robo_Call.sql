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
	FROM '\\Cf-finance\dbadmin\Robocleanup\sy13_rfi.txt'
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
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alpha2 = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

	WITH DUP AS (SELECT [PHONE],[MOBILE],
	ROW_NUMBER() OVER (PARTITION BY [PHONE],[MOBILE] 
	ORDER BY [PHONE],[MOBILE]) AS ROWCNT
	FROM [CFScott].[dbo].[roboclean1])
	DELETE DUP WHERE ROWCNT > 1

	TRUNCATE TABLE [CFScott].[dbo].[roboclean3]
	INSERT INTO [CFScott].[dbo].[roboclean3] ([DNC],[PHONE],[MOBILE])
	SELECT [DNC],[PHONE],[MOBILE] FROM [CFScott].[dbo].[roboclean1]

	GO

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]

	BULK INSERT CFScott.dbo.roboclean1
	FROM '\\Cf-finance\dbadmin\Robocleanup\pr14_rfi.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alpha2 = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	FROM '\\Cf-finance\dbadmin\Robocleanup\ml14_walk.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alpha2 = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	FROM '\\Cf-finance\dbadmin\Robocleanup\pr14_walk.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alpha2 = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	FROM '\\Cf-finance\dbadmin\Robocleanup\SY13_STRAG.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alph2a = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	FROM '\\Cf-finance\dbadmin\Robocleanup\SY13_STRAG.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alph2a = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	FROM '\\Cf-finance\dbadmin\Robocleanup\SY13_STRAG.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alph2a = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	FROM '\\Cf-finance\dbadmin\Robocleanup\SY13_STRAG.txt'
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

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = [MOBILE] 
	WHERE [PHONE] is null

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [MOBILE] = null

   --remove characters
	DECLARE @alpha2 int = 33
	while @alpha2 < 123
	BEGIN
	if @alpha2 = 48 --skip numerals
		set @alpha2 = 58
	if @alpha2 = 88 --skip X
		set @alpha2 = 89
	if @alph2a = 120 -- skip x
		set @alpha2 = 121
	update [CFScott].[dbo].[roboclean1]
		set [PHONE] = replace([PHONE], char(@alpha2), '')
	where [PHONE] like '%' + char(@alpha2) + '%'
		set @alpha2 = @alpha2 + 1
	END
	
	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = REPLACE([PHONE],' ','')
	WHERE [PHONE] LIKE '% %'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = RIGHT([PHONE], LEN([PHONE])-2)
	WHERE SUBSTRING([PHONE],1,2) = '61'

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = '0' + [PHONE]
	WHERE SUBSTRING([PHONE],1,1) <> '0'

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
	
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE [PHONE] IN ('011111111','022222222','033333333','066666666','055555555','044444444','077777777','088888888','099999999','0111111111',
'0222222222','0333333333','0666666666','0555555555','0444444444','0777777777','0888888888','0999999999','021111111','022222222','023333333','024444444',
'025555555','026666666','027777777','028888888','029999999','031111111','032222222','033333333','034444444','035555555','036666666','037777777','038888888',
'039999999','041111111','042222222','043333333','044444444','045555555','046666666','047777777','048888888','049999999','051111111','052222222','053333333',
'054444444','055555555','056666666','057777777','058888888','059999999','061111111','062222222','063333333','064444444','065555555','066666666','067777777',
'068888888','069999999','071111111','072222222','073333333','074444444','075555555','076666666','077777777','078888888','079999999','081111111','082222222',
'083333333','084444444','085555555','086666666','087777777','088888888','089999999','091111111','092222222','093333333','094444444','095555555','096666666',
'097777777','098888888','099999999','020000000','030000000','040000000','050000000','060000000','070000000','080000000','090000000')

	UPDATE [CFScott].[dbo].[roboclean1]
	SET [PHONE] = null
	WHERE LEN([PHONE]) <> 10 or SUBSTRING([PHONE],1,2) = '01'

	/*SELECT * FROM [CFScott].[dbo].[roboclean1]*/
	DELETE FROM [CFScott].[dbo].[roboclean1]
	WHERE ([MOBILE] is null and [PHONE] is null);

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
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean4] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean4] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean4] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[MOBILE] = a.[MOBILE]	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean3]
	FROM [CFScott].[dbo].[roboclean3] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean5] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean4]
	FROM [CFScott].[dbo].[roboclean4] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean6] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean5]
	FROM [CFScott].[dbo].[roboclean5] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean7] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean8] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean6]
	FROM [CFScott].[dbo].[roboclean6] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean7]
	FROM [CFScott].[dbo].[roboclean7] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean9] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean8]
	FROM [CFScott].[dbo].[roboclean8] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	

	DELETE [CFScott].[dbo].[roboclean9]
	FROM [CFScott].[dbo].[roboclean9] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[MOBILE]

	DELETE [CFScott].[dbo].[roboclean9]
	FROM [CFScott].[dbo].[roboclean9] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[PHONE]	

	DELETE [CFScott].[dbo].[roboclean9]
	FROM [CFScott].[dbo].[roboclean9] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[MOBILE] = a.[PHONE]

	DELETE [CFScott].[dbo].[roboclean9]
	FROM [CFScott].[dbo].[roboclean9] a 
	INNER JOIN [CFScott].[dbo].[roboclean0] b 
	ON b.[PHONE] = a.[MOBILE]
	
	GO

BEGIN
USE msdb
	EXEC sp_start_job roboclean_export
END