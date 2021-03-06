USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[CMR_CM_Attendance_Suspensions]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_Attendance_Suspensions](
	[AVG_AVERAGE_DAILY_ATTENDANCE] [decimal](38, 6) NULL,
	[PERC_SUSPENSION] [numeric](24, 12) NULL,
	[PERC_DETENTION] [numeric](24, 12) NULL,
	[PERC_OFFICEREFERRAL] [numeric](24, 12) NULL,
	[cych_accnt_sf_id] [varchar](20) NULL,
	[Section_Primary_Staff] [varchar](80) NULL,
	[Section_Primary_Staff_ID] [varchar](18) NULL,
	[QUARTER] [varchar](250) NULL
) ON [CM]

GO
