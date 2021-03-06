/****** Script for SelectTopNRows command from SSMS  ******/
SELECT a.[cons_id]
      ,a.[name] reg_name
      ,b.[name] rfi_name
      ,b.[fname] rfi_fname
      ,b.[lname] rfi_lname
      ,a.[fname] reg_fname
      ,a.[lname] reg_lname
      ,b.[rfi] rfi_date
      ,a.[registration] reg_date
      ,datediff(dd,b.[rfi],a.[registration]) [age]
      ,b.[evnt] rfi_evnt
      ,a.[evnt] reg_evnt
      ,a.[part_type]
      ,a.[total_donations]
      ,a.[origin1]
      ,a.[origin2]
      ,a.[origin_app]
      ,a.[lang]
      ,a.[gender]
      ,a.[dob]
      ,a.[media1]
      ,a.[media2]
      ,a.[rfi1]
      ,a.[rfi2]
      ,a.[prior]
      ,a.[self]
  FROM	[CFScott].[dbo].[interaction_report] a
  INNER JOIN
		[CFScott].[dbo].[interaction_rfi] b
	on a.[name] = b.[name]
	and (substring(a.[evnt],6,5) = substring(b.[evnt],6,5) or substring(a.[evnt],6,5) = substring(b.[evnt],1,5))
	and (substring(a.[evnt],1,4) = left(b.[evnt],4) or substring(a.[evnt],1,4) = right(b.[evnt],4))