BEGIN

/*	*****MASTER CLEANUP*****
	--UNDO CHANGES AND RESTART
	TRUNCATE TABLE [CFScott].[dbo].[Canada_Post_Master]
	INSERT INTO [CFScott].[dbo].[Canada_Post_Master] ([POST],[CITY],[PROVINCE])
	SELECT [POST],[CITY],[PROVINCE] FROM [CFScott].[dbo].[Canada_Post_Backup]
	
	--CREATE BACKUP COPY
	TRUNCATE TABLE [CFScott].[dbo].[Canada_Post_Backup]
	INSERT INTO [CFScott].[dbo].[Canada_Post_Backup] ([POST],[CITY],[PROVINCE])
	SELECT [POST],[CITY],[PROVINCE] FROM [CFScott].[dbo].[Canada_Post_Master]
	
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'ON','Ontario')
	WHERE PROVINCE = 'ON'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'QC','Quebec')
	WHERE PROVINCE = 'QC'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'NS','Nova Scotia')
	WHERE PROVINCE = 'NS'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'NB','New Brunswick')
	WHERE PROVINCE = 'NB'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'MB','Manitoba')
	WHERE PROVINCE = 'MB'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'BC','British Columbia')
	WHERE PROVINCE = 'BC'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'PE','Prince Edward Island')
	WHERE PROVINCE = 'PE'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'SK','Saskatchewan')
	WHERE PROVINCE = 'SK'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'AB','Alberta')
	WHERE PROVINCE = 'AB'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'NL','Newfoundland and Labrador')
	WHERE PROVINCE = 'NL'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'NT','Northwest Territory')
	WHERE PROVINCE = 'NT'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'YT','Yukon Territory')
	WHERE PROVINCE = 'YT'
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = REPLACE(PROVINCE,'NU','Nunavut Territory')
	WHERE PROVINCE = 'NU'

	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Newfoundland and Labrador'
	WHERE Substring(POST,1,1) = 'A' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Nova Scotia'
	WHERE Substring(POST,1,1) = 'B' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Prince Edward Island'
	WHERE Substring(POST,1,1) = 'C' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'New Brunswick'
	WHERE Substring(POST,1,1) = 'E' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Manitoba'
	WHERE Substring(POST,1,1) = 'R' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Saskatchewan'
	WHERE Substring(POST,1,1) = 'S' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Alberta'
	WHERE Substring(POST,1,1) = 'T' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'British Columbia'
	WHERE Substring(POST,1,1) = 'V' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Northwest\Nunavut Territories'
	WHERE Substring(POST,1,1) = 'X' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Yukon Territory'
	WHERE Substring(POST,1,1) = 'Y' and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Quebec'
	WHERE Substring(POST,1,1) in('G','H','J') and (PROVINCE = '' or PROVINCE = ' ')
	UPDATE [CFScott].[dbo].[Canada_Post_Master]
	SET PROVINCE = 'Ontario'
	WHERE Substring(POST,1,1) in('K','L','M','N','P') and (PROVINCE = '' or PROVINCE = ' ')
	
	SELECT POST,CITY,PROVINCE
	FROM [CFScott].[dbo].[Canada_Post_Master]
	WHERE PROVINCE = '' or PROVINCE = ' '
	ORDER BY POST
		
	TRUNCATE TABLE [CFScott].[dbo].[Canada_Post_Master]	
	TRUNCATE TABLE [CFScott].[dbo].[Canada_Post_Backup]
	
	CREATE TABLE [CFScott].[dbo].[Canada_Post_Master] (POST NVARCHAR(50), CITY NVARCHAR(50), PROVINCE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[Canada_Post_Backup] (POST NVARCHAR(50), CITY NVARCHAR(50), PROVINCE NVARCHAR(50))
	*****MASTER CLEANUP*****
	
	
	DROP TABLE [CFScott].[dbo].[robozip1]
	DROP TABLE [CFScott].[dbo].[robozip2]
	DROP TABLE [CFScott].[dbo].[robozip3]
	CREATE TABLE [CFScott].[dbo].[robozip1] (POST NVARCHAR(50), CITY NVARCHAR(50), PROVINCE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[robozip2] (POST NVARCHAR(50), CITY NVARCHAR(50), PROVINCE NVARCHAR(50))
	CREATE TABLE [CFScott].[dbo].[robozip3] (POST NVARCHAR(50), CITY NVARCHAR(50), PROVINCE NVARCHAR(50))

	TRUNCATE TABLE [CFScott].[dbo].[robozip1]
	TRUNCATE TABLE [CFScott].[dbo].[robozip2]
	TRUNCATE TABLE [CFScott].[dbo].[robozip3]

	UNDO CHANGES AND RESTART
	TRUNCATE TABLE [CFScott].[dbo].[robozip1]
	INSERT INTO [CFScott].[dbo].[robozip1] ([POST],[CITY],[PROVINCE])
	SELECT [POST],[CITY],[PROVINCE] FROM [CFScott].[dbo].[robozip2]
*/

	--CREATE BACKUP COPY
	TRUNCATE TABLE [CFScott].[dbo].[robozip2]
	INSERT INTO [CFScott].[dbo].[robozip2] ([POST],[CITY],[PROVINCE])
	SELECT [POST],[CITY],[PROVINCE] FROM [CFScott].[dbo].[robozip1]
	
	DELETE FROM [CFScott].[dbo].[robozip1]
	WHERE POST is null or POST = ' '
	
	UPDATE [CFScott].[dbo].[robozip1]
	SET POST = UPPER(POST)
	
	UPDATE [CFScott].[dbo].[robozip1]
	SET POST = REPLACE(POST,' ','')
	WHERE POST like '% %'
	
	UPDATE [CFScott].[dbo].[robozip1]
	SET POST = REPLACE(POST,'-','')
	WHERE POST like '%-%'
	
	UPDATE [CFScott].[dbo].[robozip1]
	SET POST = REPLACE(POST,'/','')
	WHERE POST like '%/%'
	
	UPDATE [CFScott].[dbo].[robozip1]
	SET POST = REPLACE(POST,'\','')
	WHERE POST like '%\%'
	
	UPDATE [CFScott].[dbo].[robozip1]
	SET POST = REPLACE(POST,'.','')
	WHERE POST like '%.%'
	
	DELETE FROM [CFScott].[dbo].[robozip1]
	WHERE LEN(POST) <> 6;
	
	WITH DUP AS (SELECT [POST],ROW_NUMBER() OVER (PARTITION BY [POST]
	ORDER BY [POST]) AS ROWCNT
	FROM [CFScott].[dbo].[robozip1])
	DELETE DUP WHERE ROWCNT > 1	
	
	TRUNCATE TABLE [CFScott].[dbo].[robozip3]
	INSERT INTO [CFScott].[dbo].[robozip3] ([POST],[CITY],[PROVINCE])
	SELECT [CFScott].[dbo].[robozip1].[POST],[CFScott].[dbo].[Canada_Post_Master].[CITY],
	[CFScott].[dbo].[Canada_Post_Master].[PROVINCE] 
	FROM [CFScott].[dbo].[robozip1] inner join [CFScott].[dbo].[Canada_Post_Master] 
	ON [CFScott].[dbo].[robozip1].[POST] = [CFScott].[dbo].[Canada_Post_Master].[POST]

END