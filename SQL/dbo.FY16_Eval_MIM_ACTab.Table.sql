USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[FY16_Eval_MIM_ACTab]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FY16_Eval_MIM_ACTab](
	[GrantCategory] [varchar](250) NULL,
	[GrantSite] [varchar](250) NULL,
	[MIN_GRADE_SERVED] [int] NULL,
	[MAX_GRADE_SERVED] [int] NULL,
	[ACREPORTLIT] [varchar](50) NULL,
	[ACREPORTMTH] [varchar](50) NULL,
	[ACREPORTATT] [varchar](50) NULL,
	[ACREPORTBEH] [varchar](50) NULL,
	[ED1_ACAD_GOAL] [varchar](50) NULL,
	[ACTUAL_ED1_ACAD] [int] NULL,
	[ACLITOFFICIALFL] [int] NULL,
	[ACMTHOFFICIALFL] [int] NULL,
	[ED2_ACAD_GOAL] [varchar](50) NULL,
	[ACTUAL_ED2_ACAD] [int] NULL,
	[ACLITMETACDOSE] [int] NULL,
	[ACMTHMETACDOSE] [int] NULL,
	[minACDOSAGEGOALLIT] [float] NULL,
	[maxACDOSAGEGOALLIT] [float] NULL,
	[minacdosagegoalmth] [float] NULL,
	[maxacdosagegoalmth] [float] NULL,
	[ED1_ENGAGE_GOAL_ATT] [varchar](50) NULL,
	[ACTUAL_ED1_ENGAGE_ATT] [int] NULL,
	[ED2_ENGAGE_GOAL_ATT] [varchar](50) NULL,
	[ACTUAL_ED2_ENGAGE_ATT] [int] NULL,
	[ED1_ENGAGE_GOAL_BEH] [varchar](50) NULL,
	[ACTUAL_ED1_ENGAGE_BEH] [int] NULL,
	[ED2_ENGAGE_GOAL_BEH] [varchar](50) NULL,
	[ACTUAL_ED2_ENGAGE_BEH] [int] NULL
) ON [PRIMARY]

GO
