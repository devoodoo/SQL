
/*
DROP TABLE [CFScott].[dbo].[golden_helmet_final]
CREATE TABLE [CFScott].[dbo].[golden_helmet_final] (
cons_id NVARCHAR(50) null)
*/

DROP TABLE [CFScott].[dbo].[golden_helmet]

CREATE TABLE [CFScott].[dbo].[golden_helmet] (
utp_reason NVARCHAR(50) null,
utp_date date null,
cons_id NVARCHAR(50) null,
lname NVARCHAR(50) null,
fname NVARCHAR(50) null,
status1 NVARCHAR(250) null,
status2 NVARCHAR(250) null
)

	BULK INSERT [CFScott].[dbo].[golden_helmet]
	FROM '\\Cf-finance\dbadmin\Robocleanup\Golden_Helmet.txt'
	WITH
	(
		FIRSTROW = 7,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
	
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD status08 NVARCHAR(250) null
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD status09 NVARCHAR(250) null
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD status10 NVARCHAR(250) null
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD status11 NVARCHAR(250) null
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD status12 NVARCHAR(250) null
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD status13 NVARCHAR(250) null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status1] = REPLACE([status1],' ','')
	WHERE [status1] LIKE '% %'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status2] = REPLACE([status2],' ','')
	WHERE [status2] LIKE '% %'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status1] = REPLACE([status1],'|','')
	WHERE [status1] LIKE '%|%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status2] = REPLACE([status2],'|','')
	WHERE [status2] LIKE '%|%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status1] = REPLACE([status1],'K200','')
	WHERE [status1] LIKE '%K200%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status2] = REPLACE([status2],'K200','')
	WHERE [status2] LIKE '%K200%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status1] = REPLACE([status1],'M200','')
	WHERE [status1] LIKE '%M200%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status2] = REPLACE([status2],'M200','')
	WHERE [status2] LIKE '%M200%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status08] = SUBSTRING(status2,CHARINDEX('2008',status2),LEN(status2)-CHARINDEX('2008',status2)+1)
	WHERE status2 like '%2008%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status09] = SUBSTRING(status2,CHARINDEX('2009',status2),LEN(status2)-CHARINDEX('2009',status2)+1)
	WHERE status2 like '%2009%'

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status10] = SUBSTRING(status2,CHARINDEX('2010',status2),LEN(status2)-CHARINDEX('2010',status2)+1)
	WHERE status2 like '%2010%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status11] = SUBSTRING(status2,CHARINDEX('2011',status2),LEN(status2)-CHARINDEX('2011',status2)+1)
	WHERE status2 like '%2011%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status12] = SUBSTRING(status1,CHARINDEX('2012',status1),LEN(status1)-CHARINDEX('2012',status1)+1)
	WHERE status1 like '%2012%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status13] = '2013TorontoRider'
	WHERE utp_reason is null and utp_date is null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status08] = null
	WHERE status08 like '%2008TorontoRiderUTP%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status09] = null
	WHERE status09 like '%2009TorontoRiderUTP%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status10] = null
	WHERE status10 like '%2010TorontoRiderUTP%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status11] = null
	WHERE status11 like '%2011TorontoRiderUTP%'
	
	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [status12] = null
	WHERE status12 like '%UTP%'
	
	ALTER TABLE [CFScott].[dbo].[golden_helmet]
ADD rides smallint null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = 0
	WHERE [rides] is null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = [rides] + 1
	WHERE status08 is not null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = [rides] + 1
	WHERE status09 is not null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = [rides] + 1
	WHERE status10 is not null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = [rides] + 1
	WHERE status11 is not null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = [rides] + 1
	WHERE status12 is not null

	UPDATE [CFScott].[dbo].[golden_helmet]
	SET [rides] = [rides] + 1
	WHERE status13 is not null

	TRUNCATE TABLE [CFScott].[dbo].[golden_helmet_final]
	INSERT INTO [CFScott].[dbo].[golden_helmet_final] ([cons_id])
	SELECT [cons_id] FROM [CFScott].[dbo].[golden_helmet]
	WHERE [rides] = 5