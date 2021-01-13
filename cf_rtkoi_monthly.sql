
USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[rtkoi_monthly]    Script Date: 12/21/2020 5:15:47 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

ALTER procedure [dbo].[rtkoi_monthly]

AS

truncate table rtkoi_

 

DECLARE @date date = getdate()

declare @loadfile varchar(300) = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\RTKOI_'

+ CONVERT(varchar, @date, 112) + '.csv'

 

exec gBulk_loader @table = 'rtkoi_',

@file = @loadfile,

@format = '\\CF-FINANCE\DBAdmin\ad_hoc\rtkoi_.fmt'

 

/*

set @loadfile = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\AU_TEMP\cfwau.RTKOI_'

+ CONVERT(varchar, @date, 112) + '.csv'

 

exec gBulk_loader @table = 'rtkoi_',

@file = @loadfile,

@format = '\\CF-FINANCE\DBAdmin\ad_hoc\rtkoi__.fmt'

*/

 

set @loadfile = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\OW_TEMP\RTKOI_'

+ CONVERT(varchar, @date, 112) + '.csv'

 

exec gBulk_loader @table = 'rtkoi_',

@file = @loadfile,

@format = '\\CF-FINANCE\DBAdmin\ad_hoc\rtkoi_.fmt'

 

/*

set @loadfile = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\SB_TEMP\RTKOI_'

+ CONVERT(varchar, getdate(), 112) + '.csv'

 

exec gBulk_loader @table = 'rtkoi_',

@file = @loadfile,

@format = '\\CF-FINANCE\DBAdmin\ad_hoc\rtkoi_.fmt'

*/