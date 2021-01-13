DECLARE @mydate DATETIME
SELECT @mydate = GETDATE()
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@mydate)),@mydate),101) AS Date_Value,
'Last Day of Previous Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@mydate)-1),@mydate),101) AS Date_Value,
'First Day of Current Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),@mydate,101) AS Date_Value, 'Today'  AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@mydate))),DATEADD(mm,1,@mydate)),101) AS Date_Value,
'Last Day of Current Month' AS Date_Type
UNION
SELECT CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@mydate))-1),DATEADD(mm,1,@mydate)),101) AS Date_Value,
'First Day of Next Month' AS Date_Type
GO