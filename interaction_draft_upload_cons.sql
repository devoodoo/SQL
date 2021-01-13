GO

DROP TABLE [CFScott].[dbo].[interaction_cons]

CREATE TABLE [CFScott].[dbo].[interaction_cons]
	(
	 media_cons NVARCHAR(7)
	,media_fname NVARCHAR(255) NULL
	,media_lname NVARCHAR(255) NULL
	,media_name NVARCHAR(255) NULL
	,dob_date date
	,gender NVARCHAR(50) NULL
	,pref_lang NVARCHAR(50) NULL
	,previous NVARCHAR(50) NULL
	,gifts float
	,event_name NVARCHAR(50) NULL
	,rfi_source1 NVARCHAR(255) NULL
	,rfi_source2 NVARCHAR(255) NULL
	,media_source1 NVARCHAR(255) NULL
	,media_source2 NVARCHAR(255) NULL
	,origin_source NVARCHAR(255) NULL
	,origin_subsource NVARCHAR(255) NULL
	)

GO

TRUNCATE TABLE [CFScott].[dbo].[interaction_cons]

GO

	BULK INSERT CFScott.dbo.interaction_cons
	FROM '\\Cf-finance\dbadmin\Robocleanup\media_big_interaction.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

GO