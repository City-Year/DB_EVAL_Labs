USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[fy15eladefs]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fy15eladefs](
	[Site] [nvarchar](255) NULL,
	[skill_description] [nvarchar](255) NULL,
	[Grade_range_min] [float] NULL,
	[grade_range_min1] [float] NULL,
	[Points] [float] NULL,
	[Performance_Levels] [nvarchar](255) NULL,
	[Use_FY16_Def] [float] NULL,
	[MAPEXPGROWTH] [float] NULL,
	[SRIEXPGROWTH] [nvarchar](255) NULL,
	[GeneralExpGrowth] [nvarchar](255) NULL,
	[End_Score] [nvarchar](255) NULL
) ON [PRIMARY]

GO
