
USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[evntInfo]    Script Date: 12/21/2020 5:17:08 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

ALTER PROCEDURE [dbo].[evntInfo] --Event Information portion of snapshot

@eventID varchar(75), --= '2013 Sydney WEBC',

@date date --= '1/17/2013'

AS

DECLARE @logo varchar(500) = (select logo from fc_logo where evnt = substring(@eventID, 6, LEN(@eventID)))

 

select trid, Evnt, edate, RegFee, Minimum,

DATEDIFF(D,@date, Edate) as 'Days Out',

DATEDIFF(WK,@date, Edate) as 'Wks Out',

@logo logo, benefic

from CFNEW.dbo.Event_Table

where  @eventID = Evnt

--and convert(date, getdate()) < '1/1/' + convert(varchar, year(edate) + 1)