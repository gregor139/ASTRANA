USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T913_Job'
and type = 'U')
drop table [glo].A_GLO_806_T913_Job
go


CREATE TABLE [glo].[A_GLO_806_T913_Job](
	[Job_KEY] [int] NOT NULL,
	[ParentJob_FK] [int] NOT NULL DEFAULT -1 FOREIGN KEY REFERENCES [glo].[A_GLO_806_T913_Job](Job_KEY),
	[Area_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T911_Area](Area_KEY),
	[Audit_ID] [int] NOT NULL,
	[JobName] [varchar](128) NOT NULL,
	[JobStatus] [int] NOT NULL,
	[Start_DT] [datetime] NOT NULL,
	[End_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Job_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO


