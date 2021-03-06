USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[SR_ST_SPMBEH_DESSAChart]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SR_ST_SPMBEH_DESSAChart](
	[student__c] [varchar](18) NULL,
	[Date_Administered__c] [datetime] NULL,
	[Assessment_Name] [varchar](1300) NULL,
	[Decision_Making_T_Score__c] [decimal](18, 0) NULL,
	[Goal_directed_Behavior_T_Score__c] [decimal](18, 0) NULL,
	[Optimistic_Thinking_T_Score__c] [decimal](18, 0) NULL,
	[Personal_Responsibility_T_Score__c] [decimal](18, 0) NULL,
	[Relationship_Skills_T_Score__c] [decimal](18, 0) NULL,
	[SEL_Composite_T_Score__c] [decimal](18, 0) NULL,
	[Self_Awareness_T_Score__c] [decimal](18, 0) NULL,
	[Self_Management_T_Score__c] [decimal](18, 0) NULL,
	[Social_Awareness_T_Score__c] [decimal](18, 0) NULL,
	[Month_Administered] [datetime] NULL
) ON [Student]

GO
