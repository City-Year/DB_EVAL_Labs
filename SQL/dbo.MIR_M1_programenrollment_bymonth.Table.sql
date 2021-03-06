USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[MIR_M1_programenrollment_bymonth]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIR_M1_programenrollment_bymonth](
	[STUDENT_ID] [int] NULL,
	[PROG_DESC] [varchar](80) NULL,
	[INDICATOR_AREA_DESC] [varchar](255) NULL,
	[ENROLLED_DAYS] [int] NULL,
	[FIRST_INTERVENTION] [datetime] NULL,
	[minfirst_intervention_mmyyyy] [nvarchar](4000) NULL,
	[LAST_INTERVENTION] [datetime] NULL,
	[FIRST_INTERVENTION_MONTH] [int] NULL,
	[FISCAL_YEAR] [varchar](1300) NULL,
	[SITE_NAME] [varchar](1300) NULL,
	[SCHOOL_NAME] [varchar](1300) NULL,
	[CYSCHOOLHOUSE_STUDENT_ID] [varchar](100) NULL,
	[StudentName] [varchar](80) NULL
) ON [PRIMARY]

GO
