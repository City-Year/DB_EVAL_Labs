USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[SRI_Date_Administered] [datetime] NULL,
	[Student_Id] [nvarchar](255) NULL,
	[SRI_Stu_Grade] [float] NULL,
	[SRI_Testing_Grade_Level] [nvarchar](255) NULL,
	[SRI_Lexile_Score] [float] NULL
) ON [PRIMARY]

GO
