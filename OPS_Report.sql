
/*
DROP TABLE [CFScott].[dbo].[ops_report_te]
CREATE TABLE [CFScott].[dbo].[ops_report_te] (
Run_Da NVARCHAR(50),
Run_Date NVARCHAR(50),
Event_Code NVARCHAR(50),
Event_Name NVARCHAR(50),
RFI smallint,
Walker smallint,
Rider smallint,
Participant smallint,
Crew smallint,
Reg_Amt Float,
Donations_Amt Float
)


(SELECT CONVERT(varchar, CAST([rundate] AS CHAR(10)), 110) as Run_Date,

DATEADD (YEAR,@val/10000-1900,DATEADD(MONTH,(@val%10000)/100-1,DATEADD(DAY,@val%100-1,0 )))
CONVERT(date, CAST('20010101' AS CHAR(12)), 112)
(SELECT CONVERT(VARCHAR,CAST(DATEPART(DAY,[rundate]) + '-' + DATEPART(MONTH,[rundate]) + '-' + DATEPART(YEAR,GETDATE()) as CHAR(10)),110) as Run_Date,
(SELECT CONVERT(VARCHAR, substring(CAST([rundate] AS CHAR(10)),1,10), 112) as Run_Date,
DATEPART(YEAR,GETDATE()) + DATEPART(MONTH,[rundate]) + DATEPART(DAY,[rundate])

SELECT convert(varchar(5), [rundate], 110)
(SELECT SUBSTRING((CAST(CAST([rundate] as CHAR(10)) as CHAR(10))),6,5) as Run_Date,
*/


TRUNCATE TABLE [CFScott].[dbo].[ops_report]

INSERT INTO [CFScott].[dbo].[ops_report] (Run_Da,Run_Date,Event_Code,Event_Name,RFI,Walker,Rider,Participant,Crew,Reg_Amt,Donations_Amt)
(SELECT 
[rundate] as Run_Da,
convert(varchar(5), [rundate], 110) as Run_Date,
[instance] as Event_Code,[evnt] as Event_Name,
SUM(CASE WHEN [part_type] = 'RFI' THEN num END) as RFI,
SUM(CASE WHEN [part_type] IN ('Walker','1-Day Walker','2-Day Walker','5K Walker','10K Runner','5K Walker/10K Runner','Booty Hunter','Concrete Hero') THEN num END) as Walker,
SUM(CASE WHEN [part_type] IN ('Rider','1-Day Rider','2-Day Rider','M200 Rider','K200 Rider','Rider - 14-16 yrs. old','Rider - Over 16 yrs. old','K200 Rider: Toronto-Hamilton-Niagara') THEN num END) as Rider,
SUM(CASE WHEN [part_type] IN ('Walker','1-Day Walker','2-Day Walker','5K Walker','10K Runner','5K Walker/10K Runner','Booty Hunter','Concrete Hero','Rider','1-Day Rider','2-Day Rider','M200 Rider','K200 Rider','Rider - 14-16 yrs. old','Rider - Over 16 yrs. old','K200 Rider: Toronto-Hamilton-Niagara') THEN num END) as Participant,
SUM(CASE WHEN [part_type] = 'Crew' THEN num END) as Crew,
SUM(CASE WHEN [part_type] = 'REG_DOLLARS_AMOUNT' THEN num END) as Reg_Amt,
SUM(CASE WHEN [part_type] = 'DONATIONS_AMOUNT' THEN num END) as Donations_Amt
FROM (SELECT [rundate],[part_type],[instance],[evnt],[num] FROM [CFNew].[dbo].[fc_rtkoi]
WHERE [evnt] not like '%TEST%' and [evnt] not like '%2014%') P
WHERE [part_type] IN ('RFI','Crew','REG_DOLLARS_AMOUNT','DONATIONS_AMOUNT','Walker','1-Day Walker','2-Day Walker','5K Walker','10K Runner','5K Walker/10K Runner','Booty Hunter','Concrete Hero','Rider','1-Day Rider','2-Day Rider','M200 Rider','K200 Rider','Rider - 14-16 yrs. old','Rider - Over 16 yrs. old','K200 Rider: Toronto-Hamilton-Niagara')
GROUP BY [rundate],[instance],[evnt])
ORDER BY [evnt]



/*
select distinct part_type from [CFNew].[dbo].[fc_rtkoi]

USE msdb;
GO
EXEC sp_add_schedule
    @schedule_name = N'ops_data_schedule',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 010000 ;
GO
EXEC sp_attach_schedule
   @job_name = N'ops_data_table',
   @schedule_name = N'ops_data_schedule';
GO
*/