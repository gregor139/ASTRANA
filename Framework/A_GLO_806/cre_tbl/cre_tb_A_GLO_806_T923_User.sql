USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T923_User'
and type = 'U')
drop table [glo].A_GLO_806_T923_User
go

CREATE TABLE [glo].[A_GLO_806_T923_User](
	[User_KEY] [int] NOT NULL,
	[Language_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T921_Language](Language_KEY),
	[UserName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

