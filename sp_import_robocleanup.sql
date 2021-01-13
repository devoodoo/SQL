-- ================================================
-- Proc for cleaning up robo call sheet
-- ================================================

USE [CFScott]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  BULK INSERT CFScott.dbo.roboclean1
    FROM '\\Cf-finance\dbadmin\Robocleanup\SMS_AD13_RFI.txt' 
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )
    
	BULK INSERT CFScott.dbo.roboclean1
    FROM '\\Cf-finance\dbadmin\Robocleanup\test2.txt'
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )
    
	BULK INSERT CFScott.dbo.roboclean2
    FROM '\\Cf-finance\dbadmin\Robocleanup\test1.csv'
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )
    
	BULK INSERT CFScott.dbo.roboclean3
    FROM '\\Cf-finance\dbadmin\Robocleanup\test.xls'
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )
    
-- =============================================
-- Columns should include DO_NOT_CALL, PHONE, MOBILE
-- =============================================
/*CREATE PROCEDURE [dbo].[proc_robocleanup]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS*/
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE [CFScott].[dbo].[roboclean1]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean2]
	TRUNCATE TABLE [CFScott].[dbo].[roboclean3]
/*
	CREATE TABLE [CFScott].[dbo].[roboclean1] (DNC VARCHAR(25), PHONE VARCHAR(25), MOBILE VARCHAR(25))
	CREATE TABLE [CFScott].[dbo].[roboclean2] (DNC VARCHAR(25), PHONE VARCHAR(25), MOBILE VARCHAR(25))
	CREATE TABLE [CFScott].[dbo].[roboclean3] (DNC VARCHAR(25), PHONE VARCHAR(25), MOBILE VARCHAR(25))
*/

DECLARE @RC int
DECLARE @server nvarchar(128)
DECLARE @srvproduct nvarchar(128)
DECLARE @provider nvarchar(128)
DECLARE @datasrc nvarchar(4000)
DECLARE @location nvarchar(4000)
DECLARE @provstr nvarchar(4000)
DECLARE @catalog nvarchar(128)
-- Set parameter values
SET @server = 'TEST_SP'
SET @srvproduct = 'Excel'
SET @provider = 'Microsoft.Jet.OLEDB.4.0'
SET @datasrc = '\\CF-FINANCE\DBAdmin\Robocleanup\test.xls'
SET @provstr = 'Excel 8.0'
EXEC @RC = [master].[dbo].[sp_addlinkedserver] @server, @srvproduct, @provider, 
@datasrc, @location, @provstr, @catalog


SELECT * INTO CFScott.dbo.roboclean1 FROM OPENDATASOURCE('Microsoft.Jet.OLEDB.4.0',
'Data Source=\\CF-FINANCE\DBAdmin\Robocleanup\test.xls;Extended Properties=Excel 8.0')...[roboclean3$]

SELECT * INTO CFScott.dbo.roboclean1 FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',
'Excel 8.0;Database=\\CF-FINANCE\DBAdmin\Robocleanup\test.xls', [roboclean3$])

SELECT * INTO CFScott.dbo.roboclean1 FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',
'Excel 8.0;Database=\\CF-FINANCE\DBAdmin\Robocleanup\test.xls', 'SELECT * FROM [roboclean3$]')

SELECT * INTO CFScott.dbo.roboclean1 FROM TEST_SP...[roboclean3$]

SELECT * INTO CFScott.dbo.roboclean1 FROM OPENQUERY(TEST_SP,'SELECT * FROM [roboclean3$]')

	BULK INSERT CFScott.dbo.roboclean1
    FROM '\\CF-FINANCE\DBAdmin\Robocleanup\test2.txt'
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )
    
	BULK INSERT CFScott.dbo.roboclean2
    FROM '\\CF-FINANCE\DBAdmin\Robocleanup\test1.csv'
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )
    
	BULK INSERT CFScott.dbo.roboclean3
    FROM '\\CF-FINANCE\DBAdmin\Robocleanup\test.xls'
    WITH 
    ( 
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t', 
        ROWTERMINATOR = '\n',
        MAXERRORS = 0
    )




DELETE from CFScott.dbo.roboclean3
WHERE DNC = 'TRUE'

DELETE from CFScott.dbo.roboclean3
WHERE PHONE = 'DNC' or PHONE = 'DONOTCALL'

DELETE from CFScott.dbo.roboclean3
WHERE MOBILE = 'DNC' or MOBILE = 'DONOTCALL'

END
GO
