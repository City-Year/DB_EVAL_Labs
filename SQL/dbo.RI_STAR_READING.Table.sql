USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[RI_STAR_READING]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RI_STAR_READING](
	[School Location] [nvarchar](255) NULL,
	[CY-ID] [nvarchar](255) NULL,
	[Grade Level] [float] NULL,
	[STAR Reading SGP] [float] NULL
) ON [PRIMARY]

GO
