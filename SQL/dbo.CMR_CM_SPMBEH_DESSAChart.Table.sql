USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[CMR_CM_SPMBEH_DESSAChart]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_SPMBEH_DESSAChart](
	[STUDENT__C] [varchar](18) NULL,
	[Student_Name] [varchar](80) NULL,
	[ASSESSMENT_NAME] [varchar](1300) NULL,
	[DATE_ADMINISTERED__C] [datetime] NULL,
	[SEL_Composite_T_Score__c] [decimal](18, 0) NULL,
	[Section_Primary_Staff_ID] [varchar](18) NULL,
	[Section_Primary_Staff] [varchar](80) NULL,
	[cych_Accnt_SF_ID] [varchar](20) NULL,
	[Month_Administered] [datetime] NULL
) ON [CM]

GO
