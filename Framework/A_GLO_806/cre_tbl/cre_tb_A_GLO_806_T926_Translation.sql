USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T926_Translation'
and type = 'U')
drop table [glo].A_GLO_806_T926_Translation
go

CREATE TABLE [glo].[A_GLO_806_T926_Translation](
	[Translation_KEY] [int] NOT NULL,
	[Message_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T925_Message](Message_KEY),
	[Language_FK] [int] NOT NULL,
	[TextType] [varchar](32) NOT NULL,
	[TextShort] [varchar](32) NOT NULL,
	[TextMedium] [varchar](128) NOT NULL,
	[TextLong] [varchar](512) NOT NULL,	
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Translation_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

