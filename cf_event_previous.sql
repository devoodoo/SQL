
USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[evntPrevious]    Script Date: 12/21/2020 9:51:55 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

 

ALTER PROCEDURE [dbo].[evntPrevious]

--DECLARE

@eventID varchar(75), -- = '2013 Toronto RTCC',

@date date --= '3/31/2013'

AS

DECLARE @yr_prev date = DATEADD(WEEK, -52, @date)

 

set @yr_prev = DATEADD(DAY, -1, @yr_prev)

 

if DAY(@date) = 1

  set @yr_prev = DATEADD(DAY, -1, DATEADD(YEAR, -1, @date))

 

 

DECLARE @evnt_prev varchar(75) = dbo.priorEvnt(@eventID) --(select replace(@eventID, left(@eventID, 4), convert(varchar, year(left(@eventID, 4)) - 1))) 

 

print @yr_prev

print @evnt_prev

print @date

 

TRUNCATE TABLE [dbo].[fc_previouspartcombine]

 

INSERT INTO [dbo].[fc_previouspartcombine]

select rundate,tr_id,evnt,edate,SUM(part_cnt) part_cnt,'25Km Onewalk Day Trip' part_type,

         SUM(bracket0) bracket0,SUM(bracket1) bracket1,SUM(bracket2) bracket2,

         SUM(bracket3) bracket3,SUM(bracket4) bracket4,SUM(bracket5) bracket5,

         SUM(bracket6) bracket6,SUM(bracket7) bracket7,SUM(bracket8) bracket8

      from fc_previous

        where evnt = '2018 Toronto Onewalk WEBC' and

              (part_type = '15 KM Circuit' or part_type = '25 Km Onewalk Day Trip' or part_type = '40 KM Marathon')

        group by rundate,tr_id,evnt,edate

UNION

select rundate,tr_id,evnt,edate,part_cnt,part_type,bracket0,bracket1,bracket2,bracket3,bracket4,bracket5,bracket6,bracket7,bracket8

      from fc_previous

        where evnt = '2018 Toronto Onewalk WEBC' and

              part_type <> '15 KM Circuit' and part_type <> '25 Km Onewalk Day Trip' and part_type <> '40 KM Marathon'

 

UPDATE fc_previouspartcombine

SET part_type = '25 Km Onewalk Day Trip'

where part_type = '25Km Onewalk Day Trip'

 

 

delete from fc_previous where part_type = 'Virtual Rider'

 

select distinct rundate, tr_id, evnt, part_type + ' ' + left(evnt,4)  'part_type', part_cnt, bracket0, bracket1, bracket2, bracket3,

bracket4, bracket5, bracket6, bracket7, bracket8

from fc_previous where evnt = @eventID

and rundate = dateadd(DAY, -1,@date)

and edate <= CONVERT(date, '1/1/' + convert(varchar, year(edate) + 1))

and part_type <> 'Crew'

UNION

select distinct rundate, tr_id, evnt, part_type+ ' ' +left(evnt,4) 'part_type', part_cnt, bracket0, bracket1, bracket2, bracket3,

bracket4, bracket5, bracket6, bracket7, bracket8

FROM fc_previous

where evnt = @evnt_prev and rundate = @yr_prev

and evnt <> '2018 Toronto Onewalk WEBC'

and part_type <> 'Crew' --and tr_id > 0

UNION

select distinct rundate, tr_id, evnt, part_type + '% '+ left(evnt,4) 'part_type',

cast((part_cnt * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'part_cnt',

cast((bracket0 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket0',

cast((bracket1 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket1',

cast((bracket2 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket2',

cast((bracket3 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket3',

cast((bracket4 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket4',

cast((bracket5 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket5',

cast((bracket6 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket6',

cast((bracket7 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket7',

cast((bracket8 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4,1)) 'bracket8'

from fc_previous

where evnt = @eventID and rundate = dateadd(DAY, -1,@date)

and edate <= CONVERT(date, '1/1/' + convert(varchar, year(edate) + 1))

and part_type <> 'Crew'

UNION

select distinct rundate, tr_id, evnt, part_type + '% ' + left(evnt,4) 'part_type',

cast((part_cnt * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'part_cnt',

cast((bracket0 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket0',

cast((bracket1 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket1',

cast((bracket2 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket2',

cast((bracket3 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket3',

cast((bracket4 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket4',

cast((bracket5 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket5',

cast((bracket6 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket6',

cast((bracket7 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket7',

cast((bracket8 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4,1)) 'bracket8'

FROM fc_previous

where evnt = @evnt_prev and rundate = @yr_prev

and evnt <> '2018 Toronto Onewalk WEBC'

and part_type <> 'Crew' and tr_id > 0

UNION

select distinct rundate, tr_id, evnt, part_type+ ' ' +left(evnt,4) 'part_type', part_cnt, bracket0, bracket1, bracket2, bracket3,

bracket4, bracket5, bracket6, bracket7, bracket8

FROM fc_previouspartcombine

where evnt = @evnt_prev and rundate = @yr_prev and part_type <> 'Crew'

UNION

select distinct rundate, tr_id, evnt, part_type + '% ' + left(evnt,4) 'part_type',

cast((part_cnt * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'part_cnt',

cast((bracket0 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket0',

cast((bracket1 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket1',

cast((bracket2 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket2',

cast((bracket3 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket3',

cast((bracket4 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket4',

cast((bracket5 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket5',

cast((bracket6 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket6',

cast((bracket7 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4, 1)) 'bracket7',

cast((bracket8 * 1.0)/(part_cnt* 1.0) * 100 as numeric(4,1)) 'bracket8'

FROM fc_previouspartcombine

where evnt = @evnt_prev and rundate = @yr_prev and part_type <> 'Crew'