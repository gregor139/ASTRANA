USE [A_GLO_806];


/********************************************************************************************/

-- Define first language
SET LANGUAGE GERMAN

-- Specify monday as first weekday
SET DATEFIRST 1

--Specify Start Date and End date here
--Value of Start Date must be less than your End Date 

DECLARE @StartDate DATETIME = '01/01/1990' --Starting value of Date Range
DECLARE @EndDate DATETIME = '31/12/2047' --End Value of Date Range
DECLARE @DoomsDate DATETIME ='31/12/9999' -- End of time
DECLARE @CurrentDate AS DATETIME

--Temporary Variables to hold the values during processing of each date of year
DECLARE
    @DayOfWeekInMonth INT,
    @DayOfWeekInYear INT,
    @DayOfQuarter INT,
    @WeekOfMonth INT,
    @CurrentYear INT,
    @CurrentMonth INT,
    @CurrentQuarter INT

/*Table Data type to store the day of week count for the month and year*/
DECLARE @DayOfWeek TABLE (DOW INT, MonthCount INT, QuarterCount INT, YearCount INT)

INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)

--Extract and assign various parts of Values from Current Date to Variable
SET @CurrentDate = @StartDate - 1
SET @EndDate = @EndDate - 1
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

-- Empty target table
delete from [glo].[A_GLO_806_T919_Date]

/********************************************************************************************/
--Proceed only if Start Date(Current date ) is less than End date you specified above

WHILE @CurrentDate <= @EndDate + 1
BEGIN
    IF @CurrentDate = @EndDate + 1
    BEGIN
      SET @CurrentDate = @DoomsDate
      --SET @CurrentDate = '31/12/9999'
    END
    ELSE
    BEGIN
        SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
    END
 
/*Begin day of week logic*/

         /*Check for Change in Month of the Current date if Month changed then 
          Change variable value*/
    IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
    BEGIN
        UPDATE @DayOfWeek
        SET MonthCount = 0
        SET @CurrentMonth = DATEPART(MM, @CurrentDate)
    END

        /* Check for Change in Quarter of the Current date if Quarter changed then change 
         Variable value*/

    IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
    BEGIN
        UPDATE @DayOfWeek
        SET QuarterCount = 0
        SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
    END
       
        /* Check for Change in Year of the Current date if Year changed then change 
         Variable value*/
    

    IF @CurrentYear != DATEPART(YY, @CurrentDate)
    BEGIN
        UPDATE @DayOfWeek
        SET YearCount = 0
        SET @CurrentYear = DATEPART(YY, @CurrentDate)
    END
    
        -- Set values in table data type created above from variables 

    UPDATE @DayOfWeek
    SET 
        MonthCount = MonthCount + 1,
        QuarterCount = QuarterCount + 1,
        YearCount = YearCount + 1
    WHERE DOW = DATEPART(DW, @CurrentDate)

    SELECT
        @DayOfWeekInMonth = MonthCount,
        @DayOfQuarter = QuarterCount,
        @DayOfWeekInYear = YearCount
    FROM @DayOfWeek
    WHERE DOW = DATEPART(DW, @CurrentDate)
/*End day of week logic*/


/* Populate Your Dimension Table with values*/
    INSERT INTO [glo].[A_GLO_806_T919_Date]
    (
    Date_Key,
    Jahr,
    Quartal,
    MonatNr,
    MonatName,
    WocheNr,
    WochentagName,
    Datum,
    TagImJahr,
    TagImQuartal,
    TagImMonat,
    TagInWoche,
    WochentagArt,
    Feiertag_CH_J_N,
    Sprache,
    DWH_INS_AUDIT_DT,
    DWH_INS_AUDIT_ID,
    DWH_UPD_AUDIT_DT,
    DWH_UPD_AUDIT_ID
    )
    SELECT      
        CONVERT (char(8),@CurrentDate,112) as Date_Key,
        DATEPART(YEAR, @CurrentDate) AS Jahr,
        DATEPART(QQ, @CurrentDate) AS Quartal,
        DATEPART(MM, @CurrentDate) AS MonatNr,
        DATENAME(MM, @CurrentDate) AS MonatName,
        @DayOfWeekInYear AS WocheNr,
        DATENAME(DW, @CurrentDate) AS WochentagName,
        @CurrentDate AS Datum,
        DATEPART(DY, @CurrentDate) AS TagImJahr,
        DATEDIFF(D, DATEADD(qq,DATEDIFF(QQ, 0, @CurrentDate), 0), @CurrentDate) + 1 AS TagImQuartal,
        DATEPART(DD, @CurrentDate) AS TagImMonat,
        DATEPART(DW, @CurrentDate) AS TagInWoche,
        CASE WHEN DATEPART(DW, @CurrentDate) IN (6,7) THEN 'Wochenende' ELSE 'Werktag' END  AS WochentagArt,
        0    AS Feiertag_CH_J_N,
        'DE' AS Sprache,
        CURRENT_TIMESTAMP AS DWH_INS_AUDIT_DT,
        -1 AS DWH_INS_AUDIT_ID,
        NULL AS DWH_UPD_AUDIT_DT,
        NULL AS DWH_UPD_AUDIT_ID
END


-- Specify the static public holidays: NeuJahrstag, Nationalfeiertag, Wei-hnachten, Stephanstag, Silvester:
UPDATE [glo].[A_GLO_806_T919_Date]
SET Feiertag_CH_J_N=1
WHERE substring(cast(Date_Key as varchar(8)), 5, 4) in ('0101','0801','1225','1226','1231');

-- Specify the floating public holidays according to feiertage-schweiz.ch
UPDATE [glo].[A_GLO_806_T919_Date]
SET Feiertag_CH_J_N=1
WHERE Date_Key in (
--Karfreit., Osterson., Ostermon., Auffahrt, Pfingstso., Pfingstmontag
20180330, 20180401, 20180402, 20180510, 20180520, 20180521,
20190419, 20190421, 20190422, 20190530, 20190609, 20190610,
20200410, 20200412, 20200413, 20200521, 20200531, 20200601,
20210326, 20210328, 20210329, 20210506, 20210516, 20210517,
20220415, 20220417, 20220418, 20220526, 20220605, 20220606,
20230407, 20230409, 20230410, 20230518, 20230528, 20230529,
20240329, 20240331, 20240401, 20240509, 20240519, 20240520,
20250411, 20250413, 20250414, 20250522, 20250601, 20250602,
20260403, 20260405, 20260406, 20260514, 20260524, 20260525,
20270326, 20270328, 20270329, 20270506, 20270516, 20270517,
20280414, 20280416, 20280417, 20280525, 20280604, 20280605,
20290330, 20290401, 20290402, 20290510, 20290520, 20290521,
20300419, 20300421, 20300422, 20300530, 20300609, 20300610,
20310411, 20310413, 20310414, 20310522, 20310601, 20310602,
20320326, 20320328, 20320329, 20320506, 20320516, 20320517,
20330415, 20330417, 20330418, 20330526, 20330605, 20330606,
20340407, 20340409, 20340410, 20340518, 20340528, 20340529,
20350323, 20350325, 20350326, 20350503, 20350513, 20350514,
20360411, 20360413, 20360414, 20360522, 20360601, 20360602,
20370403, 20370405, 20370406, 20370514, 20370524, 20370525
);
