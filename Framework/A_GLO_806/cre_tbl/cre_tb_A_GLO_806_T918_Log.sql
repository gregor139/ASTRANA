USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T918_Log'
and type = 'U')
drop table [glo].A_GLO_806_T918_Log
go

CREATE TABLE [glo].[A_GLO_806_T918_Log](
	[Log_KEY] [int] NOT NULL,
	[Task_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T914_Task](Task_KEY),
	[LogType] [varchar](7) NOT NULL,
	[LogMessage] [varchar](200) NOT NULL,
	[sysssislogID] [int] NULL,
	[DWH_INS_Audit_ID] [int] NOT NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Log_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

