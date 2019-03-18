USE [SANDBOX]
GO

/****** Object:  Table [dbo].[E_GLO_806_T904_MESSAGE]    Script Date: 2/14/2018 12:46:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[E_GLO_806_T904_MESSAGE](
	[MESSAGE_KEY] [int] NOT NULL,
	[MAILGROUP_FK] [int] NOT NULL,
	[DOMAIN_FK] [int] NOT NULL,
	[NAME] [varchar](10) NOT NULL,
	[TYPE] [varchar](10) NOT NULL,
	[ENABLED] [int] NOT NULL,
	[DWH_INS_AUDIT_ID] [int] NULL,
	[DWH_INS_AUDIT_DATETIME] [datetime] NULL,
 CONSTRAINT [MESSAGE_PK] PRIMARY KEY CLUSTERED 
(
	[MESSAGE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
