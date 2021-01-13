
GO

	DROP TABLE [CFScott].[dbo].[interaction_report]
	CREATE TABLE [CFScott].[dbo].[interaction_report] 
	(
	cons_id NVARCHAR(7)
	,name NVARCHAR(255)
	,fname NVARCHAR(255)
	,lname NVARCHAR(255)
	,registration date
	,[self] NVARCHAR(50)
	,evnt NVARCHAR(50)
	,part_type NVARCHAR(50)
	,total_donations float
	,origin1 NVARCHAR(255)
	,origin2 NVARCHAR(255)
	,origin_app NVARCHAR(255)
	,lang NVARCHAR(50)
	,gender NVARCHAR(50)
	,dob date
	,media1 NVARCHAR(255)
	,media2 NVARCHAR(255)
	,rfi1 NVARCHAR(255)
	,rfi2 NVARCHAR(255)
	,[prior] NVARCHAR(3)
	)

GO

	BULK INSERT CFScott.dbo.interaction_report
	FROM '\\Cf-finance\dbadmin\Robocleanup\Bog_Ol_Media_report.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
	
GO

	DROP TABLE [CFScott].[dbo].[interaction_reg]
	CREATE TABLE [CFScott].[dbo].[interaction_reg] 
	(
	name NVARCHAR(255)
	,evnt NVARCHAR(50)
	,cons_id NVARCHAR(7)
	,lname NVARCHAR(255)
	,fname NVARCHAR(255)
	,reg date
	,[type] NVARCHAR(25)
	,rfi date
	,avg_days int
	,cnt int
	)

GO

	BULK INSERT CFScott.dbo.interaction_reg
	FROM '\\Cf-finance\dbadmin\Robocleanup\reg_total.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)
	
GO
	
	DROP TABLE [CFScott].[dbo].[interaction_rfi]
	CREATE TABLE [CFScott].[dbo].[interaction_rfi] 
	(
	name NVARCHAR(255)
	,rfi date
	,lname NVARCHAR(255)
	,fname NVARCHAR(255)
	,evnt_yr NVARCHAR(50)
	,evnt_type NVARCHAR(50)
	)

GO

	BULK INSERT CFScott.dbo.interaction_rfi
	FROM '\\Cf-finance\dbadmin\Robocleanup\rfi_total_evnt.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

GO

DROP TABLE [CFScott].[dbo].[interaction_cons]
CREATE TABLE [CFScott].[dbo].[interaction_cons]
	(
	 media_cons NVARCHAR(7)
	,media_fname NVARCHAR(255)
	,media_lname NVARCHAR(255)
	,media_name NVARCHAR(255)
	,dob_date date
	,gender NVARCHAR(50)
	,pref_lang NVARCHAR(50)
	,previous bit
	,rfi_source1 NVARCHAR(255)
	,rfi_source2 NVARCHAR(255)
	,media_source1 NVARCHAR(255)
	,media_source2 NVARCHAR(255)
	,origin_source NVARCHAR(255)
	,origin_subsource NVARCHAR(255)
	)

GO

	BULK INSERT CFScott.dbo.interaction_rfi
	FROM '\\Cf-finance\dbadmin\Robocleanup\reg_total.txt'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = '\t',
		ROWTERMINATOR = '\n',
		MAXERRORS = 0
	)

GO





INSERT INTO [CFScott].[dbo].[interaction_final]
(	 rfi_name
	,rfi_date1
	,rfi_lname
	,rfi_fname
	,rfi_evnt
	,reg_name
	,reg_evnt
	,reg_cons
	,reg_lname
	,reg_fname
	,reg_date
	,reg_part_type
	,rfi_date2
	,avg_days_rfi_to_reg
	,count_rfi_to_reg
	,media_cons
	,media_fname
	,media_lname
	,media_name
	,media_date
	,media_subject
	,interaction_type
	,origin_source
	,origin_subsource
	,pref_lang
	,gender
	,date_of_birth
	,rfi_source1
	,rfi_source2
	)
SELECT DISTINCT
		b.[name] rfi_name
      ,b.[rfi] rfi_date1
      ,b.[lname] rfi_lname
      ,b.[fname] rfi_fname
      ,b.[evnt] rfi_evnt
      
      ,c.[name] reg_name
      ,c.[evnt] reg_evnt
      ,c.[cons_id] reg_cons
      ,c.[lname] reg_lname
      ,c.[fname] reg_fname
      ,c.[reg] reg_date
      ,c.[type] reg_part_type
      ,c.[rfi] rfi_date2
      ,c.[avg_days] avg_days_rfi_to_reg
      ,c.[cnt] count_rfi_to_reg
      
      ,a.[cons_id] media_cons
      ,a.[fname] media_fname
      ,a.[lname] media_lname
      ,a.[name] media_name
      ,a.[creation] media_date
      ,a.[subject] media_subject
      ,a.[interaction] interaction_type
      ,a.[origin1] origin_source
      ,a.[origin2] origin_subsource
      ,a.[lang] pref_lang
      ,a.[gender] gender
      ,a.[dob] date_of_birth
      ,a.[rfi1] rfi_source1
      ,a.[rfi2] rfi_source2
	FROM 
	[CFScott].[dbo].[interaction_report] a 
	INNER JOIN 	[CFScott].[dbo].[interaction_rfi] b on b.[name] = a.[name]
	INNER JOIN [CFScott].[dbo].[interaction_reg] c on c.[name] = a.[name]

GO

SELECT * FROM [CFScott].[dbo].[interaction_final]

GO

DROP TABLE [CFScott].[dbo].[interaction_final]
CREATE TABLE [CFScott].[dbo].[interaction_final]
	(
	rfi_name NVARCHAR(255)
	,rfi_date1 date
	,rfi_lname NVARCHAR(255)
	,rfi_fname NVARCHAR(255)
	,rfi_evnt NVARCHAR(50)
      
	,reg_name NVARCHAR(255)
	,reg_evnt NVARCHAR(50)
	,reg_cons NVARCHAR(7)
	,reg_lname NVARCHAR(255)
	,reg_fname NVARCHAR(255)
	,reg_date date
	,reg_part_type NVARCHAR(25)
	,rfi_date2 date
	,avg_days_rfi_to_reg int
	,count_rfi_to_reg int
      
	,media_cons NVARCHAR(7)
	,media_fname NVARCHAR(255)
	,media_lname NVARCHAR(255)
	,media_name NVARCHAR(255)
	,media_date date
	,media_subject  NVARCHAR(255)
	,interaction_type NVARCHAR(50)
	,origin_source NVARCHAR(255)
	,origin_subsource NVARCHAR(255)
	,pref_lang NVARCHAR(50)
	,gender NVARCHAR(50)
	,date_of_birth date
	,rfi_source1 NVARCHAR(255)
	,rfi_source2 NVARCHAR(255)
	)


INSERT INTO [CFScott].[dbo].[interaction_final]
(	 rfi_name
	,rfi_date1
	,rfi_lname
	,rfi_fname
	,rfi_evnt
	,reg_name
	,reg_evnt
	,reg_cons
	,reg_lname
	,reg_fname
	,reg_date
	,reg_part_type
	,rfi_date2
	,avg_days_rfi_to_reg
	,count_rfi_to_reg
	,media_cons
	,media_fname
	,media_lname
	,media_name
	,media_date
	,media_subject
	,interaction_type
	,origin_source
	,origin_subsource
	,pref_lang
	,gender
	,date_of_birth
	,rfi_source1
	,rfi_source2
	)
SELECT DISTINCT
		b.[name] rfi_name
      ,b.[rfi] rfi_date1
      ,b.[lname] rfi_lname
      ,b.[fname] rfi_fname
      ,b.[evnt] rfi_evnt
      
      ,c.[name] reg_name
      ,c.[evnt] reg_evnt
      ,c.[cons_id] reg_cons
      ,c.[lname] reg_lname
      ,c.[fname] reg_fname
      ,c.[reg] reg_date
      ,c.[type] reg_part_type
      ,c.[rfi] rfi_date2
      ,c.[avg_days] avg_days_rfi_to_reg
      ,c.[cnt] count_rfi_to_reg
      
      ,a.[cons_id] media_cons
      ,a.[fname] media_fname
      ,a.[lname] media_lname
      ,a.[name] media_name
      ,a.[creation] media_date
      ,a.[subject] media_subject
      ,a.[interaction] interaction_type
      ,a.[origin1] origin_source
      ,a.[origin2] origin_subsource
      ,a.[lang] pref_lang
      ,a.[gender] gender
      ,a.[dob] date_of_birth
      ,a.[rfi1] rfi_source1
      ,a.[rfi2] rfi_source2
	FROM 
	[CFScott].[dbo].[interaction_report] a 
	INNER JOIN 	[CFScott].[dbo].[interaction_rfi] b on b.[name] = a.[name]
	INNER JOIN [CFScott].[dbo].[interaction_reg] c on c.[name] = a.[name]

GO

SELECT * FROM [CFScott].[dbo].[interaction_final]

GO