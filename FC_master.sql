/*
DROP TABLE [CFScott].[dbo].[fc_categories_test]
CREATE TABLE [CFScott].[dbo].[fc_categories_test] (
Run_Da NVARCHAR(50),Run_Date NVARCHAR(50),Event_Code NVARCHAR(50),Event_Name NVARCHAR(50),
Total_buckets smallint,bucket0 smallint,bucket1 smallint,bucket2 smallint,bucket3 smallint,
bucket4 smallint,bucket5 smallint,bucket6 smallint,bucket7 smallint,bucket8 smallint
)
*/

TRUNCATE TABLE [CFScott].[dbo].[fc_categories_test]

INSERT INTO [CFScott].[dbo].[fc_categories_test] (Run_Da,Run_Date,Event_Code,Event_Name,
Total_buckets,bucket0,bucket1,bucket2,bucket3,bucket4,bucket5,bucket6,bucket7,bucket8)
(SELECT [rundate] as Run_Da,convert(varchar(5), [rundate], 110) as Run_Date,[tr_id] as Event_Code,[evnt] as Event_Name,
SUM(isnull([bracket0],0) + isnull([bracket1],0) + isnull([bracket2],0) + isnull([bracket3],0) + isnull([bracket4],0) 
+ isnull([bracket5],0) + isnull([bracket6],0) + isnull([bracket7],0) + isnull([bracket8],0)) as Total_buckets,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket0],0) END) as bucket0,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket1],0) END) as bucket1,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket2],0) END) as bucket2,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket3],0) END) as bucket3,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket4],0) END) as bucket4,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket5],0) END) as bucket5,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket6],0) END) as bucket6,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket7],0) END) as bucket7,
SUM(CASE WHEN [part_type] is not null THEN isnull([bracket8],0) END) as bucket8
FROM [CFNew].[dbo].[fc_previous]
GROUP BY [rundate],[tr_id],[evnt])

/*
(SELECT * FROM [CFNew].[dbo].[fc_previous])

select distinct part_type from [CFNew].[dbo].[fc_previous]
*/