BEGIN TRY
	DROP TABLE [dbo].[DIM_DATUM]
END TRY

BEGIN CATCH
	/*No Action*/
END CATCH

/**********************************************************************************/

CREATE TABLE	[dbo].[DIM_DATUM]
	(	[DATUM_KEY] INT PRIMARY KEY, 
		[DATUM_DATE] DATE,
		[TAG_NR] INT,
		[TAG_NR_MONAT] VARCHAR(2), -- Field will hold day number of Month
		[WOCHENTAG_DE_KURZ_BEZ] VARCHAR(3), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_FR_KURZ_BEZ] VARCHAR(3), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_IT_KURZ_BEZ] VARCHAR(3), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_EN_KURZ_BEZ] VARCHAR(3), -- Contains name of the day, Sunday, Monday
		[WOCHENTAG_DE_BEZ] VARCHAR(10), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_FR_BEZ] VARCHAR(10), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_IT_BEZ] VARCHAR(10), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_EN_BEZ] VARCHAR(10), -- Contains name of the day, Sunday, Monday 
		[WOCHENTAG_NR] CHAR(1),-- First Day Monday=1 and Sunday=7
		[WERKTAG_MO_FR_MM] BIT,
		[WERKTAG_DI_DO_MM] BIT,
		[FEIERTAG_MM] BIT,
		[WOCHE_NR] VARCHAR(2),
		[WOCHE_NR_MONAT] VARCHAR(2), --1st Monday or 2nd Monday in Month
		[MONAT_NR] VARCHAR(2), --Number of the Month 1 to 12
		[MONAT_DE_BEZ] VARCHAR(9),--January, February etc
		[MONAT_FR_BEZ] VARCHAR(9),
		[MONAT_IT_BEZ] VARCHAR(9),
		[MONAT_EN_BEZ] VARCHAR(9),
		[BEGINN_MONAT] DATE,
		[ENDE_MONAT] DATE,
		[QUARTAL_NR] CHAR(1),
		[QUARTAL_BEZ] VARCHAR(7),--First,Second..
		[SEMESTER_NR] INT,
		[JAHR_NR] CHAR(4), -- Year value of Date stored in Row
		[INS_DTM] DATETIME,
		[UPD_DTM] DATETIME
	)
GO