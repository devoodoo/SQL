
USE [CFNew]

GO

/****** Object:  StoredProcedure [dbo].[newSnapshot1]    Script Date: 12/21/2020 9:52:42 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

 

ALTER PROCEDURE [dbo].[newSnapshot1]

@eventID varchar(100),

@date date

AS

--DECLARE @eventID varchar(75) = '2013 Calgary UA', @date date = '3/6/2013'

DECLARE @event2 varchar(100), @last_yr date, @weeksout int, @daysout int

set @weeksout = 52

set @daysout = 365

set @event2 = 'is empty'

 

If @eventID = '2020 Alberta RTCC'

                BEGIN

                                set @weeksout = 49

                END

 

If @eventID = '2020 Montreal RTCC'

                BEGIN

                                set @weeksout = 53

                END

 

If @eventID = '2020 Toronto RTCC'

                BEGIN

                                set @weeksout = 53

                END

 

If @eventID = '2020 Vancouver RTCC'

                BEGIN

                                set @weeksout = 53

                END

                /*

If @eventID = '2020 Toronto The Weekend'

                BEGIN

                                set @weeksout = 53

                END

                */

 

 

  --find last year's event for this event

set @last_yr = (select max(distinct rundate)

                                                                                from fc_rtkoi

                                                                                where  rundate = DATEADD(WEEK, -@weeksout, @date))

set @event2 = dbo.priorEvnt(@eventID)

 

--(select replace(@eventID, left(@eventID, 4), convert(varchar, year(left(@eventID, 4)) - 1)))

--dbo.priorEvnt(@eventID) 

--set @event2 = dbo.priorEvntfake(@eventID)

 

--this is the Monthly budget number

select *

into #temp2

from fc_sponsorship

where evnt = @eventID

and (rec_date <= @date   --= convert(date, convert(varchar,month(@date)) + '/1/' + convert(varchar,YEAR(@date)))

or rec_date is null)

and budget_type not like '%CS2'

 

 

--if the day is the first day of the month, post with the prior month data for month end

if DAY(@date) = 1

BEGIN

  delete from #temp2

  where year(rec_date) = YEAR(@date) and MONTH(rec_date) = MONTH(@date)

  set @last_yr = DATEADD(YEAR, -1, @date)

END

 

 

--FORCE IT: put in 0 data for absent ones

if (select COUNT(*) from #temp2) <= 14

  insert into #temp2

    select REPLACE(budget_type, 'SUM ', ''), 0, evnt, convert(date, convert(varchar,month(@date)) + '/1/'

   + convert(varchar,YEAR(@date))), trid

    from #temp2

    where REPLACE(budget_type, 'SUM ', '') not in (select distinct budget_type from #temp2)

 

/*

15km City Nights

15km City Nights plus Family Rally

15km Day Trip

15km Day Trip plus Family Rally

25km Day Trip

25km Day Trip plus Family Rally

40km Night and Day

40km Night and Day plus Family Rally

3km Solo Family Rally

3km Family Rally

Virtual Walker

Crew

*/

 

 

--select * from #temp4 select * from #temp2

select w.* into #temp4

from

(select distinct @date run_date,

case WHEN  b.budget_type like '%W1' and a.trid = 1141 THEN 'Walker'

                   WHEN  b.budget_type like '%W2' THEN '40 KM Marathon'

                   WHEN  b.budget_type like '%W40' THEN '40 KM Marathon'

                   WHEN  b.budget_type like '%TM' THEN 'Teams'

                   WHEN  b.budget_type like '%NW' THEN '15Km City Nights'

                   WHEN  b.budget_type like '%NWFR' THEN '15km City Nights plus Family Rally'

                   WHEN  b.budget_type like '%W15' THEN '15Km Day Trip'

                   WHEN  b.budget_type like '%W15FR' THEN '15km Day Trip plus Family Rally'

                   WHEN  b.budget_type like '%W25' THEN '25Km Day Trip'

                   WHEN  b.budget_type like '%W25FR' THEN '25km Day Trip plus Family Rally'

                   WHEN  b.budget_type like '%2W' THEN '40Km Night and Day'

                   WHEN  b.budget_type like '%2WFR' THEN '40km Night and Day plus Family Rally'

                   WHEN  b.budget_type like '%F1' THEN '3km Family Rally'

                   WHEN  b.budget_type like '%F2' THEN '3km Solo Family Rally'

                   WHEN  b.budget_type like '%C' THEN 'Crew'

                   WHEN  b.budget_type like '%RF' THEN 'Total Registration Fees'

                   WHEN  b.budget_type like '%D' THEN 'Total Donations'

                   WHEN  b.budget_type like '%TI' THEN 'Total Income'

                   WHEN  b.budget_type like '%R' THEN 'Rider'

                   WHEN  b.budget_type like '%R11' THEN 'Rider II'

                   WHEN  b.budget_type like '%H' THEN 'The Hammer'

                   WHEN  b.budget_type like '%R1' THEN 'One Day Rider'

                   WHEN  b.budget_type like '%R111' THEN 'One Day Rider II'

                   WHEN  b.budget_type like '%RK2' THEN 'K200 Rider'

                   WHEN  b.budget_type like '%RM2' THEN 'M200 Rider'

                   WHEN  b.budget_type like '%RV' THEN 'Virtual Rider'

                   WHEN  b.budget_type like '%WV' THEN 'Virtual Walker'

                   WHEN  b.budget_type like '%P' THEN 'Participants Registered'

                   WHEN  b.budget_type like '%CS' THEN 'Total Cash Sponsorship'

                   WHEN  b.budget_type like 'CS SUM' THEN 'Total Cash Sponsorship'

                   WHEN  b.budget_type like '%CH' THEN 'Concrete Hero'

                   WHEN  b.budget_type = 'SPR' THEN NULL  --this is purely for formatting and added to the data

                   WHEN  b.budget_type = 'SPR2' THEN '  '  --this is purely for formatting and added to the data

                   ELSE  null end budget_name,

a.budget_type, a.trid, sum(a.amount) amt1, b.amount amt2,

case WHEN  COALESCE(a.budget_type, b.budget_type) like 'W1' THEN 4

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'W2' THEN 6

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'W40' THEN 10

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'TM' THEN 10

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'NW' THEN 4

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'NWFR' THEN 5

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'W15' THEN 6

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'W15FR' THEN 7

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'W25' THEN 8

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'W25FR' THEN 9

                   WHEN  COALESCE(a.budget_type, b.budget_type) like '2W' THEN 12

                   WHEN  COALESCE(a.budget_type, b.budget_type) like '2WFR' THEN 13

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'F1' THEN 16

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'F2' THEN 17

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'C' THEN 14

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'RF' THEN 22 

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'RK2' THEN 4

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'RM2' THEN 6

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'RV' THEN 12

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'WV' THEN 18

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'D' THEN 24

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'TI' THEN 26

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'R1' THEN 4

                  WHEN  COALESCE(a.budget_type, b.budget_type) like 'R' THEN 8

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'R11' THEN 10

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'R111' THEN 6

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'H' THEN 12

                   WHEN  COALESCE(a.budget_type, b.budget_type) like 'P' THEN 4

                   WHEN  COALESCE(a.budget_type, b.budget_type) = 'SPR' THEN 0

                   WHEN  COALESCE(a.budget_type, b.budget_type) = 'CS' THEN 28

                   WHEN  COALESCE(a.budget_type, b.budget_type) = 'CH' THEN 4

                   ELSE  NULL end ordering

from (select * from #temp2 where budget_type not like 'SUM%')a

        FULL OUTER JOIN

     (select * from #temp2 where budget_type like 'SUM%') b

ON 'SUM ' + a.budget_type = b.budget_type

group by b.budget_type, a.budget_type, a.trid, b.amount

UNION

select @date, 'Total Cash Sponsorship', 'CS', (select top (1) trid from #temp2),

(select SUM(amount) from #temp2 where budget_type = 'CS' and rec_date <= @date),

(select amount from #temp2 where budget_type = 'SUM CS'), 30

) w

 

 

--create temp table using first pull of data

select x.*

into #temp

from

(select distinct rundate, fr_id fr_id1, evnt evnt1,  

  case WHEN  part_type like 'REG%' THEN 'Total Registration Fees'

                   WHEN part_type like 'DON%'  THEN 'Total Donations'

                   ELSE part_type

  end pt1, num tot1,

  case WHEN part_type = 'RFI' THEN 1

                   WHEN part_type like 'DON%'  THEN 24

                   WHEN part_type = 'TEAMS' THEN 18

                   WHEN part_type like '%Virtual%' THEN 18

                   WHEN part_type = 'CREW' THEN 20

                   WHEN part_type like 'REG%' THEN 22

                   WHEN part_type like '10%' THEN 6

                   WHEN part_type like '5%' THEN 4

                   WHEN part_type like '1-Day Rider' THEN 4

                   WHEN part_type like '1-Day Walker' THEN 4

                   WHEN part_type like '2-Day Rider' THEN 8

                   WHEN part_type like 'Walker' THEN 6

                   WHEN part_type like 'Rider' THEN 8

                   WHEN part_type like 'Rider II' THEN 10

                   WHEN part_type like 'The Hammer' THEN 12

                   WHEN part_type like 'K2%' THEN 6

                   WHEN part_type like 'M2%' THEN 8

                   WHEN part_type like 'One Day Rider' THEN 4

                   WHEN part_type like 'One Day Rider II' THEN 6

                   WHEN part_type like '1-%' THEN 4

                   WHEN part_type like '2-%' THEN 6

                   WHEN part_type like '%Night Walk%' THEN 4

                   WHEN part_type like '%Circuit%' THEN 6

                   WHEN part_type like '%Classic%' THEN 8

                   WHEN part_type like '%Marathon%' THEN 10

                   WHEN part_type like '%Two Day%' THEN 12

                   WHEN part_type = '15Km City Nights' THEN 4

                   WHEN part_type = '15Km Day Trip' THEN 6

                   WHEN part_type = '25Km Day Trip' THEN 8

                   WHEN part_type = '40Km Night and Day' THEN 12

                   WHEN part_type = '15km City Nights plus Family Rally' THEN 5

                   WHEN part_type = '15km Day Trip plus Family Rally' THEN 7

                   WHEN part_type = '25km Day Trip plus Family Rally' THEN 9

                   WHEN part_type = '40km Night and Day plus Family Rally' THEN 13

                   WHEN part_type like 'Concrete%' THEN 4

                   WHEN part_type like 'Participants Registered' THEN 4

                   WHEN part_type like '3km Family Rally' THEN 16

                   WHEN part_type like '3km Solo Family Rally' THEN 17

                   ELSE 30

  end ordering

  from fc_rtkoi

  where (evnt = @eventID and rundate = @date)

  or (evnt = @event2 and rundate = @last_yr))x

 

  /*

  where (evnt = @eventID and rundate = @date)

  or (evnt = @event2 and rundate = @last_yr))x

  */

  --or (evnt = @event2 and rundate = @last_yr))x

 

 

---back fill any missing types

insert into #temp

  select distinct @date, fr_id, evnt, part_type, 0,

  case WHEN part_type = 'RFI' THEN 1

                   WHEN part_type like 'DON%'  THEN 24

                   WHEN part_type = 'TEAMS' THEN 18

                   WHEN part_type like '%Virtual%' THEN 18

                   WHEN part_type = 'CREW' THEN 20

                   WHEN part_type like 'REG%' THEN 22

                   WHEN part_type like '10%' THEN 6

                   WHEN part_type like '5%' THEN 4

                   WHEN part_type like '1-Day Rider' THEN 4

                   WHEN part_type like '1-Day Walker' THEN 4

                   WHEN part_type like '2-Day Rider' THEN 8

                   WHEN part_type like 'Walker' THEN 6

                   WHEN part_type like 'Rider' THEN 8

                   WHEN part_type like 'Rider II' THEN 10

                   WHEN part_type like 'The Hammer' THEN 12

                   WHEN part_type like 'K2%' THEN 6

                   WHEN part_type like 'M2%' THEN 8

                   WHEN part_type like 'One Day Rider' THEN 4

                   WHEN part_type like 'One Day Rider II' THEN 6

                   WHEN part_type like '1-%' THEN 4

                   WHEN part_type like '2-%' THEN 6

                   WHEN part_type like '%Night Walk%' THEN 4

                  WHEN part_type like '%Circuit%' THEN 6

                   WHEN part_type like '%Classic%' THEN 8

                   WHEN part_type like '%Marathon%' THEN 10

                   WHEN part_type like '%Two Day%' THEN 12

                   WHEN part_type = '15Km City Nights' THEN 4

                   WHEN part_type = '15Km Day Trip' THEN 6

                   WHEN part_type = '25Km Day Trip' THEN 8

                   WHEN part_type = '40Km Night and Day' THEN 12

                   WHEN part_type = '15km City Nights plus Family Rally' THEN 5

                   WHEN part_type = '15km Day Trip plus Family Rally' THEN 7

                   WHEN part_type = '25km Day Trip plus Family Rally' THEN 9

                   WHEN part_type = '40km Night and Day plus Family Rally' THEN 13

                   WHEN part_type like 'Concrete%' THEN 4

                   WHEN part_type like 'Participants Registered' THEN 4

                   WHEN part_type like '3km Family Rally' THEN 16

                  WHEN part_type like '3km Solo Family Rally' THEN 17

                   ELSE 30

  end ordering  

  from fc_rtkoi where evnt = @eventID

  and part_type not like 'REG%' and part_type not like 'DON%'

  and part_type not in (select distinct pt1

                                         from #temp)

 

 

If @eventID = '2020 Alberta RTCC'

                BEGIN

                                set @daysout = 343

                END

 

If @eventID = '2020 Montreal RTCC'

                BEGIN

                                set @daysout = 372

                END

 

If @eventID = '2020 Toronto RTCC'

                BEGIN

                                set @daysout = 372

                END

 

If @eventID = '2020 Vancouver RTCC'

                BEGIN

                                set @daysout = 372

                END

                /*

If @eventID = '2020 Toronto The Weekend'

                BEGIN

                                set @daysout = 372

                END

                */

 

 

--calculate and insert cash sponsorship

  insert into #temp

   select max(rec_date), trid, evnt, 'Total Cash Sponsorship', ISNULL(sum(amount), 0), 30

   from fc_sponsorship

   where (evnt = @eventID and budget_type = 'CS2' and rec_date <= @date)

   or (evnt = @event2 and budget_type = 'CS2' and rec_date < dateadd(DAY, -@daysout,@date))

  group by trid, evnt

 

   /*

   where (evnt = @eventID and budget_type = 'CS2' and rec_date <= @date)

   or (evnt = @event2 and budget_type = 'CS2' and rec_date < dateadd(DAY, -365,@date))

   */

 

--select * from #temp

 

--calculate and insert Total income

  insert into #temp

  select @date, fr_id1, evnt1, 'Total Income', SUM(tot1), 32

  from #temp

  where pt1 in ('Total Donations', 'Total Registration Fees', 'Total Cash Sponsorship')

  group by fr_id1, evnt1


--pull report dataset

--IF @eventID like '%Toronto RTCC'   --Exception for Toronto ride to accomodate for two rider types to one

--BEGIN

--    insert into #temp

--      select rundate, fr_id1, evnt1, 'Rider', SUM(tot1), 2

--      from #temp

--        where pt1 like '%200%Rider'

--        group by rundate, fr_id1, evnt1

       

--    delete from #temp where pt1 like '%200%Rider'

--END

 


--pull report dataset

--IF @eventID like '%Toronto RTCC'   --Exception for Toronto ride to accomodate for two rider types to one

--BEGIN

--    insert into #temp

--      select rundate, fr_id1, evnt1, 'Rider', SUM(tot1), 2

--      from #temp

--        where pt1 = 'Rider' or pt1 = 'Rider II'

--        group by rundate, fr_id1, evnt1

       

--    delete from #temp where pt1 = 'Rider II'

--END

 

--IF @eventID like '%Toronto RTCC'   --Exception for Toronto ride to accomodate for two rider types to one

--BEGIN

--    insert into #temp

--      select rundate, fr_id1, evnt1, 'One Day Rider', SUM(tot1), 2

--      from #temp

--        where pt1 = 'One Day Rider' or pt1 = 'One Day Rider II'

--        group by rundate, fr_id1, evnt1

       

--    delete from #temp where pt1 = 'One Day Rider II'

--END

 

/*

--pull report dataset

IF @eventID like '%OneDay%'   --Exception for AU OneDay to accomodate for two part types to one

BEGIN

    insert into #temp

      select rundate, fr_id1, evnt1, 'Participants Registered', SUM(tot1), 2

      from #temp

        where pt1 like '%Rider%' or pt1 like '%Walker%'

        group by rundate, fr_id1, evnt1

       

    delete from #temp where (@eventID like '%OneDay%' and pt1 like '%Rider%') and (@eventID like '%OneDay%' and pt1 like '%Walker%')

END

*/

 

 

IF @event2 = '2018 Toronto Onewalk WEBC'  --Modification for OWs to take two participant type down to one

BEGIN

    insert into #temp

      select rundate, fr_id1, evnt1, '25Km Onewalk Day Trip', SUM(tot1), 2

      from #temp

        where @event2 = '2018 Toronto Onewalk WEBC' and (pt1 = '15 KM Circuit' or pt1 = '25 Km Onewalk Day Trip' or pt1 = '40 KM Marathon')

        group by rundate, fr_id1, evnt1

       

    delete from #temp where pt1 = '15 KM Circuit' or pt1 = '25 Km Onewalk Day Trip' or pt1 = '40 KM Marathon'

END

 

/*Start code for Onewalk to Weekend transistion*/

/*

IF @event2 = '2019 Toronto OneWalk WEBC'  --Modification for OWs to normalize part types

BEGIN

UPDATE #temp

SET part_type = '15km City Nights' where part_type = '15 Km Onewalk City Nights'

END

 

IF @event2 = '2019 Toronto OneWalk WEBC'  --Modification for OWs to normalize part types

BEGIN

UPDATE #temp

SET part_type = '15km Day Trip' where part_type = '15 Km Onewalk Day Trip'

END

 

IF @event2 = '2019 Toronto OneWalk WEBC'  --Modification for OWs to normalize part types

BEGIN

UPDATE #temp

SET part_type = '25km Day Trip' where part_type = '25 Km Onewalk Day Trip'

END

 

IF @event2 = '2019 Toronto OneWalk WEBC'  --Modification for OWs to normalize part types

BEGIN

UPDATE #temp

SET part_type = '40km Night and Day' where part_type = '40 Km Onewalk Night + Day'

END

 

IF @event2 = '2019 Toronto OneWalk WEBC'  --Modification for OWs to normalize part types

BEGIN

UPDATE #temp

SET evnt = '2019 Toronto The Weekend' where evnt = '2019 Toronto OneWalk WEBC'

END

*/

 

/* 2020 weekend

15km City Nights

15km City Nights plus Family Rally

15km Day Trip

15km Day Trip plus Family Rally

25km Day Trip

25km Day Trip plus Family Rally

40km Night and Day

40km Night and Day plus Family Rally

3km Solo Family Rally

3km Family Rally

Virtual Walker

Crew

 

 

2019 onewalk

15 Km Onewalk City Nights

15 Km Onewalk Day Trip

25 Km Onewalk Day Trip

40 Km Onewalk Night + Day

Virtual Walker

Crew

*/

/*End code for Onewalk to Weekend transistion*/

 

UPDATE #temp

SET pt1 = '25 Km Onewalk Day Trip'

where pt1 = '25Km Onewalk Day Trip'

 

 

  select x.* into #temp3

  from

  (select ISNULL(a.rundate, @date) rundate, a.fr_id1 fr_id, isnull(a.evnt1, @eventID) evnt1,  

       COALESCE(a.pt1, b.pt1) pt1,

       ISNULL(a.tot1,0) tot1,

       b.fr_id1 fr_id2, isnull(b.evnt1, (select top 1 evnt1 from #temp where evnt1 = @event2)) evnt2,

       b.pt1 pt2, ISNULL(b.tot1, 0) tot2,

       COALESCE(a.ordering, b.ordering) ordering

  from (select * from #temp where evnt1 = @eventID) a

  FULL OUTER JOIN (select * from #temp where evnt1 = @event2) b

  ON  a.pt1 = b.pt1

 ) x

 

---FORCE IT                   

delete from #temp4

where budget_type is null and ordering is null

 

--update #temp4

--set amt1 = (select SUM(amt1)

--                                 from #temp4

--                                             where budget_name in ('Total Donations', 'Total Cash Sponsorship', 'Total Registration Fees'))

--where budget_name = 'Total Income'

 

--select * from #temp4

--select * from #temp3

--select * from #temp

--select * from #temp2

 

if @eventID <> '2011 Toronto RTCC'

                select isnull(a.pt2, b.budget_name) budget_name,a.tot1, a.pt2, a.tot2, b.budget_name budget_name2,

                b.amt1, b.amt2, COALESCE(a.ordering, b.ordering) ordering

                from #temp3 a

                --FULL OUTER

                 RIGHT JOIN #temp4 b

                ON a.pt1 = b.budget_name

                UNION

                select a.pt1,a.tot1, a.pt2, a.tot2, NULL,

                NULL, NULL, 1

                from #temp3 a

                where a.pt1 = 'RFI'

ELSE

BEGIN

                select  COALESCE(a.pt1, b.budget_name) budget_name,a.tot1, a.pt2, a.tot2, b.budget_name budget_name2,

                b.amt1, b.amt2, COALESCE(a.ordering, b.ordering) ordering

                from #temp3 a

                FULL OUTER JOIN #temp4 b

                ON a.pt1 = b.budget_name

                UNION

                select a.pt2,a.tot1, a.pt2, a.tot2, NULL,

                NULL, NULL, 1

                from #temp3 a

                where a.pt2 = 'RFI'

    delete from #temp3 where pt1 like '%200%Rider' or pt1 like 'Virtual%'

END

 

--clean up temp tables

drop table #temp2

drop table #temp 

drop table #temp3

drop table #temp4

 

--select * from #temp4

 

 

--select SUM(amt1)

--from #temp4

--where budget_name in ('Total Donations', 'Total Cash Sponsorship', 'Total Registration Fees')
