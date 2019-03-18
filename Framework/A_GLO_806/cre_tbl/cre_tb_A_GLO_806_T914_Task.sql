USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T914_Task'
and type = 'U')
drop table [glo].A_GLO_806_T914_Task
go

CREATE TABLE [glo].[A_GLO_806_T914_Task](
	[Task_KEY] [int] NOT NULL,
	[Job_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T913_Job](Job_KEY),
	[TaskName] [varchar](128) NOT NULL,
	[TaskStatus] [int] NOT NULL,
	[Start_DT] [datetime] NOT NULL,
	[End_DT] [datetime] NULL,
	[NumberOfRowsProcessed] [int] NOT NULL default -1,
	[NumberOfScreens] [int] NOT NULL default -1,
	[NumberOfErrorEvents] [int] NOT NULL default -1,
PRIMARY KEY CLUSTERED 
(
	[Task_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO


