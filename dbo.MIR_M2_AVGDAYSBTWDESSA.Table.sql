USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[MIR_M2_AVGDAYSBTWDESSA]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIR_M2_AVGDAYSBTWDESSA](
	[student_id__c] [varchar](255) NULL,
	[avg_SEL_Date_Administered__c_Diff] [int] NULL,
	[mostrecentassess] [datetime] NULL,
	[Days_Since_Last_Administration] [int] NULL
) ON [PRIMARY]

GO
