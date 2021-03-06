USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[FY16_EVAL_MIM_EnrollmentTab]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FY16_EVAL_MIM_EnrollmentTab](
	[CYCHANNEL_SCHOOL_ACCOUNT_NBR] [varchar](100) NULL,
	[REGION_NAME] [varchar](100) NULL,
	[SITE_NAMe] [varchar](100) NULL,
	[SCHOOL_NAME] [varchar](100) NULL,
	[MINlitGRADE] [int] NULL,
	[MAXlitGRADE] [int] NULL,
	[TOTALlitENROLL] [int] NULL,
	[OFFICIALFLLIT] [int] NULL,
	[OFFICIALlit_PERC] [numeric](24, 12) NULL,
	[NOTOFFICIALFLLIT] [int] NULL,
	[NONOFFICIALlit_PERC] [numeric](24, 12) NULL,
	[MINmthGRADE] [int] NULL,
	[MAXmthGRADE] [int] NULL,
	[TOTALmthENROLL] [int] NULL,
	[OFFICIALFLmth] [int] NULL,
	[OFFICIALmth_PERC] [numeric](24, 12) NULL,
	[NOTOFFICIALFLmth] [int] NULL,
	[NONOFFICIALmth_PERC] [numeric](24, 12) NULL,
	[MINattGRADE] [int] NULL,
	[MAXattGRADE] [int] NULL,
	[TOTALattENROLL] [int] NULL,
	[OFFICIALFLatt] [int] NULL,
	[OFFICIALatt_PERC] [numeric](24, 12) NULL,
	[NOTOFFICIALFLatt] [int] NULL,
	[NONOFFICIALatt_PERC] [numeric](24, 12) NULL,
	[MINbehGRADE] [int] NULL,
	[MAXbehGRADE] [int] NULL,
	[TOTALbehENROLL] [int] NULL,
	[OFFICIALFLbeh] [int] NULL,
	[OFFICIALbeh_PERC] [numeric](24, 12) NULL,
	[NOTOFFICIALFLbeh] [int] NULL,
	[NONOFFICIALbeh_PERC] [numeric](24, 12) NULL
) ON [PRIMARY]

GO
