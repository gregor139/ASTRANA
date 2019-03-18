USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T917_ErrorDetail'
and type = 'U')
drop table [glo].A_GLO_806_T917_ErrorDetail
go

CREATE TABLE [glo].[A_GLO_806_T917_ErrorDetail](
	[ErrorDetail_Key] [int] IDENTITY(1,1) NOT NULL,
	[ErrorEvent_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T916_ErrorEvent](ErrorEvent_KEY),
	[TableName] [varchar](128) NOT NULL,
	[ColumnName] [varchar](128) NOT NULL,
	[ColumnValue] [varchar](8000) NOT NULL,
	[TechnicalKey] [varchar](200) NULL,
	[BusinessKey] [varchar](200) NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NOT NULL,
 CONSTRAINT [PK_A_GLO_T917_ErrorDetail] PRIMARY KEY CLUSTERED 
(
	[ErrorDetail_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO


