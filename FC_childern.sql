/****** Script for SelectTopNRows command from SSMS  ******/
/*
TRUNCATE TABLE [CFScott].[dbo].[fc_categories_test]

DROP TABLE [CFScott].[dbo].[fc_master_ride]
DROP TABLE [CFScott].[dbo].[fc_master_weekend]
DROP TABLE [CFScott].[dbo].[fc_master_underware]
DROP TABLE [CFScott].[dbo].[fc_master_hero]

CREATE TABLE [CFScott].[dbo].[fc_master_ride] (
[Run_Date] NVARCHAR(50)
,[AD RTCC 2013 Total] int
,[AD RTCC 2013 1] smallint
,[AD RTCC 2013 2] smallint
,[AD RTCC 2013 3] smallint
,[AD RTCC 2013 4] smallint
,[AD RTCC 2013 5] smallint
,[AD RTCC 2013 6] smallint
,[AD RTCC 2013 7] smallint
,[AD RTCC 2013 8] smallint
,[AD RTCC 2013 9] smallint
,[AB RTCC 2013 Total] int
,[AB RTCC 2013 1] smallint
,[AB RTCC 2013 2] smallint
,[AB RTCC 2013 3] smallint
,[AB RTCC 2013 4] smallint
,[AB RTCC 2013 5] smallint
,[AB RTCC 2013 6] smallint
,[AB RTCC 2013 7] smallint
,[AB RTCC 2013 8] smallint
,[AB RTCC 2013 9] smallint
,[AK RTCC 2013 Total] int
,[AK RTCC 2013 1] smallint
,[AK RTCC 2013 2] smallint
,[AK RTCC 2013 3] smallint
,[AK RTCC 2013 4] smallint
,[AK RTCC 2013 5] smallint
,[AK RTCC 2013 6] smallint
,[AK RTCC 2013 7] smallint
,[AK RTCC 2013 8] smallint
,[AK RTCC 2013 9] smallint
,[BR RTCC 2013 Total] int
,[BR RTCC 2013 1] smallint
,[BR RTCC 2013 2] smallint
,[BR RTCC 2013 3] smallint
,[BR RTCC 2013 4] smallint
,[BR RTCC 2013 5] smallint
,[BR RTCC 2013 6] smallint
,[BR RTCC 2013 7] smallint
,[BR RTCC 2013 8] smallint
,[BR RTCC 2013 9] smallint
,[ML RTCC 2013 Total] int
,[ML RTCC 2013 1] smallint
,[ML RTCC 2013 2] smallint
,[ML RTCC 2013 3] smallint
,[ML RTCC 2013 4] smallint
,[ML RTCC 2013 5] smallint
,[ML RTCC 2013 6] smallint
,[ML RTCC 2013 7] smallint
,[ML RTCC 2013 8] smallint
,[ML RTCC 2013 9] smallint
,[MO RTCC 2013 Total] int
,[MO RTCC 2013 1] smallint
,[MO RTCC 2013 2] smallint
,[MO RTCC 2013 3] smallint
,[MO RTCC 2013 4] smallint
,[MO RTCC 2013 5] smallint
,[MO RTCC 2013 6] smallint
,[MO RTCC 2013 7] smallint
,[MO RTCC 2013 8] smallint
,[MO RTCC 2013 9] smallint
,[PR RTCC 2013 Total] int
,[PR RTCC 2013 1] smallint
,[PR RTCC 2013 2] smallint
,[PR RTCC 2013 3] smallint
,[PR RTCC 2013 4] smallint
,[PR RTCC 2013 5] smallint
,[PR RTCC 2013 6] smallint
,[PR RTCC 2013 7] smallint
,[PR RTCC 2013 8] smallint
,[PR RTCC 2013 9] smallint
,[SY RTCC 2013 Total] int
,[SY RTCC 2013 1] smallint
,[SY RTCC 2013 2] smallint
,[SY RTCC 2013 3] smallint
,[SY RTCC 2013 4] smallint
,[SY RTCC 2013 5] smallint
,[SY RTCC 2013 6] smallint
,[SY RTCC 2013 7] smallint
,[SY RTCC 2013 8] smallint
,[SY RTCC 2013 9] smallint
,[TO RTCC 2013 Total] int
,[TO RTCC 2013 1] smallint
,[TO RTCC 2013 2] smallint
,[TO RTCC 2013 3] smallint
,[TO RTCC 2013 4] smallint
,[TO RTCC 2013 5] smallint
,[TO RTCC 2013 6] smallint
,[TO RTCC 2013 7] smallint
,[TO RTCC 2013 8] smallint
,[TO RTCC 2013 9] smallint
,[VA RTCC 2013 Total] int
,[VA RTCC 2013 1] smallint
,[VA RTCC 2013 2] smallint
,[VA RTCC 2013 3] smallint
,[VA RTCC 2013 4] smallint
,[VA RTCC 2013 5] smallint
,[VA RTCC 2013 6] smallint
,[VA RTCC 2013 7] smallint
,[VA RTCC 2013 8] smallint
,[VA RTCC 2013 9] smallint
)


CREATE TABLE [CFScott].[dbo].[fc_master_weekend] (
[Run_Date] NVARCHAR(50)
,[BR WEBC 2013 Total] int
,[BR WEBC 2013 1] smallint
,[BR WEBC 2013 2] smallint
,[BR WEBC 2013 3] smallint
,[BR WEBC 2013 4] smallint
,[BR WEBC 2013 5] smallint
,[BR WEBC 2013 6] smallint
,[BR WEBC 2013 7] smallint
,[BR WEBC 2013 8] smallint
,[BR WEBC 2013 9] smallint
,[MO WEBC 2013 Total] int
,[MO WEBC 2013 1] smallint
,[MO WEBC 2013 2] smallint
,[MO WEBC 2013 3] smallint
,[MO WEBC 2013 4] smallint
,[MO WEBC 2013 5] smallint
,[MO WEBC 2013 6] smallint
,[MO WEBC 2013 7] smallint
,[MO WEBC 2013 8] smallint
,[MO WEBC 2013 9] smallint
,[SY WEBC 2013 Total] int
,[SY WEBC 2013 1] smallint
,[SY WEBC 2013 2] smallint
,[SY WEBC 2013 3] smallint
,[SY WEBC 2013 4] smallint
,[SY WEBC 2013 5] smallint
,[SY WEBC 2013 6] smallint
,[SY WEBC 2013 7] smallint
,[SY WEBC 2013 8] smallint
,[SY WEBC 2013 9] smallint
,[TO WEBC 2013 Total] int
,[TO WEBC 2013 1] smallint
,[TO WEBC 2013 2] smallint
,[TO WEBC 2013 3] smallint
,[TO WEBC 2013 4] smallint
,[TO WEBC 2013 5] smallint
,[TO WEBC 2013 6] smallint
,[TO WEBC 2013 7] smallint
,[TO WEBC 2013 8] smallint
,[TO WEBC 2013 9] smallint
)


CREATE TABLE [CFScott].[dbo].[fc_master_underware] (
[Run_Date] NVARCHAR(50)
,[CG UA 2013 Total] int
,[CG UA 2013 1] smallint
,[CG UA 2013 2] smallint
,[CG UA 2013 3] smallint
,[CG UA 2013 4] smallint
,[CG UA 2013 5] smallint
,[CG UA 2013 6] smallint
,[CG UA 2013 7] smallint
,[CG UA 2013 8] smallint
,[CG UA 2013 9] smallint
,[ED UA 2013 Total] int
,[ED UA 2013 1] smallint
,[ED UA 2013 2] smallint
,[ED UA 2013 3] smallint
,[ED UA 2013 4] smallint
,[ED UA 2013 5] smallint
,[ED UA 2013 6] smallint
,[ED UA 2013 7] smallint
,[ED UA 2013 8] smallint
,[ED UA 2013 9] smallint
,[VA UA 2013 Total] int
,[VA UA 2013 1] smallint
,[VA UA 2013 2] smallint
,[VA UA 2013 3] smallint
,[VA UA 2013 4] smallint
,[VA UA 2013 5] smallint
,[VA UA 2013 6] smallint
,[VA UA 2013 7] smallint
,[VA UA 2013 8] smallint
,[VA UA 2013 9] smallint
)


CREATE TABLE [CFScott].[dbo].[fc_master_hero] (
[Run_Date] NVARCHAR(50)
,[LA CCH 2013 Total] int
,[LA CCH 2013 1] smallint
,[LA CCH 2013 2] smallint
,[LA CCH 2013 3] smallint
,[LA CCH 2013 4] smallint
,[LA CCH 2013 5] smallint
,[LA CCH 2013 6] smallint
,[LA CCH 2013 7] smallint
,[LA CCH 2013 8] smallint
,[LA CCH 2013 9] smallint
,[VA CCH 2013 Total] int
,[VA CCH 2013 1] smallint
,[VA CCH 2013 2] smallint
,[VA CCH 2013 3] smallint
,[VA CCH 2013 4] smallint
,[VA CCH 2013 5] smallint
,[VA CCH 2013 6] smallint
,[VA CCH 2013 7] smallint
,[VA CCH 2013 8] smallint
,[VA CCH 2013 9] smallint
)
*/

TRUNCATE TABLE [CFScott].[dbo].[fc_master_ride]
INSERT INTO [CFScott].[dbo].[fc_master_ride] (
[Run_Date]
,[AD RTCC 2013 Total]
,[AD RTCC 2013 1]
,[AD RTCC 2013 2]
,[AD RTCC 2013 3]
,[AD RTCC 2013 4]
,[AD RTCC 2013 5]
,[AD RTCC 2013 6]
,[AD RTCC 2013 7]
,[AD RTCC 2013 8]
,[AD RTCC 2013 9]
,[AB RTCC 2013 Total]
,[AB RTCC 2013 1]
,[AB RTCC 2013 2]
,[AB RTCC 2013 3]
,[AB RTCC 2013 4]
,[AB RTCC 2013 5]
,[AB RTCC 2013 6]
,[AB RTCC 2013 7]
,[AB RTCC 2013 8]
,[AB RTCC 2013 9]
,[AK RTCC 2013 Total]
,[AK RTCC 2013 1]
,[AK RTCC 2013 2]
,[AK RTCC 2013 3]
,[AK RTCC 2013 4]
,[AK RTCC 2013 5]
,[AK RTCC 2013 6]
,[AK RTCC 2013 7]
,[AK RTCC 2013 8]
,[AK RTCC 2013 9]
,[BR RTCC 2013 Total]
,[BR RTCC 2013 1]
,[BR RTCC 2013 2]
,[BR RTCC 2013 3]
,[BR RTCC 2013 4]
,[BR RTCC 2013 5]
,[BR RTCC 2013 6]
,[BR RTCC 2013 7]
,[BR RTCC 2013 8]
,[BR RTCC 2013 9]
,[ML RTCC 2013 Total]
,[ML RTCC 2013 1]
,[ML RTCC 2013 2]
,[ML RTCC 2013 3]
,[ML RTCC 2013 4]
,[ML RTCC 2013 5]
,[ML RTCC 2013 6]
,[ML RTCC 2013 7]
,[ML RTCC 2013 8]
,[ML RTCC 2013 9]
,[MO RTCC 2013 Total]
,[MO RTCC 2013 1]
,[MO RTCC 2013 2]
,[MO RTCC 2013 3]
,[MO RTCC 2013 4]
,[MO RTCC 2013 5]
,[MO RTCC 2013 6]
,[MO RTCC 2013 7]
,[MO RTCC 2013 8]
,[MO RTCC 2013 9]
,[PR RTCC 2013 Total]
,[PR RTCC 2013 1]
,[PR RTCC 2013 2]
,[PR RTCC 2013 3]
,[PR RTCC 2013 4]
,[PR RTCC 2013 5]
,[PR RTCC 2013 6]
,[PR RTCC 2013 7]
,[PR RTCC 2013 8]
,[PR RTCC 2013 9]
,[SY RTCC 2013 Total]
,[SY RTCC 2013 1]
,[SY RTCC 2013 2]
,[SY RTCC 2013 3]
,[SY RTCC 2013 4]
,[SY RTCC 2013 5]
,[SY RTCC 2013 6]
,[SY RTCC 2013 7]
,[SY RTCC 2013 8]
,[SY RTCC 2013 9]
,[TO RTCC 2013 Total]
,[TO RTCC 2013 1]
,[TO RTCC 2013 2]
,[TO RTCC 2013 3]
,[TO RTCC 2013 4]
,[TO RTCC 2013 5]
,[TO RTCC 2013 6]
,[TO RTCC 2013 7]
,[TO RTCC 2013 8]
,[TO RTCC 2013 9]
,[VA RTCC 2013 Total]
,[VA RTCC 2013 1]
,[VA RTCC 2013 2]
,[VA RTCC 2013 3]
,[VA RTCC 2013 4]
,[VA RTCC 2013 5]
,[VA RTCC 2013 6]
,[VA RTCC 2013 7]
,[VA RTCC 2013 8]
,[VA RTCC 2013 9]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[Total_buckets] else 0 end) as 'AD RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket0] else 0 end) as 'AD RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket1] else 0 end) as 'AD RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket2] else 0 end) as 'AD RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket3] else 0 end) as 'AD RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket4] else 0 end) as 'AD RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket5] else 0 end) as 'AD RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket6] else 0 end) as 'AD RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket7] else 0 end) as 'AD RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Adelaide RTCC%' then x.[bucket8] else 0 end) as 'AD RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[Total_buckets] else 0 end) as 'AB RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket0] else 0 end) as 'AB RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket1] else 0 end) as 'AB RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket2] else 0 end) as 'AB RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket3] else 0 end) as 'AB RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket4] else 0 end) as 'AB RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket5] else 0 end) as 'AB RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket6] else 0 end) as 'AB RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket7] else 0 end) as 'AB RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Alberta RTCC%' then x.[bucket8] else 0 end) as 'AB RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[Total_buckets] else 0 end) as 'AK RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket0] else 0 end) as 'AK RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket1] else 0 end) as 'AK RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket2] else 0 end) as 'AK RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket3] else 0 end) as 'AK RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket4] else 0 end) as 'AK RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket5] else 0 end) as 'AK RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket6] else 0 end) as 'AK RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket7] else 0 end) as 'AK RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Auckland RTCC%' then x.[bucket8] else 0 end) as 'AK RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[Total_buckets] else 0 end) as 'BR RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket0] else 0 end) as 'BR RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket1] else 0 end) as 'BR RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket2] else 0 end) as 'BR RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket3] else 0 end) as 'BR RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket4] else 0 end) as 'BR RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket5] else 0 end) as 'BR RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket6] else 0 end) as 'BR RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket7] else 0 end) as 'BR RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane RTCC%' then x.[bucket8] else 0 end) as 'BR RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[Total_buckets] else 0 end) as 'ML RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket0] else 0 end) as 'ML RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket1] else 0 end) as 'ML RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket2] else 0 end) as 'ML RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket3] else 0 end) as 'ML RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket4] else 0 end) as 'ML RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket5] else 0 end) as 'ML RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket6] else 0 end) as 'ML RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket7] else 0 end) as 'ML RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Melbourne RTCC%' then x.[bucket8] else 0 end) as 'ML RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[Total_buckets] else 0 end) as 'MO RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket0] else 0 end) as 'MO RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket1] else 0 end) as 'MO RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket2] else 0 end) as 'MO RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket3] else 0 end) as 'MO RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket4] else 0 end) as 'MO RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket5] else 0 end) as 'MO RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket6] else 0 end) as 'MO RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket7] else 0 end) as 'MO RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal RTCC%' then x.[bucket8] else 0 end) as 'MO RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[Total_buckets] else 0 end) as 'PR RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket0] else 0 end) as 'PR RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket1] else 0 end) as 'PR RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket2] else 0 end) as 'PR RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket3] else 0 end) as 'PR RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket4] else 0 end) as 'PR RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket5] else 0 end) as 'PR RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket6] else 0 end) as 'PR RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket7] else 0 end) as 'PR RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Perth RTCC%' then x.[bucket8] else 0 end) as 'PR RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[Total_buckets] else 0 end) as 'SY RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket0] else 0 end) as 'SY RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket1] else 0 end) as 'SY RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket2] else 0 end) as 'SY RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket3] else 0 end) as 'SY RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket4] else 0 end) as 'SY RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket5] else 0 end) as 'SY RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket6] else 0 end) as 'SY RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket7] else 0 end) as 'SY RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney RTCC%' then x.[bucket8] else 0 end) as 'SY RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[Total_buckets] else 0 end) as 'TO RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket0] else 0 end) as 'TO RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket1] else 0 end) as 'TO RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket2] else 0 end) as 'TO RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket3] else 0 end) as 'TO RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket4] else 0 end) as 'TO RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket5] else 0 end) as 'TO RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket6] else 0 end) as 'TO RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket7] else 0 end) as 'TO RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto RTCC%' then x.[bucket8] else 0 end) as 'TO RTCC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[Total_buckets] else 0 end) as 'VA RTCC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket0] else 0 end) as 'VA RTCC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket1] else 0 end) as 'VA RTCC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket2] else 0 end) as 'VA RTCC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket3] else 0 end) as 'VA RTCC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket4] else 0 end) as 'VA RTCC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket5] else 0 end) as 'VA RTCC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket6] else 0 end) as 'VA RTCC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket7] else 0 end) as 'VA RTCC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver RTCC%' then x.[bucket8] else 0 end) as 'VA RTCC 2013 9'

      FROM (
      SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[Total_buckets]
      ,[bucket0]
      ,[bucket1]
      ,[bucket2]
      ,[bucket3]
      ,[bucket4]
      ,[bucket5]
      ,[bucket6]
      ,[bucket7]
      ,[bucket8]
  FROM [CFScott].[dbo].[fc_categories_test]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]


TRUNCATE TABLE [CFScott].[dbo].[fc_master_weekend]
INSERT INTO [CFScott].[dbo].[fc_master_weekend] (
[Run_Date]
,[BR WEBC 2013 Total]
,[BR WEBC 2013 1]
,[BR WEBC 2013 2]
,[BR WEBC 2013 3]
,[BR WEBC 2013 4]
,[BR WEBC 2013 5]
,[BR WEBC 2013 6]
,[BR WEBC 2013 7]
,[BR WEBC 2013 8]
,[BR WEBC 2013 9]
,[MO WEBC 2013 Total]
,[MO WEBC 2013 1]
,[MO WEBC 2013 2]
,[MO WEBC 2013 3]
,[MO WEBC 2013 4]
,[MO WEBC 2013 5]
,[MO WEBC 2013 6]
,[MO WEBC 2013 7]
,[MO WEBC 2013 8]
,[MO WEBC 2013 9]
,[SY WEBC 2013 Total]
,[SY WEBC 2013 1]
,[SY WEBC 2013 2]
,[SY WEBC 2013 3]
,[SY WEBC 2013 4]
,[SY WEBC 2013 5]
,[SY WEBC 2013 6]
,[SY WEBC 2013 7]
,[SY WEBC 2013 8]
,[SY WEBC 2013 9]
,[TO WEBC 2013 Total]
,[TO WEBC 2013 1]
,[TO WEBC 2013 2]
,[TO WEBC 2013 3]
,[TO WEBC 2013 4]
,[TO WEBC 2013 5]
,[TO WEBC 2013 6]
,[TO WEBC 2013 7]
,[TO WEBC 2013 8]
,[TO WEBC 2013 9]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[Total_buckets] else 0 end) as 'BR WEBC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket0] else 0 end) as 'BR WEBC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket1] else 0 end) as 'BR WEBC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket2] else 0 end) as 'BR WEBC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket3] else 0 end) as 'BR WEBC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket4] else 0 end) as 'BR WEBC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket5] else 0 end) as 'BR WEBC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket6] else 0 end) as 'BR WEBC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket7] else 0 end) as 'BR WEBC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Brisbane WEBC%' then x.[bucket8] else 0 end) as 'BR WEBC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[Total_buckets] else 0 end) as 'MO WEBC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket0] else 0 end) as 'MO WEBC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket1] else 0 end) as 'MO WEBC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket2] else 0 end) as 'MO WEBC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket3] else 0 end) as 'MO WEBC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket4] else 0 end) as 'MO WEBC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket5] else 0 end) as 'MO WEBC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket6] else 0 end) as 'MO WEBC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket7] else 0 end) as 'MO WEBC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Montreal WEBC%' then x.[bucket8] else 0 end) as 'MO WEBC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[Total_buckets] else 0 end) as 'SY WEBC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket0] else 0 end) as 'SY WEBC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket1] else 0 end) as 'SY WEBC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket2] else 0 end) as 'SY WEBC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket3] else 0 end) as 'SY WEBC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket4] else 0 end) as 'SY WEBC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket5] else 0 end) as 'SY WEBC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket6] else 0 end) as 'SY WEBC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket7] else 0 end) as 'SY WEBC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Sydney WEBC%' then x.[bucket8] else 0 end) as 'SY WEBC 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[Total_buckets] else 0 end) as 'TO WEBC 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket0] else 0 end) as 'TO WEBC 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket1] else 0 end) as 'TO WEBC 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket2] else 0 end) as 'TO WEBC 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket3] else 0 end) as 'TO WEBC 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket4] else 0 end) as 'TO WEBC 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket5] else 0 end) as 'TO WEBC 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket6] else 0 end) as 'TO WEBC 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket7] else 0 end) as 'TO WEBC 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Toronto WEBC%' then x.[bucket8] else 0 end) as 'TO WEBC 2013 9'

      FROM (
      SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[Total_buckets]
      ,[bucket0]
      ,[bucket1]
      ,[bucket2]
      ,[bucket3]
      ,[bucket4]
      ,[bucket5]
      ,[bucket6]
      ,[bucket7]
      ,[bucket8]
  FROM [CFScott].[dbo].[fc_categories_test]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]


TRUNCATE TABLE [CFScott].[dbo].[fc_master_underware]
INSERT INTO [CFScott].[dbo].[fc_master_underware] (
[Run_Date]
,[CG UA 2013 Total]
,[CG UA 2013 1]
,[CG UA 2013 2]
,[CG UA 2013 3]
,[CG UA 2013 4]
,[CG UA 2013 5]
,[CG UA 2013 6]
,[CG UA 2013 7]
,[CG UA 2013 8]
,[CG UA 2013 9]
,[ED UA 2013 Total]
,[ED UA 2013 1]
,[ED UA 2013 2]
,[ED UA 2013 3]
,[ED UA 2013 4]
,[ED UA 2013 5]
,[ED UA 2013 6]
,[ED UA 2013 7]
,[ED UA 2013 8]
,[ED UA 2013 9]
,[VA UA 2013 Total]
,[VA UA 2013 1]
,[VA UA 2013 2]
,[VA UA 2013 3]
,[VA UA 2013 4]
,[VA UA 2013 5]
,[VA UA 2013 6]
,[VA UA 2013 7]
,[VA UA 2013 8]
,[VA UA 2013 9]
)
SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[Total_buckets] else 0 end) as 'CG UA 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket0] else 0 end) as 'CG UA 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket1] else 0 end) as 'CG UA 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket2] else 0 end) as 'CG UA 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket3] else 0 end) as 'CG UA 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket4] else 0 end) as 'CG UA 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket5] else 0 end) as 'CG UA 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket6] else 0 end) as 'CG UA 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket7] else 0 end) as 'CG UA 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Calgary UA%' then x.[bucket8] else 0 end) as 'CG UA 2013 9'

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[Total_buckets] else 0 end) as 'ED UA 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket0] else 0 end) as 'ED UA 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket1] else 0 end) as 'ED UA 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket2] else 0 end) as 'ED UA 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket3] else 0 end) as 'ED UA 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket4] else 0 end) as 'ED UA 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket5] else 0 end) as 'ED UA 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket6] else 0 end) as 'ED UA 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket7] else 0 end) as 'ED UA 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Edmonton UA%' then x.[bucket8] else 0 end) as 'ED UA 2013 9'
      
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[Total_buckets] else 0 end) as 'VA UA 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket0] else 0 end) as 'VA UA 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket1] else 0 end) as 'VA UA 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket2] else 0 end) as 'VA UA 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket3] else 0 end) as 'VA UA 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket4] else 0 end) as 'VA UA 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket5] else 0 end) as 'VA UA 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket6] else 0 end) as 'VA UA 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket7] else 0 end) as 'VA UA 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver UA%' then x.[bucket8] else 0 end) as 'VA UA 2013 9'

      FROM (
      SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[Total_buckets]
      ,[bucket0]
      ,[bucket1]
      ,[bucket2]
      ,[bucket3]
      ,[bucket4]
      ,[bucket5]
      ,[bucket6]
      ,[bucket7]
      ,[bucket8]
  FROM [CFScott].[dbo].[fc_categories_test]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]


TRUNCATE TABLE [CFScott].[dbo].[fc_master_hero]
INSERT INTO [CFScott].[dbo].[fc_master_hero] (
[Run_Date]
,[LA CCH 2013 Total]
,[LA CCH 2013 1]
,[LA CCH 2013 2]
,[LA CCH 2013 3]
,[LA CCH 2013 4]
,[LA CCH 2013 5]
,[LA CCH 2013 6]
,[LA CCH 2013 7]
,[LA CCH 2013 8]
,[LA CCH 2013 9]
,[VA CCH 2013 Total]
,[VA CCH 2013 1]
,[VA CCH 2013 2]
,[VA CCH 2013 3]
,[VA CCH 2013 4]
,[VA CCH 2013 5]
,[VA CCH 2013 6]
,[VA CCH 2013 7]
,[VA CCH 2013 8]
,[VA CCH 2013 9]
)

SELECT x.[Run_Date]

      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[Total_buckets] else 0 end) as 'LA CCH 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket0] else 0 end) as 'LA CCH 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket1] else 0 end) as 'LA CCH 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket2] else 0 end) as 'LA CCH 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket3] else 0 end) as 'LA CCH 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket4] else 0 end) as 'LA CCH 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket5] else 0 end) as 'LA CCH 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket6] else 0 end) as 'LA CCH 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket7] else 0 end) as 'LA CCH 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Los Angeles CCH%' then x.[bucket8] else 0 end) as 'LA CCH 2013 9'
     
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[Total_buckets] else 0 end) as 'VA CCH 2013 Total'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket0] else 0 end) as 'VA CCH 2013 1'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket1] else 0 end) as 'VA CCH 2013 2'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket2] else 0 end) as 'VA CCH 2013 3'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket3] else 0 end) as 'VA CCH 2013 4'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket4] else 0 end) as 'VA CCH 2013 5'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket5] else 0 end) as 'VA CCH 2013 6'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket6] else 0 end) as 'VA CCH 2013 7'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket7] else 0 end) as 'VA CCH 2013 8'
      ,SUM(case when x.[Event_Name] like '2013%' and x.[Event_Name] like '%Vancouver CH%' then x.[bucket8] else 0 end) as 'VA CCH 2013 9'

      FROM (
      SELECT [Run_Da]
      ,[Run_Date]
      ,[Event_Code]
      ,[Event_Name]
      ,[Total_buckets]
      ,[bucket0]
      ,[bucket1]
      ,[bucket2]
      ,[bucket3]
      ,[bucket4]
      ,[bucket5]
      ,[bucket6]
      ,[bucket7]
      ,[bucket8]
  FROM [CFScott].[dbo].[fc_categories_test]
) as x
GROUP BY x.[Run_Date]
ORDER BY x.[Run_Date]