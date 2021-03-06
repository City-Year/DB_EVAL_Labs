USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[CMR_CM_SPMBEH_IntSkills]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_SPMBEH_IntSkills](
	[Session_Dossage] [decimal](18, 0) NULL,
	[Session_Date] [datetime] NULL,
	[Session_ID] [varchar](18) NULL,
	[Student_Name] [varchar](80) NULL,
	[Student_IA_Beh] [decimal](1, 0) NULL,
	[Section_IA] [varchar](255) NULL,
	[Program_Description] [varchar](80) NULL,
	[Session_Skills] [varchar](1300) NULL,
	[Student_Grade] [varchar](255) NULL,
	[CY_Student_ID] [varchar](100) NULL,
	[Student_School_Name] [varchar](1300) NULL,
	[cych_Accnt_SF_ID] [varchar](20) NULL,
	[Intervention_Corps_Member] [varchar](80) NULL,
	[Intervention_Corps_Member_ID] [varchar](18) NULL,
	[Student_SF_ID] [varchar](18) NULL,
	[Section_Primary_Staff] [varchar](80) NULL,
	[Section_Primary_Staff_ID] [varchar](18) NULL,
	[Business_Unit] [varchar](1300) NULL
) ON [CM]

GO
