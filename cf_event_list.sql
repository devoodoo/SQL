

USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[evntList]    Script Date: 12/21/2020 5:16:50 PM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

 

ALTER PROCEDURE [dbo].[evntList]

AS

DECLARE @yr int = year(getdate())

select trid, Evnt, benefic

from Event_Table

where convert(int, left(Evnt, 4)) in (@yr, @yr - 1)

or Edate > GETDATE()

order by LEFT(evnt, 4) desc
