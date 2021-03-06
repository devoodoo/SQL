SELECT DISTINCT
       a.[name] rfi_name
      ,b.[name] reg_name
      ,a.[lname] rfi_lname
      ,a.[fname] rfi_fname
      ,b.[lname] reg_lname
      ,b.[fname] reg_fname
      ,a.[rfi] rfi_date
      ,b.[reg] reg_date
      ,DATEDIFF(dd,a.[rfi],b.[reg]) [days]
      ,a.[evnt_yr] rfi_yr
      ,a.[evnt_type] rfi_type
      ,b.[evnt] reg_evnt
      ,b.[cons_id] reg_cons
      ,b.[type] Reg_type	
	  ,c.[media_cons] cons_cons
      ,c.[media_fname] cons_fname
      ,c.[media_lname] cons_lname
      ,c.[media_name] cons_name
      ,c.[dob_date] cons_dob
      ,c.[gender] cons_gender
      ,c.[pref_lang] cons_lang
      ,c.[previous] cons_previous
      ,c.[gifts] cons_gifts
      ,c.[event_name] cons_evnt
      ,c.[rfi_source1] cons_rfi_media
      ,c.[rfi_source2] cons_rfi_media2
      ,c.[media_source1] cons_media
      ,c.[media_source2] cons_media2
      ,c.[origin_source] cons_origin
      ,c.[origin_subsource] cons_origin2
  FROM [CFScott].[dbo].[interaction_rfi] a
  inner join [CFScott].[dbo].[interaction_reg] b
  on a.[name] = b.[name] 
  and (
	substring(b.[evnt],6,3) = substring(a.[evnt_yr],6,3) or substring(b.[evnt],6,3) = substring(a.[evnt_yr],1,3)
	)
	and (
	substring(b.[evnt],1,4) = left(a.[evnt_yr],4) or substring(b.[evnt],1,4) = right(a.[evnt_yr],4)
	)
  left outer join [CFScott].[dbo].[interaction_cons] c 
  on b.[cons_id] = c.[media_cons] and a.[evnt_type] = right(c.[event_name],4)
