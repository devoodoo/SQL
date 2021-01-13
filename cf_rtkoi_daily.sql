
USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[rtkoi_daily]    Script Date: 12/21/2020 5:15:39 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

 

 

ALTER PROCEDURE [dbo].[rtkoi_daily]

--@flag tinyint = NULL --1 is for run it from the start, to be used in case of corruption

--@workdate date  --use 8/21/09 as the earliest date

AS

DECLARE @date date = getdate()

DECLARE @pathfile varchar(255) = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\RTKOI_2_'

--DECLARE @File_Exists int

 

 

set @pathfile = @pathfile + CONVERT(varchar, @date, 112) + '.csv'

--EXEC Master.dbo.xp_fileexist @pathfile, @File_Exists OUT

--IF @File_Exists = 1

  exec rtkoi_loader @pathfile

 

  /*

--change for AU issue

set @pathfile = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\AU_TEMP\cfwau.RTKOI_2_' +

CONVERT(varchar, @date, 112) + '.csv'

 

  exec rtkoi_loader @pathfile

*/

 

--change for OneWalk issue

set @pathfile = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\OW_TEMP\RTKOI_2_' +

CONVERT(varchar, @date, 112) + '.csv'

  exec rtkoi_loader @pathfile

 

/*

--change for Baycrest issue

set @pathfile = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\SB_TEMP\RTKOI_2_' +

CONVERT(varchar, getdate(), 112) + '.csv'

  exec rtkoi_loader @pathfile

  */