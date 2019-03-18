USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T924_MailGroup'
and type = 'U')
drop table [glo].A_GLO_806_T924_MailGroup
go

CREATE TABLE [glo].[A_GLO_806_T924_MailGroup](
	[MailGroup_KEY] [int] NOT NULL,
	[MailGroupName] [varchar](128) NOT NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MailGroup_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

