USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[LITassess]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LITassess](
	[ELA_PRIMARY_CM_EMAIL] [varchar](100) NULL,
	[ELA_PRIMARY_CM_NAME] [varchar](50) NULL,
	[REGION_NAME] [varchar](100) NULL,
	[site_name] [varchar](100) NULL,
	[school_name] [varchar](100) NULL,
	[LIT2] [int] NULL,
	[LITmet] [int] NULL,
	[LITPrctMet] [numeric](27, 13) NULL
) ON [PRIMARY]

GO
