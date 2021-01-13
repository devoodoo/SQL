GO

drop table CFScott.dbo.trying3

GO

create table CFScott.dbo.trying3 (rundate date,evnt nvarchar(50),total numeric(19,2),[type] nvarchar (10))

GO

INSERT INTO CFScott.dbo.trying3 (rundate,evnt,total,[type])
select rundate,evnt,SUM(num) total,
case 
when part_type = 'DONATIONS_AMOUNT' then 'Don' 
when part_type IN(
'2-Day Walker',
'10K Runner',
/*'Crew',*/
'K200 Rider',
'5K Walker',
'Rider - 14-16 yrs. old',
'Scavenger Hunter',
'Rider',
'Walker',
'Virtual Rider',
'5K Walker/10K Runner',
'Booty Hunter',
'2-Day Rider',
'1-Day Rider',
'M200 Rider',
'1-Day Walker',
'Rider - Over 16 yrs. old',
'Concrete Hero',
'K200 Rider: Toronto-Hamilton-Niagara') then 'Part' 
else '' end as [type]
	from CFNew.dbo.fc_rtkoi/*
		where (rundate = CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE()-15)-1, -1),101)) or 
		(rundate = CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()-15))),DATEADD(mm,1,GETDATE()-15)),101))
			*/group by rundate,evnt,part_type
				order by evnt

GO

drop table CFScott.dbo.trying2

GO

create table CFScott.dbo.trying2 (rundate date,evnt nvarchar(50),total numeric(19,2),[type] nvarchar (10))

GO

INSERT INTO CFScott.dbo.trying2 (rundate,evnt,total,[type])
SELECT [rundate]
      ,[evnt]
      ,SUM([total]) Amt
      ,[type]
  FROM [CFScott].[dbo].[trying3]
	where [type] <> ''
		group by [rundate],[evnt],[type]
			order by evnt

GO

drop table CFScott.dbo.trying

GO

create table CFScott.dbo.trying (rundate date,evnt nvarchar(50),donors numeric(19,2),registrations numeric(19,2))

GO

INSERT INTO CFScott.dbo.trying (rundate,evnt,donors,registrations)
SELECT [rundate],[evnt]
      ,SUM(case when [type] = 'Don' then total else 0 end) donors
      ,SUM(case when [type] = 'Part' then total else 0 end) registrations
  FROM [CFScott].[dbo].[trying2]
	where [type] <> '' and [evnt] not like '%test%'
		group by [rundate],[evnt]
			order by evnt

GO

--select * from CFScott.dbo.trying