USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[SMI$]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMI$](
	[SMI_Date_Administered] [datetime] NULL,
	[Student_Id] [nvarchar](255) NULL,
	[SMI_Stu_Grade] [float] NULL,
	[SMI_Quantile_Score] [float] NULL
) ON [PRIMARY]

GO
