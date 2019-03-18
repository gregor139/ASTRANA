USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T920_ObjectsOfArea'
and type = 'U')
drop table [glo].A_GLO_806_T920_ObjectsOfArea
go

CREATE TABLE [glo].[A_GLO_806_T920_ObjectsOfArea](
	[Object_KEY] [int] NOT NULL,
	[Area_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T911_Area](Area_KEY),
	[DatabaseName] [varchar](128) NOT NULL,
	[SchemaName] [varchar](128) NOT NULL,
	[ObjectName] [varchar](128) NOT NULL,
	[ObjectType] [char](1) NOT NULL,
	[LayerCode] [char](1) NOT NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Object_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

