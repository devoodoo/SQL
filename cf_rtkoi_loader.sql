USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[rtkoi_loader]    Script Date: 12/21/2020 9:52:31 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

ALTER PROCEDURE [dbo].[rtkoi_loader]

@rtkoi_file varchar(250)

AS

set @rtkoi_file = char(39) + @rtkoi_file + char(39)

exec ('BULK INSERT CFNEW.dbo.fc_rtkoi

    FROM ' + @rtkoi_file + '

    WITH

    (

       FIRSTROW = 1,

       FIELDTERMINATOR = '','',

       ROWTERMINATOR = ''\n'',

       FORMATFILE = ''\\CF-FINANCE\DBAdmin\ad_hoc\rtkoi4.fmt'',     

       MAXERRORS = 0

    )')