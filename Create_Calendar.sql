CREATE TABLE CFScott.dbo.Calendar  
(  
    dt SMALLDATETIME NOT NULL 
        PRIMARY KEY CLUSTERED,  
     
    isWeekday BIT, 
    isHoliday BIT,  
    Y SMALLINT,  
    FY SMALLINT,  
    Q TINYINT,  
    M TINYINT,  
    D TINYINT,  
    DW TINYINT, 
    monthname VARCHAR(9), 
    dayname VARCHAR(9), 
    W TINYINT 
) 
GO


SET NOCOUNT ON 
DECLARE @dt SMALLDATETIME 
SET @dt = '20000101' 
WHILE @dt < '20300101' 
BEGIN 
    INSERT CFScott.dbo.Calendar(dt) SELECT @dt 
    SET @dt = @dt + 1 
END
GO

INSERT CFScott.dbo.Calendar(dt) 
    SELECT DATEADD(DAY, Number, '20000101') 
        FROM dbo.Numbers 
        WHERE Number <= 10957 
        ORDER BY Number


UPDATE CFScott.dbo.Calendar SET 
 
    isWeekday = CASE  
        WHEN DATEPART(DW, dt) IN (1,7)  
        THEN 0 
        ELSE 1 END, 
 
    isHoliday = 0, 
 
    Y = YEAR(dt),  
 
    FY = YEAR(dt), 
 
    /* 
    -- if our fiscal year 
    -- starts on May 1st: 
 
    FY = CASE  
        WHEN MONTH(dt) < 5 
        THEN YEAR(dt)-1  
        ELSE YEAR(dt) END, 
    */ 
 
    Q = CASE 
        WHEN MONTH(dt) <= 3 THEN 1 
        WHEN MONTH(dt) <= 6 THEN 2 
        WHEN MONTH(dt) <= 9 THEN 3 
        ELSE 4 END,
 
    M = MONTH(dt),
 
    D = DAY(dt),
 
    DW = DATEPART(DW, dt),
 
    monthname = DATENAME(MONTH, dt),  
 
    dayname = DATENAME(DW, dt),  
 
    W = DATEPART(WK, dt)


SET NOCOUNT ON 
DECLARE @dt SMALLDATETIME 
DECLARE @offset TINYINT 
SET @offset = 5 
 
DECLARE c CURSOR 
    LOCAL STATIC READ_ONLY FOR  
    SELECT dt FROM CFScott.dbo.Calendar ORDER BY dt 
 
OPEN c 
 
FETCH NEXT FROM c INTO @dt 
 
WHILE @@FETCH_STATUS = 0 
BEGIN 
    IF DATENAME(dw, @dt)='Sunday' 
        AND DATEPART(DAY, @dt) <= 7 
        AND DATENAME(MONTH, @dt) = 'April' 
         
        SET @offset = 4 
 
    IF DATENAME(dw, @dt)='Sunday' 
        AND DATEPART(DAY, @dt) >= 25 
        AND DATENAME(MONTH, @dt) = 'October' 
         
        SET @offset = 5 
 
    UPDATE dbo.Calendar SET UTCOffset = @offset WHERE dt = @dt 
 
    FETCH NEXT FROM c INTO @dt 
END 
 
CLOSE c 
DEALLOCATE c 
 
GO


CREATE FUNCTION dbo.ISOWeek 
( 
    @dt SMALLDATETIME 
) 
RETURNS TINYINT 
AS 
BEGIN 
    DECLARE @ISOweek TINYINT 
 
    SET @ISOweek = DATEPART(WEEK,@dt)+1 
        -DATEPART(WEEK,RTRIM(YEAR(@dt))+'0104') 
 
    IF @ISOweek = 0 
    BEGIN 
        SET @ISOweek = dbo.ISOweek 
        ( 
            RTRIM(YEAR(@dt)-1)+'12'+RTRIM(24+DAY(@dt)) 
        ) + 1 
    END 
 
    IF MONTH(@dt) = 12 AND DAY(@dt)-DATEPART(DW,@dt) >= 28 
    BEGIN 
        SET @ISOweek=1 
    END 
 
    RETURN(@ISOweek) 
END 
GO


ALTER TABLE CFScott.dbo.Calendar ADD HolidayDescription VARCHAR(32)


-- New Year's Day - easy 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'New Years Day' 
    WHERE M = 1 
    AND D = 1 
 
-- Memorial Day - last Monday in May 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'Memorial Day' 
    FROM CFScott.dbo.Calendar c1 
    WHERE M = 5 
    AND DW = 2 
    AND NOT EXISTS (SELECT 1 FROM CFScott.dbo.Calendar c2 
        WHERE M = 5 AND DW = 2 
        AND c2.Y = c1.Y 
        AND c2.dt > c1.dt) 
 
-- Labor Day - first Monday in September 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'Labor Day' 
    FROM CFScott.dbo.Calendar c1 
    WHERE M = 9 
    AND DW = 2 
    AND NOT EXISTS (SELECT 1 FROM CFScott.dbo.Calendar c2 
        WHERE M = 9 AND DW = 2 
        AND c2.Y = c1.Y 
        AND c2.dt < c1.dt) 
         
-- Thanksgiving Thursday - 4th Thursday in November 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'Thanksgiving Thursday' 
    FROM CFScott.dbo.Calendar c1 
    WHERE M = 11 
    AND DW = 5 
    AND (SELECT COUNT(*) FROM CFScott.dbo.Calendar c2 
        WHERE M = 11 AND DW = 5 
        AND c2.Y = c1.Y 
        AND c2.dt < c1.dt) = 3 
 
-- Traditionally, Thanksgiving Friday, as well 
-- as long as you haven't pre-configured any  
-- other Thursday in November to be isHoliday 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'Thanksgiving Friday' 
    FROM CFScott.dbo.Calendar c1 
    WHERE M = 11 
    AND DW = 6 
    AND EXISTS (SELECT 1 FROM CFScott.dbo.Calendar c2 
        WHERE M = 11 AND DW = 5 
        AND c2.dt = (c1.dt - 1) 
        AND c2.Y = c1.Y 
        AND isHoliday = 1) 
 
-- Veterans' Day - easy 
-- however do this AFTER Thanksgiving calculation 
-- in case it happens to fall on a Thursday 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'Veterans Day' 
    WHERE M = 11 AND D = 11 
 
-- Christmas Day - easy 
 
UPDATE CFScott.dbo.Calendar 
    SET 
        isHoliday = 1, 
        HolidayDescription = 'Christmas Day' 
    WHERE M = 12 
    AND D = 25