USE [A_GLO_806]
GO

CREATE PROCEDURE glo.A_GLO_806_SP904_DWH_LogErrorEvent @AreaName varchar(30), @ScreenName varchar(128), @TaskName varchar(128), @ErrorCode integer, @ErrorText varchar(256), @sysssislogID integer
AS

/*
----------------------------------------------------------------------------
-- Object Name: dbo.spINSERT_dbo_Customer
-- Project: Sample code
-- Business Process: Sample code
-- Purpose: Insert a record into a table
-- Detailed Description: Insert a record into the dbo.Customer table
-- Database: Test
-- Dependent Objects: None
-- Called By: Ad-hoc
-- Upstream Systems: N\A
-- Downstream Systems: N\A
-- 
--------------------------------------------------------------------------------------
-- Rev | CMR | Date Modified | Developer  | Change Summary
--------------------------------------------------------------------------------------
-- 001 | N\A | 09.15.2011 | JKadlec | Original code
--
*/

SET NOCOUNT ON

-- 1 - Declare variables
DECLARE @Date_FK integer;
DECLARE @Area_FK integer;
DECLARE @Screen_FK integer;
DECLARE @Task_FK integer;

-- 2 - Initialize variables
SET @Date_FK = 
(
  SELECT Date_KEY 
  FROM  [glo].[A_GLO_806_T919_Date]
  WHERE cast(Datum as date) = cast(getDate() as date)
) 

SET @Area_FK = 
(
  SELECT Area_KEY 
  FROM  [glo].[A_GLO_806_T911_Area]
  WHERE AreaName = @AreaName
) 

SET @Screen_FK = 
(
  SELECT Screen_KEY 
  FROM  [glo].[A_GLO_806_T915_Screen]
  WHERE ScreenName = @ScreenName
) 

SET @Task_FK = 
(
  SELECT Task_KEY 
  FROM  [glo].[A_GLO_806_T914_Task]
  WHERE TaskName = @TaskName
) 

-- 3 - Execute INSERT command
INSERT INTO [glo].[A_GLO_806_T916_ErrorEvent]
           ([Date_FK]
           ,[Area_FK]
           ,[Task_FK]
           ,[Screen_FK]
           ,[sysssislogID]
           ,[ErrorCode]
		   ,[ErrorText]
		   ,[NumberOfErrorDetails]
		   ,[DWH_INS_Audit_ID]
		   ,[DWH_UPD_Audit_DT]
		   )
     VALUES
           (@Date_FK
           ,@Area_FK
		   ,@Screen_FK
           ,@Task_FK
		   ,@sysssislogID
		   ,@ErrorCode
           ,@ErrorText
		   ,NULL
           ,getDate()
           ,NULL)
GO
