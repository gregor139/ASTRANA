USE [A_GLO_806]
GO

if exists (select 1
from sysobjects
where name = 'A_GLO_806_T912_Mandant'
and type = 'U')
drop table [glo].A_GLO_806_T912_Mandant
go

CREATE TABLE [glo].[A_GLO_806_T912_Mandant](
	[Mandant_KEY] [int] NOT NULL,
	[Area_FK] [int] NOT NULL FOREIGN KEY REFERENCES [glo].[A_GLO_806_T911_Area](Area_KEY),
	[MandantNr] [int] NOT NULL,
	[MandantName] [varchar](2) NOT NULL,
	[MandantDescription] [varchar](30) NOT NULL,
	[DWH_INS_Audit_DT] [datetime] NOT NULL,
	[DWH_UPD_Audit_DT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mandant_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data_FG1]
) ON [Data_FG1]

GO

