USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T911_Area'
and type = 'U')
drop table [glo].A_GLO_806_T911_Area
go

CREATE TABLE [glo].[A_GLO_806_T911_Area](
	[Area_KEY] [int] NOT NULL,
	[AreaName] [varchar](30) NOT NULL,
	[AreaDescription] [varchar](100) NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Area_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

