USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[Duplicates_Site_StudentName]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Duplicates_Site_StudentName](
	[Duplicate_Type] [varchar](34) NULL,
	[Name] [varchar](80) NULL,
	[Date_of_Birth__c] [datetime] NULL,
	[Gender__c] [varchar](255) NULL,
	[Grade__c] [varchar](255) NULL,
	[School_Name__c] [varchar](1300) NULL,
	[Student_Id__c] [varchar](100) NULL,
	[Attendance__c] [decimal](1, 0) NULL,
	[Behavior__c] [decimal](1, 0) NULL,
	[ELA_Literacy__c] [decimal](1, 0) NULL,
	[Math__c] [decimal](1, 0) NULL,
	[Location__c] [varchar](1300) NULL,
	[Local_Student_ID__c] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
