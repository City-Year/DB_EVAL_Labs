USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[MIR_P3_AC_Met_Not_Met]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIR_P3_AC_Met_Not_Met](
	[GRANTSITENUM] [varchar](250) NULL,
	[GRANTSITE] [varchar](250) NULL,
	[ACMEASURE] [nvarchar](128) NULL,
	[ACMEASURESTATUS] [int] NULL
) ON [PRIMARY]

GO
