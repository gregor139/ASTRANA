USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T915_Screen'
and type = 'U')
drop table [glo].A_GLO_806_T915_Screen
go

CREATE TABLE [glo].[A_GLO_806_T915_Screen](
	[Screen_KEY] [int] NOT NULL,
	[Area_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T911_Area](Area_KEY),
	[Message_FK] [int] NOT NULL,
	[ScreenVersion] [int] NOT NULL,
	[ScreenNumber] [int] NOT NULL,
	[ScreenName] [varchar](128) NOT NULL,
	[ScreenType] [varchar](16) NOT NULL,
	[ScreenKind] [varchar](16) NOT NULL,
	[ScreenDescription] [varchar](256) NOT NULL,
	[ValidFrom_DT] [DATE] NOT NULL,
	[ValidTo_DT] [DATE] NOT NULL,
	[IsEnabled] [BIT] NOT NULL,
	[AllowedNumberOfErrors] [int] NOT NULL,
	[Layer] [CHAR](1) NOT NULL,
	[TaskName] VARCHAR(128) NULL,
	[ExceptionView] VARCHAR(128) NULL,
	[TableName] VARCHAR(128) NULL,
	[ColumnName] VARCHAR(128) NULL,
	[FileName] VARCHAR(128) NULL,
	[FileDelimiter] VARCHAR(4) NULL,
	[FileNumberOfDelimiter] [int] NULL,
	[FileNumberOfHeaderLines] [int] NULL,
	[IsValueMandatory] [bit] NULL,
	[DefaultValue] [VARCHAR](128) NULL,
	[FormatString] [varchar](128) NULL,
	[LowerLimit] [decimal](30,2) NULL,
	[UpperLimit] [decimal](30,2) NULL,
	[ExpectedValue] [decimal](30,2) NULL,
	[Percentage_Deviation] [int] NULL,
	[AllowedLookupTable] [varchar](128),
PRIMARY KEY CLUSTERED 
(
	[Screen_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO
