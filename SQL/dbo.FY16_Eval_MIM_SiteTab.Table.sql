USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[FY16_Eval_MIM_SiteTab]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FY16_Eval_MIM_SiteTab](
	[region_name] [varchar](100) NULL,
	[site_name] [varchar](100) NULL,
	[min_grade_served] [int] NULL,
	[max_grade_served] [int] NULL,
	[ELAQuarterlyEnrollGoal] [float] NULL,
	[officialfllit] [int] NULL,
	[notofficialfllit] [int] NULL,
	[min_elamonthlydose] [float] NULL,
	[max_elamonthlydose] [float] NULL,
	[fllitmetmonthlydose] [int] NULL,
	[PERC_FL_MET_ELA_DOSE] [numeric](24, 12) NULL,
	[NOTFLLITMETMONTHLYDOSE] [int] NULL,
	[PERC_NOTFL_MET_ELA_DOSE] [numeric](24, 12) NULL,
	[MTHQuarterlyEnrollGoal] [float] NULL,
	[officialflmth] [int] NULL,
	[notofficialflmth] [int] NULL,
	[minmthmonthlydose] [float] NULL,
	[maxmthmonthlydose] [float] NULL,
	[flmthmetmonthlydose] [int] NULL,
	[PERC_FL_MET_MTH_DOSE] [numeric](24, 12) NULL,
	[NOTFLMTHMETMONTHLYDOSE] [int] NULL,
	[PERC_NOTFL_MET_MTH_DOSE] [numeric](24, 12) NULL,
	[attquarterlyenrollgoal] [float] NULL,
	[officialflatt] [int] NULL,
	[NOTOFFICIALFLATT] [int] NULL,
	[FLATTMET56DOSE] [int] NULL,
	[FLATT_PERC_MET_DOSE] [numeric](24, 12) NULL,
	[NOTFLATTMET56DOSE] [int] NULL,
	[NOTFLATT_PERC_MET_DOSE] [numeric](24, 12) NULL,
	[behquarterlyenrollgoal] [float] NULL,
	[OFFICIALFLBEH] [int] NULL,
	[NOTOFFICIALFLBEH] [int] NULL,
	[FLBEHMET56DOSE] [int] NULL,
	[FLBEH_PERC_MET_DOSE] [numeric](24, 12) NULL,
	[NOTFLBEHMET56DOSE] [int] NULL,
	[NOTFLBEH_PERC_MET_DOSE] [numeric](24, 12) NULL
) ON [PRIMARY]

GO
