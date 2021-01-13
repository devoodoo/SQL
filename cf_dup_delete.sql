 

WITH DUP AS (SELECT [rundate],[tr_id],[evnt],[edate],[part_cnt],[part_type],[bracket0],[bracket1],[bracket2],[bracket3],[bracket4],[bracket5],[bracket6],[bracket7],[bracket8],

ROW_NUMBER() OVER (PARTITION BY [rundate],[tr_id],[evnt],[edate],[part_cnt],[part_type],[bracket0],[bracket1],[bracket2],[bracket3],[bracket4],[bracket5],[bracket6],[bracket7],[bracket8]

ORDER BY [rundate],[tr_id],[evnt],[edate],[part_cnt],[part_type],[bracket0],[bracket1],[bracket2],[bracket3],[bracket4],[bracket5],[bracket6],[bracket7],[bracket8]) AS ROWCNT

FROM [CFNew].[dbo].[fc_previous])

DELETE DUP WHERE ROWCNT > 1

 

 

WITH DUP AS (SELECT [rundate],[instance],[fr_id],[evnt],[part_type],[num],

ROW_NUMBER() OVER (PARTITION BY [rundate],[instance],[fr_id],[evnt],[part_type],[num]

ORDER BY [rundate],[instance],[fr_id],[evnt],[part_type],[num]) AS ROWCNT

FROM [CFNew].[dbo].[fc_rtkoi])

DELETE DUP WHERE ROWCNT > 1
