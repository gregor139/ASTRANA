USE [A_GLO_806]
GO

DELETE FROM [glo].[A_GLO_806_T915_Screen];
-- GLO
INSERT INTO [glo].[A_GLO_806_T915_Screen] (Screen_KEY,Area_FK,Message_FK,ScreenVersion,ScreenNumber,ScreenName,ScreenType,ScreenKind,ScreenDescription,ValidFrom_DT,ValidTo_DT,IsEnabled,AllowedNumberOfErrors,Layer,TaskName,ExceptionView,TableName,ColumnName,FileName,FileDelimiter,FileNumberOfDelimiter,FileNumberOfHeaderLines,IsValueMandatory,DefaultValue,FormatString,LowerLimit,UpperLimit,ExpectedValue,Percentage_Deviation,AllowedLookupTable)
VALUES (1000,1,8,1,1000,'UNDEFINED','GENERIC','TECHNICAL','Undefined error',cast('01/01/1900' as DATE),cast('12/31/9999' as DATE),1,0,'A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- VU
INSERT INTO [glo].[A_GLO_806_T915_Screen] (Screen_KEY,Area_FK,Message_FK,ScreenVersion,ScreenNumber,ScreenName,ScreenType,ScreenKind,ScreenDescription,ValidFrom_DT,ValidTo_DT,IsEnabled,AllowedNumberOfErrors,Layer,TaskName,ExceptionView,TableName,ColumnName,FileName,FileDelimiter,FileNumberOfDelimiter,FileNumberOfHeaderLines,IsValueMandatory,DefaultValue,FormatString,LowerLimit,UpperLimit,ExpectedValue,Percentage_Deviation,AllowedLookupTable)
VALUES (2000,2,8,1,2000,'UNDEFINED','GENERIC','TECHNICAL','Undefined error',cast('01/01/1900' as DATE),cast('12/31/9999' as DATE),1,0,'A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- IVZ
INSERT INTO [glo].[A_GLO_806_T915_Screen] (Screen_KEY,Area_FK,Message_FK,ScreenVersion,ScreenNumber,ScreenName,ScreenType,ScreenKind,ScreenDescription,ValidFrom_DT,ValidTo_DT,IsEnabled,AllowedNumberOfErrors,Layer,TaskName,ExceptionView,TableName,ColumnName,FileName,FileDelimiter,FileNumberOfDelimiter,FileNumberOfHeaderLines,IsValueMandatory,DefaultValue,FormatString,LowerLimit,UpperLimit,ExpectedValue,Percentage_Deviation,AllowedLookupTable)
VALUES (3000,3,8,1,3000,'UNDEFINED','GENERIC','TECHNICAL','Undefined error',cast('01/01/1900' as DATE),cast('12/31/9999' as DATE),1,0,'A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



