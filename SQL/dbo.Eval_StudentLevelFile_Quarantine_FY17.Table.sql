USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[Eval_StudentLevelFile_Quarantine_FY17]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eval_StudentLevelFile_Quarantine_FY17](
	[CYSCHOOLHOUSE_STUDENT_ID] [varchar](100) NULL,
	[FIRST_NAME] [varchar](100) NULL,
	[MIDDLE_NAME] [varchar](100) NULL,
	[LAST_NAME] [varchar](100) NULL,
	[CYCHANNEL_SCHOOL_ACCOUNT_NBR] [varchar](100) NULL,
	[GENDER] [varchar](50) NULL,
	[GRADE_ID] [varchar](100) NULL,
	[GRADE_ID_NUMERIC] [int] NULL,
	[ATTENDANCE_IA] [varchar](250) NULL,
	[ELA_IA] [varchar](250) NULL,
	[MATH_IA] [varchar](250) NULL,
	[BEHAVIOR_IA] [varchar](250) NULL,
	[FISCAL_YEAR] [varchar](50) NOT NULL,
	[ELL] [varchar](250) NULL,
	[RACE_ETHNICITY] [varchar](250) NULL,
	[STUDENT_DISTRICT_ID] [varchar](250) NULL,
	[CYSCHOOLHOUSE_SCHOOL_ID] [varchar](250) NULL,
	[ELA_PRIMARY_CM_SF_ID] [varchar](50) NULL,
	[ELA_PRIMARY_CM_NAME] [varchar](50) NULL,
	[ELA_PRIMARY_CM_EMAIL] [varchar](100) NULL,
	[MATH_PRIMARY_CM_SF_ID] [varchar](50) NULL,
	[MATH_PRIMARY_CM_NAME] [varchar](50) NULL,
	[MATH_PRIMARY_CM_EMAIL] [varchar](100) NULL,
	[ATT_PRIMARY_CM_SF_ID] [varchar](50) NULL,
	[ATT_PRIMARY_CM_NAME] [varchar](50) NULL,
	[ATT_PRIMARY_CM_EMAIL] [varchar](100) NULL,
	[BEH_PRIMARY_CM_SF_ID] [varchar](50) NULL,
	[BEH_PRIMARY_CM_NAME] [varchar](50) NULL,
	[BEH_PRIMARY_CM_EMAIL] [varchar](100) NULL,
	[DIPLOMAS_NOW_SCHOOL] [varchar](15) NULL,
	[site_name] [varchar](100) NULL,
	[school_name] [varchar](100) NULL,
	[region_name] [varchar](100) NULL,
	[CY_CHANNEL_SF_ID] [varchar](100) NULL,
	[MATH_TUTORING] [int] NULL,
	[LITERACY_TUTORING] [int] NULL,
	[LEADERSHIP_50ACTS] [int] NULL,
	[ATTENDANCE_COACHING] [int] NULL,
	[GREATNESS_50ACTS] [int] NULL,
	[BEHAVIOR_COACHING] [int] NULL,
	[ENRICHMENT] [int] NULL,
	[HOMEWORK_ASSISTANCE] [int] NULL,
	[STARFISH_CORPS] [int] NULL,
	[AFTERSCHOOL_HEROES] [int] NULL,
	[ATT_CICO] [int] NULL,
	[BEH_CICO] [int] NULL,
	[BEHAVIOR_ENROLLED] [int] NULL,
	[ATTENDANCE_ENROLLED] [int] NULL,
	[AFTERSCHOOL_ENROLLED] [int] NULL,
	[TOTALDOSAGELIT] [int] NULL,
	[TOTALDOSAGEMTH] [int] NULL,
	[TOTALDOSAGEOTH] [int] NULL,
	[totaldosageatt] [int] NULL,
	[totaldosagebeh] [int] NULL,
	[TOTALDOSAGELITHRS] [numeric](18, 6) NULL,
	[TOTALDOSAGEMTHHRS] [numeric](18, 6) NULL,
	[TOTALDOSAGEOTHHRS] [numeric](18, 6) NULL,
	[TOTALDOSAGEATTHRS] [numeric](18, 6) NULL,
	[TOTALDOSAGEBEHHRS] [numeric](18, 6) NULL,
	[TOTALDOSAGELITHRSROUND] [numeric](18, 6) NULL,
	[TOTALDOSAGEMTHHRSROUND] [numeric](18, 6) NULL,
	[ENROLLEDDAYSLIT] [int] NULL,
	[enrolleddaysmth] [int] NULL,
	[enrolleddaysatt] [int] NULL,
	[enrolleddaysbeh] [int] NULL,
	[enrolleddaysoth] [int] NULL,
	[ATTMET56DOSE] [int] NULL,
	[BEHMET56DOSE] [int] NULL,
	[OFFICIALFLLIT] [int] NULL,
	[OFFICIALFLMTH] [int] NULL,
	[OFFICIALFLATT] [int] NULL,
	[OFFICIALFLBEH] [int] NULL,
	[METPrMONTHLYLITDOSAGEGOAL] [int] NULL,
	[METPrMONTHLYMTHDOSAGEGOAL] [int] NULL,
	[METCurrMONTHLYLITDOSAGEGOAL] [int] NULL,
	[METCurrMONTHLYMTHDOSAGEGOAL] [int] NULL,
	[LITENROLLDATE] [datetime] NULL,
	[LITEXITDATE] [datetime] NULL,
	[MTHENROLLDATE] [datetime] NULL,
	[MTHEXITDATE] [datetime] NULL,
	[ATTENROLLDATE] [datetime] NULL,
	[ATTEXITDATE] [datetime] NULL,
	[BEHENROLLDATE] [datetime] NULL,
	[BEHEXITDATE] [datetime] NULL,
	[OTHENROLLDATE] [datetime] NULL,
	[OTHEXITDATE] [datetime] NULL,
	[AUG_ELA_DosageGoal] [float] NULL,
	[SEP_ELA_DosageGoal] [float] NULL,
	[OCT_ELA_DosageGoal] [float] NULL,
	[NOV_ELA_DosageGoal] [float] NULL,
	[DEC_ELA_DosageGoal] [float] NULL,
	[JAN_ELA_DosageGoal] [float] NULL,
	[FEB_ELA_DosageGoal] [float] NULL,
	[MAR_ELA_DosageGoal] [float] NULL,
	[APR_ELA_DosageGoal] [float] NULL,
	[MAY_ELA_DosageGoal] [float] NULL,
	[JUN_ELA_DosageGoal] [float] NULL,
	[AUG_MTH_DosageGoal] [float] NULL,
	[SEP_MTH_DosageGoal] [float] NULL,
	[OCT_MTH_DosageGoal] [float] NULL,
	[NOV_MTH_DosageGoal] [float] NULL,
	[DEC_MTH_DosageGoal] [float] NULL,
	[JAN_MTH_DosageGoal] [float] NULL,
	[FEB_MTH_DosageGoal] [float] NULL,
	[MAR_MTH_DosageGoal] [float] NULL,
	[APR_MTH_DosageGoal] [float] NULL,
	[MAY_MTH_DosageGoal] [float] NULL,
	[JUN_MTH_DosageGoal] [float] NULL,
	[Q1_ELA_EnrollGoal (3-9)] [float] NULL,
	[Q1_ELA_EnrollGoal (All Grades)] [float] NULL,
	[Q2_ELA_EnrollGoal (3-9)] [float] NULL,
	[Q2_ELA_EnrollGoal (All Grades)] [float] NULL,
	[Q3_ELA_EnrollGoal (3-9)] [float] NULL,
	[Q3_ELA_EnrollGoal (All Grades)] [float] NULL,
	[ELA_FinalEnrollGoal (3-9)] [float] NULL,
	[ELA_FinalEnrollGoal (All Grades)] [float] NULL,
	[Q1_MTH_EnrollGoal (3-9)] [float] NULL,
	[Q1_MTH_EnrollGoal (All Grades)] [float] NULL,
	[Q2_MTH_EnrollGoal (3-9)] [float] NULL,
	[Q2_MTH_EnrollGoal (All Grades)] [float] NULL,
	[Q3_MTH_EnrollGoal (3-9)] [float] NULL,
	[Q3_MTH_EnrollGoal (All Grades)] [float] NULL,
	[MTH_FinalEnrollGoal (3-9)] [float] NULL,
	[MTH_FinalEnrollGoal (All Grades)] [float] NULL,
	[Q1_ATT_EnrollGoal (3-9)] [float] NULL,
	[Q1_ATT_EnrollGoal (All Grades)] [float] NULL,
	[Q2_ATT_EnrollGoal (3-9)] [float] NULL,
	[Q2_ATT_EnrollGoal (All Grades)] [float] NULL,
	[Q3_ATT_EnrollGoal (3-9)] [float] NULL,
	[Q3_ATT_EnrollGoal (All Grades)] [float] NULL,
	[ATT_FinalEnrollGoal (3-9)] [float] NULL,
	[ATT_FinalEnrollGoal (All Grades)] [float] NULL,
	[Q1_BEH_EnrollGoal (3-9)] [float] NULL,
	[Q1_BEH_EnrollGoal (All Grades)] [float] NULL,
	[Q2_BEH_EnrollGoal (3-9)] [float] NULL,
	[Q2_BEH_EnrollGoal (All Grades)] [float] NULL,
	[Q3_BEH_EnrollGoal (3-9)] [float] NULL,
	[Q3_BEH_EnrollGoal (All Grades)] [float] NULL,
	[BEH_FinalEnrollGoal (3-9)] [float] NULL,
	[BEH_FinalEnrollGoal (All Grades)] [float] NULL,
	[Q1_ASP_EnrollGoal (3-9)] [float] NULL,
	[Q1_ASP_EnrollGoal (All Grades)] [float] NULL,
	[Q2_ASP_EnrollGoal (3-9)] [float] NULL,
	[Q2_ASP_EnrollGoal (All Grades)] [float] NULL,
	[Q3_ASP_EnrollGoal (3-9)] [float] NULL,
	[Q3_ASP_EnrollGoal (All Grades)] [float] NULL,
	[ASP_FinalEnrollGoal (3-9)] [float] NULL,
	[ASP_FinalEnrollGoal (All Grades)] [float] NULL,
	[GrantCategory] [varchar](250) NULL,
	[GrantSiteNum] [varchar](250) NULL,
	[GrantSite] [varchar](250) NULL,
	[GrantSite_GR] [varchar](250) NULL,
	[ACREPORTLIT] [varchar](50) NULL,
	[ACREPORTMTH] [varchar](50) NULL,
	[ACREPORTATT] [varchar](50) NULL,
	[ACREPORTBEH] [varchar](50) NULL,
	[ED1_ACAD_GOAL] [varchar](50) NULL,
	[ED2_ACAD_GOAL] [varchar](50) NULL,
	[ED5_ACAD_GOAL] [varchar](50) NULL,
	[ED1_ENGAGE_GOAL] [varchar](50) NULL,
	[ED2_ENGAGE_GOAL] [varchar](50) NULL,
	[ED27B_ENGAGE_GOAL] [varchar](50) NULL,
	[AC_SEL_OUPUT1_GOAL] [varchar](50) NULL,
	[AC_SEL_OUTPUT2_GOAL] [varchar](50) NULL,
	[AC_SELOUTCOME_GOAL] [varchar](50) NULL,
	[TEAM_CORP_SPONSOR] [varchar](250) NULL,
	[PrMnth_Literacy_Dosage_Target] [varchar](250) NULL,
	[PrMnth_Math_Dosage_Target] [varchar](250) NULL,
	[Quarterly_ELA_Enrollment_Goal] [varchar](250) NULL,
	[Quarterly_Math_Enrollment_Goal] [varchar](250) NULL,
	[Quarterly_ATT_Enrollment_Goal] [varchar](250) NULL,
	[Quarterly_BEH_Enrollment_Goal] [varchar](250) NULL,
	[Quarterly_ASP_Enrollment_Goal] [varchar](250) NULL,
	[CurrMnth_Literacy_Dosage_Target] [varchar](250) NULL,
	[CurrMnth_Math_Dosage_Target] [varchar](250) NULL,
	[FLATTMET56DOSE] [int] NULL,
	[FLBEHMET56DOSE] [int] NULL,
	[FLLITMETPrMONTHLYDOSAGEGOAL] [int] NULL,
	[FLMTHMETPrMONTHLYDOSAGEGOAL] [int] NULL,
	[FLLITMETCurrMONTHLYDOSAGEGOAL] [int] NULL,
	[FLMTHMETCurrMONTHLYDOSAGEGOAL] [int] NULL,
	[UNIQUEFL] [int] NOT NULL,
	[ED1_LIT_ACTUAL] [int] NULL,
	[ED1_MTH_ACTUAL] [int] NULL,
	[ACTUAL_ED1_ACAD] [int] NULL,
	[ED2_LIT_ACTUAL] [int] NULL,
	[ED2_MTH_ACTUAL] [int] NULL,
	[ACTUAL_ED2_ACAD] [int] NULL,
	[ED1_ATT_ACTUAL] [int] NULL,
	[ED1_BEH_ACTUAL] [int] NULL,
	[ED2_ATT_ACTUAL] [int] NULL,
	[ED2_BEH_ACTUAL] [int] NULL,
	[ACDOSAGEGOALMTH] [int] NULL,
	[ACDOSAGEGOALLIT] [int] NULL,
	[currentdate] [datetime] NOT NULL
) ON [PRIMARY]

GO
