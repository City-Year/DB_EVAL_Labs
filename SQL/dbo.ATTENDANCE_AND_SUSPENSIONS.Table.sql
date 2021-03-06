USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[ATTENDANCE_AND_SUSPENSIONS]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATTENDANCE_AND_SUSPENSIONS](
	[student_sf_id] [varchar](250) NULL,
	[cych_Accnt_SF_ID] [varchar](250) NULL,
	[Student] [varchar](250) NULL,
	[Section_Primary_Staff] [varchar](250) NULL,
	[Section_Primary_Staff_ID] [varchar](250) NULL,
	[Assessment_Name_ATT] [varchar](250) NULL,
	[Average_Daily_Attendance] [varchar](250) NULL,
	[Assessment_Name_SUS] [varchar](250) NULL,
	[Number_of_Suspensions] [varchar](250) NULL,
	[Number_of_Detentions] [varchar](250) NULL,
	[Number_of_Office_Referrals] [varchar](250) NULL,
	[Quarter] [varchar](250) NULL,
	[Date_Administered] [varchar](250) NULL,
	[cysch_accnt_sf_id] [varchar](250) NULL,
	[SUSPENSION_IND] [int] NULL,
	[DETENTION_IND] [int] NULL,
	[OFFICEREFERRAL_IND] [int] NULL
) ON [CM]

GO
