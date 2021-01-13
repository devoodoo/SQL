SELECT * FROM msdb.dbo.sysmail_allitems 
   WHERE mailitem_id = 2;
   
SELECT * FROM msdb.dbo.sysmail_event_log
   WHERE mailitem_id = 2;
   
   
   EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'Email Sender',
    @recipients = 'stower@causeforce.com',
    @query = 'SELECT [rundate],[evnt1]
,MAX([1-Day Walker]) as [1-Day Walker]
,MAX([2-Day Walker]) as [2-Day Walker]
,MAX([Rider]) as [Rider]
,MAX([Participants]) as [Participants]
,MAX([Concrete Hero]) as [Concrete Hero]
,MAX([Total Donations]) as [Total Donations]

FROM
(
SELECT [rundate],[pt1],[evnt1],[tot1],[evnt2],[tot2],[diff]
FROM [CFNew].[dbo].[fc_dailyRD]) AS source
PIVOT
(	SUM(tot1)
	FOR [pt1] IN ([1-Day Walker],[2-Day Walker],[Rider]
,[Participants],[Concrete Hero],[Total Donations])
) as pvt1
GROUP BY [rundate],[evnt1]',
    @subject = 'Work Order Count',
    @attach_query_result_as_file = 1;