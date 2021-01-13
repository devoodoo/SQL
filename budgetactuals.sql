/*
GO

drop table CFScott.dbo.rtkoi_alt

GO

create table CFScott.dbo.rtkoi_alt
(
		cdate date
		,pdate date
		,instance nvarchar(10)
		,fr_id nvarchar(4)
		,evnt nvarchar(50)
		,part_type nvarchar(50)
		,new_num numeric(19,2)
)
*/

/*
GO

TRUNCATE TABLE CFScott.dbo.rtkoi_alt

	INSERT INTO CFScott.dbo.rtkoi_alt (cdate,pdate,instance,fr_id,evnt,part_type,new_num)
select	x.rundate cdate
		,y.rundate pdate
		,x.instance
		,x.fr_id
		,x.evnt
		,x.part_type
		,sum(x.num - y.num) new_num
	from CFNew.dbo.fc_rtkoi x inner join CFNew.dbo.fc_rtkoi y on x.rundate = DATEADD(dd,+1,y.rundate)
		and x.instance = y.instance and x.fr_id = y.fr_id and x.evnt = y.evnt and x.part_type = y.part_type
			group by x.rundate,y.rundate,x.instance,x.fr_id,x.evnt,x.part_type
				order by x.rundate desc
*/

/*
drop table CFScott.dbo.budgetactualtemp

GO

create table CFScott.dbo.budgetactualtemp
(
	 amt float
	,evnt nvarchar(50)
	,rec_date date
	,trid nvarchar(4)
	,var_type nvarchar(6)
	,budget_name nvarchar(50)
	,project_no nvarchar(8)
	,alt_project_no nvarchar(6)
)
*/

GO

	TRUNCATE TABLE CFScott.dbo.budgetactualtemp

GO

/*REAL ACTUAL/BUDGET sponsorship*/
	INSERT INTO CFScott.dbo.budgetactualtemp (amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no)
select SUM(amount) amt,evnt,rec_date,trid
	,case 
		WHEN budget_type = 'CS2' THEN 'Actual'
	else 'Budget' end var_type
	,case 
		WHEN budget_type = 'W1' THEN 'Walker'
		WHEN budget_type = 'W2' THEN 'Walker'
		WHEN budget_type = 'C' THEN 'Crew'
		WHEN budget_type = 'RF' THEN 'Total Registration Fees'
		WHEN budget_type = 'D' THEN 'Total Donations'
		WHEN budget_type = 'TI' THEN 'Total Income'
		WHEN budget_type = 'R' THEN 'Rider'
		WHEN budget_type = 'RK2' THEN 'Rider'
		WHEN budget_type = 'RM2' THEN 'Rider'
		WHEN budget_type = 'RV' THEN 'Virtual Rider'
		WHEN budget_type = 'P' THEN 'Total Participants Registered'
		WHEN budget_type = 'CS' THEN 'Total Cash Sponsorship'
		WHEN budget_type = 'CH' THEN 'Hero'
		WHEN budget_type = 'CH SUM' THEN 'Total Concrete Heroes'
		WHEN budget_type = 'CS SUM' THEN 'Total Cash Sponsorship'
		WHEN budget_type = 'CS2' THEN 'Total Cash Sponsorship'
	else budget_type end budget_name
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,1,4) project_no
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,3,2) alt_project_no

	from CFNew.dbo.fc_sponsorship
		where rec_date <= getdate()
			group by budget_type,evnt,rec_date,trid

GO

/*REAL ACTUAL rtkoi*/
	INSERT INTO CFScott.dbo.budgetactualtemp (amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no)
select SUM(num) amt,evnt,rundate rec_date,fr_id trid,'Actual' var_type
	,case 
		WHEN part_type = '1-Day Walker' THEN 'Walker'
		WHEN part_type = '2-Day Walker' THEN 'Walker'
		WHEN part_type = '10K Runner' THEN 'Walker'
		WHEN part_type = '5K Walker' THEN 'Walker'
		WHEN part_type = '5K Walker/10K Runner' THEN 'Walker'
		WHEN part_type = 'Walker' THEN 'Walker'
		WHEN part_type = 'Booty Hunter' THEN 'Hunter'
		WHEN part_type = 'Scavenger Hunter' THEN 'Hunter'
		WHEN part_type = 'REG_DOLLARS_AMOUNT' THEN 'Total Registration Fees'
		WHEN part_type = 'DONATIONS_AMOUNT' THEN 'Total Donations'
		WHEN part_type = '1-Day Rider' THEN 'Rider'
		WHEN part_type = '2-Day Rider' THEN 'Rider'
		WHEN part_type = 'K200 Rider' THEN 'Rider'
		WHEN part_type = 'K200 Rider: Toronto-Hamilton-Niagara' THEN 'Rider'
		WHEN part_type = 'M200 Rider' THEN 'Rider'
		WHEN part_type = 'Rider - 14-16 yrs. old' THEN 'Rider'
		WHEN part_type = 'Rider - Over 16 yrs. old' THEN 'Rider'
		WHEN part_type = 'Rider' THEN 'Rider'
		WHEN part_type = 'Virtual Rider' THEN 'Virtual Rider'
		WHEN part_type = 'Concrete Hero' THEN 'Hero'
	else part_type end budget_name
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,1,4) project_no
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,3,2) alt_project_no	

	from CFNew.dbo.fc_rtkoi
		where rundate <= getdate()
			group by part_type,evnt,rundate,fr_id

GO

/*FAKE ACTUAL sponsorship*/
	INSERT INTO CFScott.dbo.budgetactualtemp (amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no)
select 0 amt,evnt,rec_date,trid,'Actual' var_type
	,case 
		WHEN budget_type = 'W1' THEN 'Walker'
		WHEN budget_type = 'W2' THEN 'Walker'
		WHEN budget_type = 'C' THEN 'Crew'
		WHEN budget_type = 'RF' THEN 'Total Registration Fees'
		WHEN budget_type = 'D' THEN 'Total Donations'
		WHEN budget_type = 'TI' THEN 'Total Income'
		WHEN budget_type = 'R' THEN 'Rider'
		WHEN budget_type = 'RK2' THEN 'Rider'
		WHEN budget_type = 'RM2' THEN 'Rider'
		WHEN budget_type = 'RV' THEN 'Virtual Rider'
		WHEN budget_type = 'P' THEN 'Total Participants Registered'
		WHEN budget_type = 'CS' THEN 'Total Cash Sponsorship'
		WHEN budget_type = 'CH' THEN 'Hero'
		WHEN budget_type = 'CH SUM' THEN 'Total Concrete Heroes'
		WHEN budget_type = 'CS SUM' THEN 'Total Cash Sponsorship'
		WHEN budget_type = 'CS2' THEN 'Total Cash Sponsorship'
	else budget_type end budget_name
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,1,4) project_no
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,3,2) alt_project_no

	from CFNew.dbo.fc_sponsorship
		group by budget_type,evnt,rec_date,trid

GO

/*FAKE BUDGET sponsorship*/
	INSERT INTO CFScott.dbo.budgetactualtemp (amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no)
select 0 amt,evnt,rec_date,trid,'Budget' var_type
	,case 
		WHEN budget_type = 'W1' THEN 'Walker'
		WHEN budget_type = 'W2' THEN 'Walker'
		WHEN budget_type = 'C' THEN 'Crew'
		WHEN budget_type = 'RF' THEN 'Total Registration Fees'
		WHEN budget_type = 'D' THEN 'Total Donations'
		WHEN budget_type = 'TI' THEN 'Total Income'
		WHEN budget_type = 'R' THEN 'Rider'
		WHEN budget_type = 'RK2' THEN 'Rider'
		WHEN budget_type = 'RM2' THEN 'Rider'
		WHEN budget_type = 'RV' THEN 'Virtual Rider'
		WHEN budget_type = 'P' THEN 'Total Participants Registered'
		WHEN budget_type = 'CS' THEN 'Total Cash Sponsorship'
		WHEN budget_type = 'CH' THEN 'Hero'
		WHEN budget_type = 'CH SUM' THEN 'Total Concrete Heroes'
		WHEN budget_type = 'CS SUM' THEN 'Total Cash Sponsorship'
		WHEN budget_type = 'CS2' THEN 'Total Cash Sponsorship'
	else budget_type end budget_name
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,1,4) project_no
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,3,2) alt_project_no

	from CFNew.dbo.fc_sponsorship
		group by budget_type,evnt,rec_date,trid

GO

/*FAKE ACTUAL rtkoi*/
	INSERT INTO CFScott.dbo.budgetactualtemp (amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no)
select 0 amt,evnt,rundate rec_date,fr_id trid,'Actual' var_type
	,case 
		WHEN part_type = '1-Day Walker' THEN 'Walker'
		WHEN part_type = '2-Day Walker' THEN 'Walker'
		WHEN part_type = '10K Runner' THEN 'Walker'
		WHEN part_type = '5K Walker' THEN 'Walker'
		WHEN part_type = '5K Walker/10K Runner' THEN 'Walker'
		WHEN part_type = 'Walker' THEN 'Walker'
		WHEN part_type = 'Booty Hunter' THEN 'Hunter'
		WHEN part_type = 'Scavenger Hunter' THEN 'Hunter'
		WHEN part_type = 'REG_DOLLARS_AMOUNT' THEN 'Total Registration Fees'
		WHEN part_type = 'DONATIONS_AMOUNT' THEN 'Total Donations'
		WHEN part_type = '1-Day Rider' THEN 'Rider'
		WHEN part_type = '2-Day Rider' THEN 'Rider'
		WHEN part_type = 'K200 Rider' THEN 'Rider'
		WHEN part_type = 'K200 Rider: Toronto-Hamilton-Niagara' THEN 'Rider'
		WHEN part_type = 'M200 Rider' THEN 'Rider'
		WHEN part_type = 'Rider - 14-16 yrs. old' THEN 'Rider'
		WHEN part_type = 'Rider - Over 16 yrs. old' THEN 'Rider'
		WHEN part_type = 'Rider' THEN 'Rider'
		WHEN part_type = 'Virtual Rider' THEN 'Virtual Rider'
		WHEN part_type = 'Concrete Hero' THEN 'Hero'
	else part_type end budget_name
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,1,4) project_no
	,(case
		when evnt like '%RTCC%' then 'RC'
		when evnt like '%UA%' then 'UA'
		when evnt like '%WEBC%' or evnt like '%WEWC%' then 'WK'
		when evnt like '%CH%' then 'CH'
	else 'HH' end)+(case
		when evnt like '%Adelaide%' then 'AD'
		when evnt like '%Alberta%' then 'AB'
		when evnt like '%Auckland%' then 'AK'
		when evnt like '%Brisbane%' then 'BR'
		when evnt like '%Calgary%' then 'CL'
		when evnt like '%Edmonton%' then 'ED'
		when evnt like '%Indianapolis%' then 'IN'
		when evnt like '%Kentucky%' then 'KY'
		when evnt like '%Los Angeles%' then 'LA'
		when evnt like '%Melbourne%' then 'ML'
		when evnt like '%Montreal%' then 'MO'
		when evnt like '%Ottawa%' then 'OT'
		when evnt like '%Perth%' then 'PR'
		when evnt like '%Sydney%' then 'SY'
		when evnt like '%Toronto%' then 'TO'
		when evnt like '%Vancouver%' then 'VA'
	else 'HH' end)+substring(evnt,3,2) alt_project_no

	from CFNew.dbo.fc_rtkoi
		group by part_type,evnt,rundate,fr_id

GO

	TRUNCATE TABLE CFScott.dbo.budgetincome

GO

	INSERT INTO CFScott.dbo.budgetincome
		([rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt],[HST_GST],[Interest],[Other],[OCI],[Fundraising],[Tradmark],[Third_Party])
SELECT CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101) rec_date
      ,[trid]
      ,[var_type]
      ,[project_no]
      ,[alt_project_no]
      ,[evnt]
      ,SUM([HST_GST_Refund]) HST_GST
      ,SUM([Interest_Income]) Interest
      ,SUM([Other_Income]) Other
      ,SUM([OCI_Reg]) OCI
      ,SUM([Fundraising_Credits]) Fundraising
      ,SUM([Tradmark_Income]) Tradmark
      ,SUM([Third_Party_Contribution]) Third_Party
	FROM [CFScott].[dbo].[budgetincometemp]	
	/*previous month*/
		where rec_date between 
		CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0),101) and 
		CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101)
				GROUP BY [rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt]

GO

	INSERT INTO CFScott.dbo.budgetincome
		([rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt],[HST_GST],[Interest],[Other],[OCI],[Fundraising],[Tradmark],[Third_Party])
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()))),DATEADD(mm,1,GETDATE())),101) rec_date
      ,[trid]
      ,[var_type]
      ,[project_no]
      ,[alt_project_no]
      ,[evnt]
      ,SUM([HST_GST_Refund]) HST_GST
      ,SUM([Interest_Income]) Interest
      ,SUM([Other_Income]) Other
      ,SUM([OCI_Reg]) OCI
      ,SUM([Fundraising_Credits]) Fundraising
      ,SUM([Tradmark_Income]) Tradmark
      ,SUM([Third_Party_Contribution]) Third_Party
	FROM [CFScott].[dbo].[budgetincometemp]	
	/*current month*/
		where rec_date between CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(GETDATE())-1),GETDATE()),101) and
		CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()))),DATEADD(mm,1,GETDATE())),101)
				GROUP BY [rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt]

GO

/*
drop table CFScott.dbo.budgetactual

GO

create table CFScott.dbo.budgetactual
(
	 evnt nvarchar(50)
	,rec_date date
	,trid nvarchar(4)
	,var_type nvarchar(6)
	,project_no nvarchar(8)
	,alt_project_no nvarchar(6)
	,RFI int
	,[Walk/Ride/Hero] int
	,[Hunter/Crew/VRide] int
	,Donations float
	,Registration float
	,Sponsorship float
	,Income float
)

GO*/

	TRUNCATE TABLE CFScott.dbo.budgetactual

GO

	INSERT INTO CFScott.dbo.budgetactual (rec_date,var_type,project_no,alt_project_no,evnt,trid,RFI,[Walk/Ride/Hero],[Hunter/Crew/VRide],Donations,Registration,Sponsorship,Income)
select rec_date,var_type,project_no,alt_project_no,evnt,trid
	,SUM(CASE WHEN budget_name = 'RFI' THEN amt END) as RFI
	,SUM(CASE WHEN budget_name IN('Walker','Rider','Hero','Total Concrete Heroes','Total Participants Registered') THEN amt END) as [Walk/Ride/Hero]
	,SUM(CASE WHEN budget_name IN('Hunter','Crew','Virtual Rider') THEN amt END) as [Hunter/Crew/VRide]
	,SUM(CASE WHEN budget_name = 'Total Donations' THEN amt END) as Donations
	,SUM(CASE WHEN budget_name = 'Total Registration Fees' THEN amt END) as Registration
	,SUM(CASE WHEN budget_name = 'Total Cash Sponsorship' THEN amt END) as Sponsorship
	,SUM(CASE WHEN budget_name = 'Total Income' THEN amt END) as Income
	from CFScott.dbo.budgetactualtemp 
		where rec_date = CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()))),DATEADD(mm,1,GETDATE())),101)
		or rec_date = CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101)
		and evnt not like '%test%'
			group by rec_date,var_type,project_no,alt_project_no,evnt,trid
				order by rec_date desc

GO

/*
drop table CFScott.dbo.budgetreport

GO

create table CFScott.dbo.budgetreport
(
	rec_date date
	,trid nvarchar(4)
	,var_type nvarchar(6)
	,project_no nvarchar(8)
	,alt_project_no nvarchar(6)
	,evnt nvarchar(50)
	,RFI int
	,[Walk/Ride/Hero] int
	,[Hunter/Crew/VRide] int
	,Donations numeric(19,2)
	,Registration numeric(19,2)
	,Sponsorship numeric(19,2)
	,Income numeric(19,2)
	,HST_GST numeric(19,2)
	,Interest numeric(19,2)
	,Other numeric(19,2)
	,OCI numeric(19,2)
	,Fundraising numeric(19,2)
	,Tradmark numeric(19,2)
	,Third_Party numeric(19,2)
)
GO*/

	TRUNCATE TABLE CFScott.dbo.budgetreport

GO

	INSERT INTO CFScott.dbo.budgetreport
	(rec_date,trid,var_type,project_no,alt_project_no,evnt,RFI,[Walk/Ride/Hero],[Hunter/Crew/VRide],Donations
	,Registration,Sponsorship,Income,HST_GST,Interest,Other,OCI,Fundraising,Tradmark,Third_Party)

	SELECT DISTINCT
	 rec_date
	,a.trid trid
	,a.var_type var_type
	,a.project_no project_no
	,a.alt_project_no alt_project_no
	,a.evnt evnt
	,ISNULL(a.RFI,0) RFI
	,ISNULL(a.[Walk/Ride/Hero],0) [Walk/Ride/Hero]
	,ISNULL(a.[Hunter/Crew/VRide],0) [Hunter/Crew/VRide]
	,ISNULL(a.Donations,0) Donations
	,ISNULL(a.Registration,0) Registration
	,ISNULL(a.Sponsorship,0) Sponsorship
	,ISNULL(a.Income,0) Income
      ,0 HST_GST
      ,0 Interest
      ,0 Other
      ,0 OCI
      ,0 Fundraising
      ,0 Tradmark
      ,0 Third_Party

	FROM CFScott.dbo.budgetactual a 

	UNION

	SELECT DISTINCT
       rec_date
      ,i.[trid] trid
      ,i.[var_type] var_type
      ,i.[project_no] project_no
      ,i.[alt_project_no] alt_project_no
      ,i.[evnt] evnt
	,0 RFI
	,0 [Walk/Ride/Hero]
	,0 [Hunter/Crew/VRide]
	,0 Donations
	,0 Registration
	,0 Sponsorship
	,0 Income
      ,ISNULL(i.HST_GST,0) HST_GST
      ,ISNULL(i.Interest,0) Interest
      ,ISNULL(i.Other,0) Other
      ,ISNULL(i.OCI,0) OCI
      ,ISNULL(i.Fundraising,0) Fundraising
      ,ISNULL(i.Tradmark,0) Tradmark
      ,ISNULL(i.Third_Party,0) Third_Party

	FROM CFScott.dbo.budgetincome i

GO


/*
FINDING BAD/NEW EVNT NAMES
select distinct evnt
	from CFScott.dbo.budgetactualtemp
		where project_no like '%HHHH%' or alt_project_no like '%HHHH%'
*/



/*
	INSERTING INTO TABLE
	TRUNCATE TABLE CFScott.dbo.budgetactual
	INSERT INTO CFScott.dbo.budgetactual (amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no)
	SELECT amt,evnt,rec_date,trid,var_type,budget_name,project_no,alt_project_no 
	FROM CFScott.dbo.budgetactualtemp
	order by rec_date desc
*/



/* FINDING DATES
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(GETDATE())),GETDATE()),101) AS Date_Value,
'Last Day of Previous Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(GETDATE())-1),GETDATE()),101) AS Date_Value,
'First Day of Current Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),GETDATE(),101) AS Date_Value, 'Today' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()))),DATEADD(mm,1,GETDATE())),101) AS Date_Value,
'Last Day of Current Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,GETDATE()))-1),DATEADD(mm,1,GETDATE())),101) AS Date_Value,
'First Day of Next Month' AS Date_Type

select CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0),101) --First day of previous month
select CONVERT(VARCHAR(25),DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101) --Last Day of previous month
*/



/*
DROP TABLE [CFScott].[dbo].[budgetincometemp]

CREATE TABLE [CFScott].[dbo].[budgetincometemp]
(
	 rec_date date
	,trid nvarchar(4)
	,var_type nvarchar(6)
	,project_no nvarchar(8)
	,alt_project_no nvarchar(6)
	,evnt nvarchar(50)
	,HST_GST_Refund float
	,Interest_Income float
	,Other_Income float
	,OCI_Reg float
	,Fundraising_Credits float
	,Tradmark_Income float
	,Third_Party_Contribution float
)

INSERT INTO [CFScott].[dbo].[budgetincometemp] ([rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt],[HST_GST_Refund],[Interest_Income],[Other_Income],[OCI_Reg],[Fundraising_Credits],[Tradmark_Income],[Third_Party_Contribution]) VALUES('2013-6-30','1150','Actual','RCAD2013','RCAD13','2013 Adelaide RTCC',0,0,0,0,0,0,0)
INSERT INTO [CFScott].[dbo].[budgetincometemp] ([rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt],[HST_GST_Refund],[Interest_Income],[Other_Income],[OCI_Reg],[Fundraising_Credits],[Tradmark_Income],[Third_Party_Contribution]) VALUES('2013-6-30','1452','Actual','RCAB2013','RCAB13','2013 Alberta RTCC',47924,18466,0,0,0,0,0)
INSERT INTO [CFScott].[dbo].[budgetincometemp] ([rec_date],[trid],[var_type],[project_no],[alt_project_no],[evnt],[HST_GST_Refund],[Interest_Income],[Other_Income],[OCI_Reg],[Fundraising_Credits],[Tradmark_Income],[Third_Party_Contribution]) VALUES('2013-6-30','1040','Actual','RCAK2013','RCAK13','2013 Auckland RTCC',0,0,0,0,0,0,0)
*/