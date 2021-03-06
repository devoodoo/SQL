GO

DROP TABLE [CFScott].[dbo].[rtkoi_ops]

GO

CREATE TABLE [CFScott].[dbo].[rtkoi_ops]
(rundate date
,evnt varchar (50)
,part_type varchar (50)
,num float)

GO

INSERT INTO [CFScott].[dbo].[rtkoi_ops]
SELECT rundate,evnt,part_type,num
FROM [CFNew].[dbo].[fc_rtkoi]

GO

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Participant'
where part_type = '10K Runner'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = 'K200 Rider'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Participant'
where part_type = '5K Walker'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = 'Rider - 14-16 yrs. old'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Participant'
where part_type = 'Scavenger Hunter'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = '2-Day Walker'
where part_type = 'Walker'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Participant'
where part_type = '5K Walker/10K Runner'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Participant'
where part_type = 'Booty Hunter'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = '2-Day Rider'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = '1-Day Rider'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = 'M200 Rider'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = 'Rider - Over 16 yrs. old'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Hero'
where part_type = 'Concrete Hero'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Rider'
where part_type = 'K200 Rider: Toronto-Hamilton-Niagara'

UPDATE [CFScott].[dbo].[rtkoi_ops]
set part_type = 'Total Donations'
where part_type = 'DONATIONS_AMOUNT'

DELETE FROM [CFScott].[dbo].[rtkoi_ops]
WHERE part_type in('Crew','Virtual Rider','RFI','REG_DOLLARS_AMOUNT')

GO

DROP TABLE [CFScott].[dbo].[ops_mail]

GO

CREATE TABLE [CFScott].[dbo].[ops_mail]
(rundate date
,pt1 nvarchar(50)
,evnt1 nvarchar(50)
,tot1 dec(19,2)
,evnt2 nvarchar(50)
,tot2 dec(19,2)
,diff dec(19,2))

GO

INSERT INTO [CFScott].[dbo].[ops_mail] (rundate,pt1,evnt1,tot1,evnt2,tot2,diff)
SELECT s.[rundate] rundate
      ,s.[part_type] pt1
      ,s.[evnt] evnt1
      ,s.[num] tot1
      ,t.[evnt] evnt2
      ,t.[num] tot2
      ,s.[num] - t.[num] diff
  FROM [CFScott].[dbo].[rtkoi_ops] s inner join [CFScott].[dbo].[rtkoi_ops] t
	on s.[rundate] = DATEADD(yy,+1,t.[rundate]) 
	and s.[part_type] = t.[part_type]
	and convert(varchar(4),(cast(substring(s.[evnt],1,4)as int)-1)) + substring(s.[evnt],5,LEN(s.[evnt])-4) = t.[evnt]
	and cast(substring(s.[evnt],1,4)as int)-1 in ('2012','2013') 
	and s.[rundate] > '2013-01-01' and s.[rundate] < GETDATE()
	order by s.[rundate] desc

GO