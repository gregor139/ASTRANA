USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T916_ErrorEvent'
and type = 'U')
drop table [glo].A_GLO_806_T916_ErrorEvent
go

CREATE TABLE [glo].[A_GLO_806_T916_ErrorEvent](
	[ErrorEvent_Key] [int] IDENTITY(1,1) NOT NULL,
	[Date_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T919_Date](Date_KEY),
	[Area_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T911_Area](Area_KEY),
	[Task_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T914_Task](Task_KEY),
	[Screen_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T915_Screen](Screen_KEY),
	[sysssislogID] [int] NULL,
	[ErrorCode] [int] NULL,
	[ErrorText] [varchar](256) NOT NULL,
	[NumberOfErrorDetails] [int] NOT NULL DEFAULT -1,
	[DWH_INS_Audit_ID] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
 CONSTRAINT [PK_A_GLO_T916_ErrorEvent] PRIMARY KEY CLUSTERED 
(
	[ErrorEvent_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO


