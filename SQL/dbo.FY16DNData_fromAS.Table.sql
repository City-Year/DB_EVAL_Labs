USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[FY16DNData_fromAS]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FY16DNData_fromAS](
	[Location] [nvarchar](255) NULL,
	[School Name] [nvarchar](255) NULL,
	[Student ID] [nvarchar](255) NULL,
	[Grade] [float] NULL,
	[MP1 Attendance] [float] NULL,
	[MP2 Attendance] [float] NULL,
	[MP3 Attendance] [float] NULL,
	[MP4 Attendance] [float] NULL,
	[EOY Attendance] [float] NULL,
	[MP1 Behavior - _In School Suspensions] [nvarchar](255) NULL,
	[MP2 Behavior - _In School Suspensions] [nvarchar](255) NULL,
	[MP3 Behavior - _In School Suspensions] [nvarchar](255) NULL,
	[MP4 Behavior - _In School Suspensions] [nvarchar](255) NULL,
	[MP1 Behavior - _Out of School Suspensions] [float] NULL,
	[MP2 Behavior - _Out of School Suspensions] [float] NULL,
	[MP3 Behavior - _Out of School Suspensions] [float] NULL,
	[MP4 Behavior - _Out of School Suspensions] [float] NULL,
	[MP1 Math Grade] [nvarchar](255) NULL,
	[MP2 Math Grade] [nvarchar](255) NULL,
	[MP3 Math Grade] [nvarchar](255) NULL,
	[MP4 Math Grade] [nvarchar](255) NULL,
	[Final Math Grade] [nvarchar](255) NULL,
	[MP1 ELA Grade] [nvarchar](255) NULL,
	[MP2 ELA Grade] [nvarchar](255) NULL,
	[MP3 ELA Grade] [nvarchar](255) NULL,
	[MP4 ELA Grade] [nvarchar](255) NULL,
	[Final ELA Grade] [nvarchar](255) NULL
) ON [PRIMARY]

GO
