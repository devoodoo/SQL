
USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[rtkoi_previous]    Script Date: 12/21/2020 5:15:50 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

 

ALTER PROCEDURE [dbo].[rtkoi_previous]

AS

--DECLARE @filedate varchar(8)= '1/29/2011'

DECLARE @filedate varchar(8) = CONVERT(varchar, getdate(), 112)

DECLARE @cfca varchar(150) = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\FC_PREVIOUS\cfca_cfwus.prev_day_fundraising.' + @filedate +'.csv'

DECLARE @cfrca varchar(150) = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\FC_PREVIOUS\cfrca_cfrau_cfrus.prev_day_fundraising.' + @filedate +'.csv'

DECLARE @cfuaca varchar(150) ='\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\FC_PREVIOUS\cfuaca.prev_day_fundraising.'+ @filedate +'.csv'

DECLARE @cfrau varchar(150) ='\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\AU_FC_PREVIOUS_TEMP\cfrau.prev_day_fundraising.'+ @filedate +'.csv'

DECLARE @cfwau varchar(150) ='\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\AU_FC_PREVIOUS_TEMP\cfwau.prev_day_fundraising.'+ @filedate +'.csv'

DECLARE @cfnz varchar(150) ='\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\AU_FC_PREVIOUS_TEMP\cfnz.prev_day_fundraising.'+ @filedate +'.csv'

DECLARE @cfchca varchar(150) ='\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\AU_FC_PREVIOUS_TEMP\cfchca.prev_day_fundraising.'+ @filedate +'.csv'

DECLARE @cfowca varchar(150) = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\OW_FC_PREVIOUS_TEMP\cfowca.prev_day_fundraising.' + @filedate +'.csv'

DECLARE @cfsbca varchar(150) = '\\CF-CORE\Marketing\ANDYCG\KOI\RTKOI\datadump\SB_FC_PREVIOUS_TEMP\cfsbpa.prev_day_fundraising.' + @filedate +'.csv'

 

 

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfca,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfca.fmt'

 

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfrca,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfrca.fmt'

/*

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfuaca,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfuaca.fmt'

 

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfwau,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfca.fmt'

 

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfrau,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfrca.fmt'

 

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfnz,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfrca.fmt'

 

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfchca,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfca.fmt'

*/

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfowca,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfca.fmt'

/*

EXEC [dbo].[gBulk_loader]

              @table = N'CFNEW.dbo.fc_previous',

              @file = @cfsbca,

              @format = '\\CF-FINANCE\DBAdmin\ad_hoc\cf_previous_cfca.fmt'

              */
