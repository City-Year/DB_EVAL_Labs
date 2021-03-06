USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[CMR_CM_SPMBEH_DESSATable]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMR_CM_SPMBEH_DESSATable](
	[student__c] [varchar](18) NULL,
	[date_administered__c] [datetime] NULL,
	[ASSESSMENT_NAME] [varchar](1300) NULL,
	[student_name] [varchar](80) NULL,
	[Decision_Making_Description__c] [varchar](255) NULL,
	[Goal_directed_Behavior_Description__c] [varchar](255) NULL,
	[Optimistic_Thinking_Description__c] [varchar](255) NULL,
	[Personal_Responsibility_Description__c] [varchar](255) NULL,
	[Relationship_Skills_Description__c] [varchar](255) NULL,
	[SEL_Composite_Description__c] [varchar](255) NULL,
	[Self_Awareness_Description__c] [varchar](255) NULL,
	[Self_Management_Description__c] [varchar](255) NULL,
	[Social_Awareness_Description__c] [varchar](255) NULL,
	[MOSTRECENT] [bigint] NULL,
	[Section_Primary_Staff_id] [varchar](18) NULL,
	[Section_Primary_Staff] [varchar](80) NULL,
	[cych_accnt_sf_id] [varchar](20) NULL
) ON [CM]

GO
