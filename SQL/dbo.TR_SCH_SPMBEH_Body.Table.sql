USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[TR_SCH_SPMBEH_Body]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TR_SCH_SPMBEH_Body](
	[cych_accnt_sf_id] [varchar](20) NULL,
	[BUSINESS_UNIT] [varchar](1300) NULL,
	[STUDENT_SCHOOL_NAME] [varchar](1300) NULL,
	[TEAM_NAME] [varchar](255) NULL,
	[TEAM_ID] [varchar](255) NULL
) ON [Team]

GO
