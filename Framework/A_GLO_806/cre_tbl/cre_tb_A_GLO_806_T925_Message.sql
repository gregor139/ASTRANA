USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T925_Message'
and type = 'U')
drop table [glo].A_GLO_806_T925_Message
go

CREATE TABLE [glo].[A_GLO_806_T925_Message](
	[Message_KEY] [int] NOT NULL,
	[MailGroup_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T924_MailGroup](MailGroup_KEY),
	[Area_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T911_Area](Area_KEY),
	[MessageCode] [varchar](64) NOT NULL,
	[MessageType] [varchar](32) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Message_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

