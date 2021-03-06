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
delete from [dbo].[DIM_DATUM]

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
	
	INSERT INTO [dbo].[DIM_DATUM]
	(
	[DATUM_KEY],
	[DATUM_DATE],
	[TAG_NR],
	[TAG_NR_MONAT],
	[WOCHENTAG_DE_KURZ_BEZ],
--	[WOCHENTAG_FR_KURZ_BEZ],
--	[WOCHENTAG_IT_KURZ_BEZ],
--	[WOCHENTAG_EN_KURZ_BEZ],
	[WOCHENTAG_DE_BEZ],
--	[WOCHENTAG_FR_BEZ],
--	[WOCHENTAG_IT_BEZ],
--	[WOCHENTAG_EN_BEZ],
	[WOCHENTAG_NR],
	[WERKTAG_MO_FR_MM],
	[WERKTAG_DI_DO_MM],
	[WOCHE_NR],
	[WOCHE_NR_MONAT],
	[MONAT_NR],
	[MONAT_DE_BEZ],
	[BEGINN_MONAT], 
	[ENDE_MONAT],
	[QUARTAL_NR],
	[QUARTAL_BEZ],
	[SEMESTER_NR],
	[JAHR_NR],
	[INS_DTM]
	)
	SELECT		
		CONVERT (char(8),@CurrentDate,112) as DATUM_KEY,
		@CurrentDate AS DATUM_DATE,
		DATEPART(DY, @CurrentDate) AS TAG_NR,
		DATEPART(DD, @CurrentDate) AS TAG_NR_MONAT,
		UPPER(SUBSTRING(DATENAME(DW, @CurrentDate),1,2)) AS WOCHENTAG_DE_KURZ_BEZ,
		DATENAME(DW, @CurrentDate) AS WOCHENTAG_DE_BEZ,
		-- check for day of week as Per US and change it as per UK format 
		DATEPART(DW, @CurrentDate) AS WOCHENTAG_NR,
		CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 1
			WHEN 2 THEN 1
			WHEN 3 THEN 1
			WHEN 4 THEN 1
			WHEN 5 THEN 1
			WHEN 6 THEN 0
			WHEN 7 THEN 0
		END AS WERKTAG_MO_FR_MM,
		CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 0
			WHEN 2 THEN 1
			WHEN 3 THEN 1
			WHEN 4 THEN 1
			WHEN 5 THEN 0
			WHEN 6 THEN 0
			WHEN 7 THEN 0
		END AS WERKTAG_DI_DO_MM,
		@DayOfWeekInYear AS WOCHE_NR,
		@DayOfWeekInMonth AS WOCHE_NR_MONAT,
		DATEPART(MM, @CurrentDate) AS MONAT_NR,
		DATENAME(MM, @CurrentDate) AS MONAT_DE_BEZ,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, 
		@CurrentDate) - 1), @CurrentDate))) AS BEGINN_MONAT,
		
		case when DATEPART(YEAR, @CurrentDate)=9999 then @DoomsDate
		else
		  CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, 
		  (DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, 
		  @CurrentDate))))
		end as ENDE_MONAT,
		DATEPART(QQ, @CurrentDate) AS QUARTAL_NR,
		CASE DATEPART(QQ, @CurrentDate)
			WHEN 1 THEN 'Q1-' + CAST(DATEPART(YEAR, @CurrentDate) AS VARCHAR)
			WHEN 2 THEN 'Q2-' + CAST(DATEPART(YEAR, @CurrentDate) AS VARCHAR)
			WHEN 3 THEN 'Q3-' + CAST(DATEPART(YEAR, @CurrentDate) AS VARCHAR)
			WHEN 4 THEN 'Q4-' + CAST(DATEPART(YEAR, @CurrentDate) AS VARCHAR)
			END AS QUARTAL_BEZ,
		CASE
			WHEN DATEPART(MM, @CurrentDate) <= 6 THEN '1'
			ELSE '2'
		END AS SEMESTER_NR,
		DATEPART(YEAR, @CurrentDate) AS JAHR_NR,
		CURRENT_TIMESTAMP
		
END

--Specify the language
SET LANGUAGE FRENCH
UPDATE [dbo].[DIM_DATUM]
SET WOCHENTAG_FR_KURZ_BEZ = UPPER(SUBSTRING(DATENAME(DW, DATUM_DATE),1,3))
,   WOCHENTAG_FR_BEZ = UPPER(SUBSTRING(DATENAME(DW, DATUM_DATE),1,1)) + SUBSTRING(DATENAME(DW, DATUM_DATE), 2,100)
,   MONAT_FR_BEZ =     UPPER(SUBSTRING(DATENAME(MM, DATUM_DATE),1,1)) + SUBSTRING(DATENAME(MM, DATUM_DATE), 2,100)

--Specify the language
SET LANGUAGE ITALIAN
UPDATE [dbo].[DIM_DATUM]
SET WOCHENTAG_IT_KURZ_BEZ = UPPER(SUBSTRING(DATENAME(DW, DATUM_DATE),1,3))
,   WOCHENTAG_IT_BEZ = UPPER(SUBSTRING(DATENAME(DW, DATUM_DATE),1,1)) + SUBSTRING(DATENAME(DW, DATUM_DATE), 2,100)
,   MONAT_IT_BEZ = UPPER(SUBSTRING(DATENAME(MM, DATUM_DATE),1,1)) + SUBSTRING(DATENAME(MM, DATUM_DATE), 2,100)

--Specify the language
SET LANGUAGE ENGLISH
UPDATE [dbo].[DIM_DATUM]
SET WOCHENTAG_EN_KURZ_BEZ = UPPER(SUBSTRING(DATENAME(DW, DATUM_DATE),1,3))
,   WOCHENTAG_EN_BEZ = UPPER(SUBSTRING(DATENAME(DW, DATUM_DATE),1,1)) + SUBSTRING(DATENAME(DW, DATUM_DATE), 2,100)
,   MONAT_EN_BEZ = UPPER(SUBSTRING(DATENAME(MM, DATUM_DATE),1,1)) + SUBSTRING(DATENAME(MM, DATUM_DATE), 2,100)

-- Specify the static public holidays: Neujahrstag, Nationalfeiertag, Weihnachten, Stephanstag, Silvester:
UPDATE [dbo].[DIM_DATUM]
SET feiertag_mm=1
WHERE substring(cast(datum_key as varchar(8)), 5, 4) in ('0101','0801','1225','1226','1231');

-- Specify the floating public holidays according to feiertage-schweiz.ch
UPDATE [dbo].[DIM_DATUM]
SET feiertag_mm=1
WHERE datum_key in (
--Karfreit., Osterson., Ostermon., Auffahrt,    Pfingstso., Pfingstmontag
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

/*****************************************************************************************/

SELECT * FROM [dbo].[DIM_DATUM]
ORDER BY datum_key DESC

