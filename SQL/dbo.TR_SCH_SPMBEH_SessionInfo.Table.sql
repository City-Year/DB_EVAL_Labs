USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[TR_SCH_SPMBEH_SessionInfo]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TR_SCH_SPMBEH_SessionInfo](
	[program_description] [varchar](80) NULL,
	[cych_accnt_sf_id] [varchar](20) NULL,
	[Section_Primary_Staff] [varchar](80) NULL,
	[Section_Primary_Staff_ID] [varchar](18) NULL,
	[Business_Unit] [varchar](255) NULL,
	[Student_School_Name] [varchar](1300) NULL,
	[TOTALSTUDENTS] [int] NULL,
	[TOTALSESSIONS6WK] [int] NULL,
	[TOTALSTUDENTS6WK] [int] NULL,
	[AVGSessionDosage6wks] [decimal](38, 6) NULL,
	[STUDENTSPERSESSION6wks] [int] NULL,
	[EXPECTED_SESSIONS] [int] NULL
) ON [Team]

GO
