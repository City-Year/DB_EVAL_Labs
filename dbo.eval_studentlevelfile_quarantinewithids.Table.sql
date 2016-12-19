USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[eval_studentlevelfile_quarantinewithids]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eval_studentlevelfile_quarantinewithids](
	[CYSCHOOLHOUSE_STUDENT_ID] [varchar](100) NULL,
	[FIRST_NAME] [varchar](100) NULL,
	[MIDDLE_NAME] [varchar](100) NULL,
	[LAST_NAME] [varchar](100) NULL,
	[REGION_ID] [varchar](100) NULL,
	[REGION_NAME] [varchar](100) NULL,
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
	[TOTALDOSAGELIT] [int] NULL,
	[TOTALDOSAGEMTH] [int] NULL,
	[TOTALDOSAGEOTH] [int] NULL,
	[totaldosageatt] [int] NULL,
	[totaldosagebeh] [int] NULL,
	[ENROLLEDDAYSLIT] [int] NULL,
	[enrolleddaysmth] [int] NULL,
	[enrolleddaysatt] [int] NULL,
	[enrolleddaysbeh] [int] NULL,
	[enrolleddaysoth] [int] NULL,
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
	[ELA_39_EnrollGoal] [float] NULL,
	[ELA_out39_Enroll] [float] NULL,
	[ELA_All_Enroll] [float] NULL,
	[MTH_39_EnrollGoal] [float] NULL,
	[MTH_out39_Enroll] [float] NULL,
	[MTH_All_Enroll] [float] NULL,
	[ATT_39_EnrollGoal] [float] NULL,
	[ATT_out39_Enroll] [float] NULL,
	[ATT_All_Enroll] [float] NULL,
	[BEH_39_EnrollGoal] [float] NULL,
	[BEH_out39_Enroll] [float] NULL,
	[BEH_All_Enroll] [float] NULL,
	[FEB_ELA_DosageGoal] [float] NULL,
	[MAR_ELA_DosageGoal] [float] NULL,
	[APR_ELA_DosageGoal] [float] NULL,
	[MAY_ELA_DosageGoal] [float] NULL,
	[JUN_ELA_DosageGoal] [float] NULL,
	[FEB_MTH_DosageGoal] [float] NULL,
	[MAR_MTH_DosageGoal] [float] NULL,
	[APR_MTH_DosageGoal] [float] NULL,
	[MAY_MTH_DosageGoal] [float] NULL,
	[JUN_MTH_DosageGoal] [float] NULL,
	[Q2_ELA_EnrollGoal] [float] NULL,
	[Q2_MTH_EnrollGoal] [float] NULL,
	[Q2_ATT_EnrollGoal] [float] NULL,
	[Q2_BEH_EnrollGoal] [float] NULL,
	[Q3_ELA_EnrollGoal] [float] NULL,
	[Q3_MTH_EnrollGoal] [float] NULL,
	[Q3_ATT_EnrollGoal] [float] NULL,
	[Q3_BEH_EnrollGoal] [float] NULL,
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
	[LitAssess_SKILL_DESCRIPTION] [varchar](255) NULL,
	[LitAssess_DATA_TYPE] [varchar](255) NULL,
	[LitAssess_PRE_ASSESSMENT_DATE] [date] NULL,
	[LitAssess_PRE_INTERVAL] [varchar](255) NULL,
	[LitAssess_PRE_VALUE] [varchar](255) NULL,
	[LitAssess_PRE_SCALE_LOCAL] [varchar](255) NULL,
	[LitAssess_PRE_SCALE_NORM] [varchar](255) NULL,
	[LitAssess_PRE_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[LitAssess_PRE_SCALE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_PRE_ALPHA_SCORE_RANK] [varchar](255) NULL,
	[LitAssess_PRE_ALPHA_SCORE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_PRE_TARGET_SCORE] [varchar](255) NULL,
	[LitAssess_PRE_ALPHA_TARGET_SCORE_RANK] [varchar](255) NULL,
	[LitAssess_PRE_ALPHA_TARGET_SCORE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_PRE_MET_TARGET_SCORE] [varchar](255) NULL,
	[LitAssess_MY_ASSESSMENT_DATE] [date] NULL,
	[LitAssess_MY_INTERVAL] [varchar](255) NULL,
	[LitAssess_MY_VALUE] [varchar](255) NULL,
	[LitAssess_MY_SCALE_LOCAL] [varchar](255) NULL,
	[LitAssess_MY_SCALE_NORM] [varchar](255) NULL,
	[LitAssess_MY_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[LitAssess_MY_SCALE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_MY_ALPHA_SCORE_RANK] [varchar](255) NULL,
	[LitAssess_MY_ALPHA_SCORE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_MY_TARGET_SCORE] [varchar](255) NULL,
	[LitAssess_MY_ALPHA_TARGET_SCORE_RANK] [varchar](255) NULL,
	[LitAssess_MY_ALPHA_TARGET_SCORE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_MY_MET_TARGET_SCORE] [varchar](255) NULL,
	[LitAssess_POST_ASSESSMENT_DATE] [date] NULL,
	[LitAssess_POST_INTERVAL] [varchar](255) NULL,
	[LitAssess_POST_VALUE] [varchar](255) NULL,
	[LitAssess_POST_SCALE_LOCAL] [varchar](255) NULL,
	[LitAssess_POST_SCALE_NORM] [varchar](255) NULL,
	[LitAssess_POST_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[LitAssess_POST_SCALE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_POST_ALPHA_SCORE_RANK] [varchar](255) NULL,
	[LitAssess_POST_ALPHA_SCORE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_POST_TARGET_SCORE] [varchar](255) NULL,
	[LitAssess_POST_ALPHA_TARGET_SCORE_RANK] [varchar](255) NULL,
	[LitAssess_POST_ALPHA_TARGET_SCORE_RANK_NORM] [varchar](255) NULL,
	[LitAssess_POST_MET_TARGET_SCORE] [varchar](255) NULL,
	[LitAssess_MY_RAWCHANGE] [varchar](255) NULL,
	[LitAssess_MY_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[LitAssess_RAWCHANGE] [float] NULL,
	[LitAssess_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[LitAssess_MY_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[LitAssess_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[LitAssess_SCALE_CHANGE_LOCAL_DEGREE] [varchar](20) NULL,
	[LitAssess_MY_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[LitAssess_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[LitAssess_SCALE_CHANGE_NORM_DEGREE] [varchar](20) NULL,
	[LitAssess_MY_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[LitAssess_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[LitAssess_MY_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[LitAssess_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[LitAssess_STARTOFFSLIDING] [varchar](255) NULL,
	[LitAssess_MY_SOS_MoveOn] [varchar](255) NULL,
	[LitAssess_SOS_MoveOn] [varchar](255) NULL,
	[SRIGrade] [numeric](38, 0) NULL,
	[SRIFallLexileMeasure] [numeric](38, 0) NULL,
	[SRIFallLexileMeasureMax] [numeric](38, 0) NULL,
	[SRISpringLexileMeasure] [numeric](38, 0) NULL,
	[SRIFallToSpringGrowth] [decimal](38, 0) NULL,
	[LitAssess_IOG_CRITERIA] [int] NULL,
	[LitAssess_DN_CRITERIA] [int] NULL,
	[LITASSESS_ANYRAWDP] [int] NULL,
	[LITASSESS_2RAWDP] [int] NULL,
	[LITASSESS_2PerfLvlDP_LOCAL] [int] NULL,
	[LITASSESS_2PerfLvlDP_NORM] [int] NULL,
	[LITAssess_RawInc] [int] NULL,
	[LITAssess_StartOffSlid] [int] NULL,
	[LITAssess_SOSMoveOn] [int] NULL,
	[LitAssess_AC_MET_IMP] [int] NULL,
	[LitAssess_AC_MET_PERF_LVL] [int] NULL,
	[IOG_LITAssess35_anyRawDP] [int] NULL,
	[IOG_LITAssess35_2RawDP] [int] NULL,
	[IOG_LITAssess35_2PerfLvlDP_LOCAL] [int] NULL,
	[IOG_LITAssess35_2PerfLvlDP_NORM] [int] NULL,
	[IOG_LITAssess35_RawInc] [int] NULL,
	[IOG_LITAssess35_StartOffSlid] [int] NULL,
	[IOG_LITAssess35_SOSMoveOn] [int] NULL,
	[IOG_LITAssess69_anyRawDP] [int] NULL,
	[IOG_LITAssess69_2RawDP] [int] NULL,
	[IOG_LITAssess69_2PerfLvlDP_LOCAL] [int] NULL,
	[IOG_LITAssess69_2PerfLvlDP_NORM] [int] NULL,
	[IOG_LITAssess69_RawInc] [int] NULL,
	[IOG_LITAssess69_StartOffSlid] [int] NULL,
	[IOG_LITAssess69_SOSMoveOn] [int] NULL,
	[IOG_LITAssess39_anyRawDP] [int] NULL,
	[IOG_LITAssess39_2RawDP] [int] NULL,
	[IOG_LITAssess39_2PerfLvlDP_LOCAL] [int] NULL,
	[IOG_LITAssess39_2PerfLvlDP_NORM] [int] NULL,
	[IOG_LITAssess39_RawInc] [int] NULL,
	[IOG_LITAssess39_StartOffSlid] [int] NULL,
	[IOG_LITAssess39_SOSMoveOn] [int] NULL,
	[DN_LITAssess69_anyRawDP] [int] NULL,
	[DN_LITAssess69_2RawDP] [int] NULL,
	[DN_LITAssess69_2PerfLvlDP_LOCAL] [int] NULL,
	[DN_LITAssess69_2PerfLvlDP_NORM] [int] NULL,
	[DN_LITAssess69_RawInc] [int] NULL,
	[DN_LITAssess69_StartOffSlid] [int] NULL,
	[DN_LITAssess69_SOSMoveOn] [int] NULL,
	[LitAssess_OG_MET_IMP] [int] NULL,
	[LitAssess_OG_MET_PERF_LVL] [int] NULL,
	[LITASSESS_METPERFGROWTH] [int] NULL,
	[LITASSESS_AC_METGOAL] [int] NULL,
	[IOG_LITAssess35_MetPerfGrowth] [int] NULL,
	[IOG_LITAssess69_MetPerfGrowth] [int] NULL,
	[IOG_LITAssess39_MetPerfGrowth] [int] NULL,
	[MthAssess_SKILL_DESCRIPTION] [varchar](255) NULL,
	[MthAssess_DATA_TYPE] [varchar](255) NULL,
	[MthAssess_PRE_ASSESSMENT_DATE] [date] NULL,
	[MthAssess_PRE_INTERVAL] [varchar](255) NULL,
	[MthAssess_PRE_VALUE] [varchar](255) NULL,
	[MthAssess_PRE_SCALE_LOCAL] [varchar](255) NULL,
	[MthAssess_PRE_SCALE_NORM] [varchar](255) NULL,
	[MthAssess_PRE_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[MthAssess_PRE_SCALE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_PRE_ALPHA_SCORE_RANK] [varchar](255) NULL,
	[MthAssess_PRE_ALPHA_SCORE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_PRE_TARGET_SCORE] [varchar](255) NULL,
	[MthAssess_PRE_ALPHA_TARGET_SCORE_RANK] [varchar](255) NULL,
	[MthAssess_PRE_ALPHA_TARGET_SCORE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_PRE_MET_TARGET_SCORE] [varchar](255) NULL,
	[MthAssess_MY_ASSESSMENT_DATE] [date] NULL,
	[MthAssess_MY_INTERVAL] [varchar](255) NULL,
	[MthAssess_MY_VALUE] [varchar](255) NULL,
	[MthAssess_MY_SCALE_LOCAL] [varchar](255) NULL,
	[MthAssess_MY_SCALE_NORM] [varchar](255) NULL,
	[MthAssess_MY_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[MthAssess_MY_SCALE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_MY_ALPHA_SCORE_RANK] [varchar](255) NULL,
	[MthAssess_MY_ALPHA_SCORE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_MY_TARGET_SCORE] [varchar](255) NULL,
	[MthAssess_MY_ALPHA_TARGET_SCORE_RANK] [varchar](255) NULL,
	[MthAssess_MY_ALPHA_TARGET_SCORE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_MY_MET_TARGET_SCORE] [varchar](255) NULL,
	[MthAssess_POST_ASSESSMENT_DATE] [date] NULL,
	[MthAssess_POST_INTERVAL] [varchar](255) NULL,
	[MthAssess_POST_VALUE] [varchar](255) NULL,
	[MthAssess_POST_SCALE_LOCAL] [varchar](255) NULL,
	[MthAssess_POST_SCALE_NORM] [varchar](255) NULL,
	[MthAssess_POST_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[MthAssess_POST_SCALE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_POST_ALPHA_SCORE_RANK] [varchar](255) NULL,
	[MthAssess_POST_ALPHA_SCORE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_POST_TARGET_SCORE] [varchar](255) NULL,
	[MthAssess_POST_ALPHA_TARGET_SCORE_RANK] [varchar](255) NULL,
	[MthAssess_POST_ALPHA_TARGET_SCORE_RANK_NORM] [varchar](255) NULL,
	[MthAssess_POST_MET_TARGET_SCORE] [varchar](255) NULL,
	[MthAssess_MY_RAWCHANGE] [varchar](255) NULL,
	[MthAssess_MY_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[MthAssess_RAWCHANGE] [float] NULL,
	[MthAssess_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[MthAssess_MY_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[MthAssess_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[MTHAssess_SCALE_CHANGE_LOCAL_DEGREE] [varchar](20) NULL,
	[MthAssess_MY_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[MthAssess_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[MTHAssess_SCALE_CHANGE_NORM_DEGREE] [varchar](20) NULL,
	[MthAssess_MY_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[MthAssess_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[MthAssess_MY_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[MthAssess_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[MthAssess_STARTOFFSLIDING] [varchar](255) NULL,
	[MthAssess_MY_SOS_MoveOn] [varchar](255) NULL,
	[MthAssess_SOS_MoveOn] [varchar](255) NULL,
	[SMIGrade] [float] NULL,
	[SMIBelowBasic_GrowthTarget] [float] NULL,
	[SMIBasic_GrowthTarget] [float] NULL,
	[SMIProficient_GrowthTarget] [float] NULL,
	[SMIAdvanced_GrowthTarget] [float] NULL,
	[MthAssess_IOG_CRITERIA] [int] NULL,
	[MthAssess_DN_CRITERIA] [int] NULL,
	[MATHASSESS_ANYRAWDP] [int] NULL,
	[MATHASSESS_2RAWDP] [int] NULL,
	[MATHASSESS_2PerfLvlDP_LOCAL] [int] NULL,
	[MATHASSESS_2PerfLvlDP_NORM] [int] NULL,
	[MathAssess_RawInc] [int] NULL,
	[MathAssess_StartOffSlid] [varchar](255) NULL,
	[MathAssess_SOSMoveOn] [varchar](255) NULL,
	[SMI_Target] [float] NULL,
	[IOG_MATHAssess35_anyRawDP] [int] NULL,
	[IOG_MATHAssess35_2RawDP] [int] NULL,
	[IOG_MATHAssess35_2PerfLvlDP_LOCAL] [int] NULL,
	[IOG_MATHAssess35_2PerfLvlDP_NORM] [int] NULL,
	[IOG_MATHAssess35_RawInc] [int] NULL,
	[IOG_MATHAssess35_StartOffSlid] [varchar](255) NULL,
	[IOG_MATHAssess35_SOSMoveOn] [varchar](255) NULL,
	[IOG_MATHAssess69_anyRawDP] [int] NULL,
	[IOG_MATHAssess69_2RawDP] [int] NULL,
	[IOG_MATHAssess69_2PerfLvlDP_LOCAL] [int] NULL,
	[IOG_MATHAssess69_2PerfLvlDP_NORM] [int] NULL,
	[IOG_MATHAssess69_RawInc] [int] NULL,
	[IOG_MATHAssess69_StartOffSlid] [varchar](255) NULL,
	[IOG_MATHAssess69_SOSMoveOn] [varchar](255) NULL,
	[IOG_MATHAssess39_anyRawDP] [int] NULL,
	[IOG_MATHAssess39_2RawDP] [int] NULL,
	[IOG_MATHAssess39_2PerfLvlDP_LOCAL] [int] NULL,
	[IOG_MATHAssess39_2PerfLvlDP_NORM] [int] NULL,
	[IOG_MATHAssess39_RawInc] [int] NULL,
	[IOG_MATHAssess39_StartOffSlid] [varchar](255) NULL,
	[IOG_MATHAssess39_SOSMoveOn] [varchar](255) NULL,
	[DN_MATHAssess69_anyRawDP] [int] NULL,
	[DN_MATHAssess69_2RawDP] [int] NULL,
	[DN_MATHAssess69_2PerfLvlDP_LOCAL] [int] NULL,
	[DN_MATHAssess69_2PerfLvlDP_NORM] [int] NULL,
	[DN_MATHAssess69_RawInc] [int] NULL,
	[DN_MATHAssess69_StartOffSlid] [varchar](255) NULL,
	[DN_MATHAssess69_SOSMoveOn] [varchar](255) NULL,
	[MthAssess_AC_MET_IMP] [int] NULL,
	[MthAssess_AC_MET_PERF_LVL] [int] NULL,
	[MthAssess_OG_MET_IMP] [int] NULL,
	[MthAssess_OG_MET_PERF_LEVEL] [int] NULL,
	[MATHASSESS_IOG_METPERFGROWTH] [int] NULL,
	[MATHASSESS_AC_METGOAL] [int] NULL,
	[IOG_MATHAssess35_MetPerfGrowth] [int] NULL,
	[IOG_MATHAssess69_MetPerfGrowth] [int] NULL,
	[IOG_MATHAssess39_MetPerfGrowth] [int] NULL,
	[ATT_SKILL_DESCRIPTION] [varchar](255) NULL,
	[ATT_PRE_DATE] [date] NULL,
	[ATT_PRE_INTERVAL] [varchar](255) NULL,
	[ATT_PRE_VALUE] [varchar](255) NULL,
	[ATT_PRE_SCALE_LOCAL] [varchar](255) NULL,
	[ATT_PRE_SCALE_NORM] [varchar](255) NULL,
	[ATT_PRE_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[ATT_PRE_SCALE_RANK_NORM] [varchar](255) NULL,
	[ATT_MY_DATE] [date] NULL,
	[ATT_MY_INTERVAL] [varchar](255) NULL,
	[ATT_MY_VALUE] [varchar](255) NULL,
	[ATT_MY_SCALE_LOCAL] [varchar](255) NULL,
	[ATT_MY_SCALE_NORM] [varchar](255) NULL,
	[ATT_MY_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[ATT_MY_SCALE_RANK_NORM] [varchar](255) NULL,
	[ATT_POST_DATE] [date] NULL,
	[ATT_INTERVAL] [varchar](255) NULL,
	[ATT_POST_VALUE] [varchar](255) NULL,
	[ATT_POST_SCALE_LOCAL] [varchar](255) NULL,
	[ATT_POST_SCALE_NORM] [varchar](255) NULL,
	[ATT_POST_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[ATT_POST_SCALE_RANK_NORM] [varchar](255) NULL,
	[ATT_MY_RAWCHANGE] [float] NULL,
	[ATT_MY_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[ATT_RAWCHANGE] [float] NULL,
	[ATT_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[ATT_MY_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[ATT_MY_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[ATT_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[ATT_SCALE_CHANGE_LOCAL_DEGREE] [varchar](20) NULL,
	[ATT_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[ATT_MY_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[ATT_SCALE_CHANGE_NORM_DEGREE] [varchar](20) NULL,
	[ATT_MY_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[ATT_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[ATT_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[ATT_MY_SOS_MoveOn] [varchar](255) NULL,
	[ATT_MY_SHOW_1PERC_INC] [varchar](255) NULL,
	[ATT_SHOW_1PERC_INC] [varchar](255) NULL,
	[ATT_MY_SHOW_2PERC_INC] [varchar](255) NULL,
	[ATT_SHOW_2PERC_INC] [varchar](255) NULL,
	[ATT_anyRawDP] [int] NULL,
	[ATT_2RawDP] [int] NULL,
	[IOG_ATT_ANYRAWDP] [int] NULL,
	[IOG_ATT_2RAWDP] [int] NULL,
	[ATT_2PerfLvlDP_Local] [int] NULL,
	[ATT_2PerfLvlDP_Norm] [int] NULL,
	[ATT_StartLTE99ADA] [varchar](255) NULL,
	[ATT_StartLTE98ADA] [varchar](255) NULL,
	[ATT_StartLT90ADA] [varchar](255) NULL,
	[ATT_SOSMoveOn] [varchar](255) NULL,
	[ATT_1PercInc] [varchar](255) NULL,
	[ATT_2PERCINC] [varchar](255) NULL,
	[ATT_StartOnStayOn] [varchar](50) NULL,
	[ATT_IOG_CRITERIA] [int] NULL,
	[ATT_DN_CRITERIA] [int] NULL,
	[IOG_ATT69_anyRawDP] [int] NULL,
	[IOG_ATT69_2RawDP] [int] NULL,
	[IOG_ATT69_2PerfLvlDP_Local] [int] NULL,
	[IOG_ATT69_2PerfLvlDP_Norm] [int] NULL,
	[IOG_ATT69_StartLTE99ADA] [varchar](255) NULL,
	[IOG_ATT69_StartLTE98ADA] [varchar](255) NULL,
	[IOG_ATT69_StartLT90ADA] [varchar](255) NULL,
	[IOG_ATT69_SOSMoveOn] [varchar](255) NULL,
	[IOG_ATT69_1PercInc] [varchar](255) NULL,
	[IOG_ATT69_2PercInc] [varchar](255) NULL,
	[IOG_ATT69_StartOnStayOn] [varchar](50) NULL,
	[DN_ATT69_anyRawDP] [int] NULL,
	[DN_ATT69_2RawDP] [int] NULL,
	[DN_ATT69_2PerfLvlDP_Local] [int] NULL,
	[DN_ATT69_2PerfLvlDP_Norm] [int] NULL,
	[DN_ATT69_StartLTE99ADA] [varchar](255) NULL,
	[DN_ATT69_StartLTE98ADA] [varchar](255) NULL,
	[DN_ATT69_StartLT90ADA] [varchar](255) NULL,
	[DN_ATT69_SOSMoveOn] [varchar](255) NULL,
	[DN_ATT69_1PercInc] [varchar](255) NULL,
	[DN_ATT69_2PercInc] [varchar](255) NULL,
	[DN_ATT69_StartOnStayOn] [varchar](50) NULL,
	[ATT_METACGOAL] [int] NULL,
	[DESSA_SKILL_DESCRIPTION] [varchar](255) NULL,
	[DESSA_PRE_DATE] [date] NULL,
	[DESSA_PRE_VALUE] [varchar](255) NULL,
	[DESSA_PRE_VALUE_DESC] [varchar](255) NULL,
	[DESSA_MY_DATE] [date] NULL,
	[DESSA_MY_VALUE] [varchar](255) NULL,
	[DESSA_MY_VALUE_DESC] [varchar](255) NULL,
	[DESSA_POST_DATE] [date] NULL,
	[DESSA_POST_VALUE] [varchar](255) NULL,
	[DESSA_POST_VALUE_DESC] [varchar](255) NULL,
	[DESSA_MY_DAYS_BETWEEN_ASSESSMENTS] [varchar](255) NULL,
	[DESSA_DAYS_BETWEEN_ASSESSMENTS] [varchar](255) NULL,
	[DESSA_MY_RAWCHANGE] [varchar](255) NULL,
	[DESSA_RAWCHANGE] [float] NULL,
	[DESSA_MY_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[DESSA_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[DESSA_MY_DESC_CHANGE] [varchar](255) NULL,
	[DESSA_DESC_CHANGE] [varchar](255) NULL,
	[DESSA_MY_DESC_CHANGE_DEGREE] [varchar](255) NULL,
	[DESSA_DESC_CHANGE_DEGREE] [varchar](255) NULL,
	[DESSA_ANYRAWDP] [int] NULL,
	[DESSA_2RAWDP] [int] NULL,
	[DESSA_4PTIMP] [int] NULL,
	[DESSA_ANYRAWIMP] [int] NULL,
	[DESSA_START_NEED] [int] NULL,
	[DESSA_STARTN_ENDTS] [int] NULL,
	[DESSA_STARTTS_ENDTS] [int] NULL,
	[DESSA_AC_MET_IMP] [int] NULL,
	[IOG_DESSA35_anyRawDP] [int] NULL,
	[IOG_DESSA35_2RAWDP] [int] NULL,
	[IOG_DESSA35_4PTIMP] [int] NULL,
	[IOG_DESSA35_ANYRAWIMP] [int] NULL,
	[IOG_DESSA35_START_NEED] [int] NULL,
	[IOG_DESSA35_STARTN_ENDTS] [int] NULL,
	[IOG_DESSA35_STARTTS_ENDTS] [int] NULL,
	[IOG_DESSA69_anyRawDP] [int] NULL,
	[IOG_DESSA69_2RAWDP] [int] NULL,
	[IOG_DESSA69_4PTIMP] [int] NULL,
	[IOG_DESSA69_ANYRAWIMP] [int] NULL,
	[IOG_DESSA69_START_NEED] [int] NULL,
	[IOG_DESSA69_STARTN_ENDTS] [int] NULL,
	[IOG_DESSA69_STARTTS_ENDTS] [int] NULL,
	[IOG_DESSA39_anyRawDP] [int] NULL,
	[IOG_DESSA39_2RAWDP] [int] NULL,
	[IOG_DESSA39_4PTIMP] [int] NULL,
	[IOG_DESSA39_ANYRAWIMP] [int] NULL,
	[IOG_DESSA39_START_NEED] [int] NULL,
	[IOG_DESSA39_STARTN_ENDTS] [int] NULL,
	[IOG_DESSA39_STARTTS_ENDTS] [int] NULL,
	[DN_DESSA69_anyRawDP] [int] NULL,
	[DN_DESSA69_2RAWDP] [int] NULL,
	[DN_DESSA69_4PTIMP] [int] NULL,
	[DN_DESSA69_ANYRAWIMP] [int] NULL,
	[DN_DESSA69_START_NEED] [int] NULL,
	[DN_DESSA69_STARTN_ENDTS] [int] NULL,
	[DN_DESSA69_STARTTS_ENDTS] [int] NULL,
	[BEHSUS_SKILL_DESCRIPTION] [varchar](255) NULL,
	[BEHSUS_DATA_TYPE] [varchar](255) NULL,
	[BEHSUS_PRE_INTERVAL] [varchar](255) NULL,
	[BEHSUS_PRE_DATE] [date] NULL,
	[BEHSUS_PRE_VALUE] [float] NULL,
	[BEHSUS_MY_INTERVAL] [varchar](255) NULL,
	[BEHSUS_MY_DATE] [date] NULL,
	[BEHSUS_MY_VALUE] [varchar](255) NULL,
	[BEHSUS_POST_INTERVAL] [varchar](255) NULL,
	[BEHSUS_POST_DATE] [date] NULL,
	[BEHSUS_POST_VALUE] [float] NULL,
	[BEHSUS_MY_RAWCHANGE] [varchar](255) NULL,
	[BEHSUS_MY_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[BEHSUS_RAWCHANGE] [int] NULL,
	[BEHSUS_RAWCHANGE_DEGREE] [varchar](255) NULL,
	[BEHSUS_PRE_EWI] [float] NULL,
	[BEHSUS_PRE_EWI_TEXT] [varchar](255) NULL,
	[BEHSUS_MY_EWI] [varchar](255) NULL,
	[BEHSUS_MY_EWI_TEXT] [varchar](255) NULL,
	[BEHSUS_POST_EWI] [float] NULL,
	[BEHSUS_POST_EWI_TEXT] [varchar](255) NULL,
	[BEHSUS_MY_EWI_CHANGE] [varchar](255) NULL,
	[BEHSUS_POST_EWI_CHANGE] [varchar](255) NULL,
	[BEHSUS_BEHSUS_ANYRAWDP] [int] NULL,
	[BEHSUS_BEHSUS_2RAWDP] [int] NULL,
	[BEHSUS_StartEWI_EndNoEWI] [int] NULL,
	[BEHSUS_START_EWI] [int] NULL,
	[BEHSUS_RawImp] [int] NULL,
	[BEHSUS_AC_MET_IMP] [int] NULL,
	[IOG_BEHSUS35_ANYRAWDP] [int] NULL,
	[IOG_BEHSUS35_2RAWDP] [int] NULL,
	[IOG_BEHSUS35_StartEWI_EndNoEWI] [int] NULL,
	[IOG_BEHSUS35_Start_EWI] [int] NULL,
	[IOG_BEHSUS35_RawImp] [int] NULL,
	[IOG_BEHSUS69_ANYRAWDP] [int] NULL,
	[IOG_BEHSUS69_2RAWDP] [int] NULL,
	[IOG_BEHSUS69_StartEWI_EndNoEWI] [int] NULL,
	[IOG_BEHSUS69_RawImp] [int] NULL,
	[IOG_BEHSUS69_Start_EWI] [int] NULL,
	[IOG_BEHSUS39_ANYRAWDP] [int] NULL,
	[IOG_BEHSUS39_2RAWDP] [int] NULL,
	[IOG_BEHSUS39_StartEWI_EndNoEWI] [int] NULL,
	[IOG_BEHSUS39_RawImp] [int] NULL,
	[IOG_BEHSUS39_Start_EWI] [int] NULL,
	[DN_BEHSUS69_ANYRAWDP] [int] NULL,
	[DN_BEHSUS69_2RAWDP] [int] NULL,
	[DN_BEHSUS69_StartEWI_EndNoEWI] [int] NULL,
	[DN_BEHSUS69_RawImp] [int] NULL,
	[DN_BEHSUS69_Start_EWI] [int] NULL,
	[ELACG_SKILL_DESCRIPTION] [varchar](255) NULL,
	[ELACG_PRE_INTERVAL] [varchar](255) NULL,
	[ELACG_PRE_DATE] [date] NULL,
	[ELACG_PRE_VALUE] [varchar](255) NULL,
	[ELACG_PRE_VALUE_NUM_LOCAL] [varchar](255) NULL,
	[ELACG_PRE_VALUE_NUM_NORM] [varchar](255) NULL,
	[ELACG_PRE_SCALE_LOCAL] [varchar](255) NULL,
	[ELACG_PRE_SCALE_NORM] [varchar](255) NULL,
	[ELACG_PRE_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[ELACG_PRE_SCALE_NORM_RANK] [varchar](255) NULL,
	[ELACG_MY_INTERVAL] [varchar](255) NULL,
	[ELACG_MY_DATE] [date] NULL,
	[ELACG_MY_VALUE] [varchar](255) NULL,
	[ELACG_MY_VALUE_NUM_LOCAL] [varchar](255) NULL,
	[ELACG_MY_VALUE_NUM_NORM] [varchar](255) NULL,
	[ELACG_MY_SCALE_LOCAL] [varchar](255) NULL,
	[ELACG_MY_SCALE_NORM] [varchar](255) NULL,
	[ELACG_MY_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[ELACG_MY_SCALE_NORM_RANK] [varchar](255) NULL,
	[ELACG_POST_INTERVAL] [varchar](255) NULL,
	[ELACG_POST_DATE] [date] NULL,
	[ELACG_POST_VALUE] [varchar](255) NULL,
	[ELACG_POST_VALUE_NUM_LOCAL] [varchar](255) NULL,
	[ELACG_POST_VALUE_NUM_NORM] [varchar](255) NULL,
	[ELACG_POST_SCALE_LOCAL] [varchar](255) NULL,
	[ELACG_POST_SCALE_NORM] [varchar](255) NULL,
	[ELACG_POST_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[ELACG_POST_SCALE_NORM_RANK] [varchar](255) NULL,
	[ELACG_MY_RAWCHANGE] [varchar](255) NULL,
	[ELACG_RAWCHANGE] [varchar](255) NULL,
	[ELACG_MY_RAWCHANGE_NUM_LOCAL] [varchar](255) NULL,
	[ELACG_RAWCHANGE_NUM_LOCAL] [varchar](255) NULL,
	[ELACG_MY_RAWCHANGE_NUM_NORM] [varchar](255) NULL,
	[ELACG_RAWCHANGE_NUM_NORM] [varchar](255) NULL,
	[ELACG_MY_RAWCHANGE_NUM_LOCAL_DEGREE] [varchar](255) NULL,
	[ELACG_RAWCHANGE_NUM_LOCAL_DEGREE] [varchar](255) NULL,
	[ELACG_MY_RAWCHANGE_NUM_NORM_DEGREE] [varchar](255) NULL,
	[ELACG_RAWCHANGE_NUM_NORM_DEGREE] [varchar](255) NULL,
	[ELACG_MY_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[ELACG_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[ELACG_SCALE_CHANGE_LOCAL_DEGREE] [varchar](20) NULL,
	[ELACG_MY_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[ELACG_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[ELACG_SCALE_CHANGE_NORM_DEGREE] [varchar](20) NULL,
	[ELACG_MY_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[ELACG_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[ELACG_MY_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[ELACG_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[ELACG_MY_SOS_MoveOn] [varchar](255) NULL,
	[ELACG_MY_INCGRADELEVEL] [varchar](255) NULL,
	[ELACG_ELACG_anyRawDP] [int] NULL,
	[ELACG_ELACG_2RawDP] [int] NULL,
	[ELACG_ELACG_2LOCAL_PERFLVLDP] [int] NULL,
	[ELACG_ELACG_2NORM_PERFLVLDP] [int] NULL,
	[ELACG_ELACG_StartBelowB] [varchar](255) NULL,
	[ELACG_ELACG_StartOffSlid] [varchar](255) NULL,
	[ELACG_ELACG_IncreaseGradeLevel] [varchar](255) NULL,
	[ELACG_ELACG_SOSMoveON] [varchar](255) NULL,
	[ELACG_StartOnStayOn] [varchar](50) NULL,
	[IOG_ELACG69_anyRawDP] [int] NULL,
	[IOG_ELACG69_2RawDP] [int] NULL,
	[IOG_ELACG69_2LOCAL_PERFLVLDP] [int] NULL,
	[IOG_ELACG69_2NORM_PERFLVLDP] [int] NULL,
	[IOG_ELACG69_StartBelowB] [varchar](255) NULL,
	[IOG_ELACG69_StartOffSlid] [varchar](255) NULL,
	[IOG_ELACG69_IncreaseGradeLevel] [varchar](255) NULL,
	[IOG_ELACG69_SOSMoveON] [varchar](255) NULL,
	[IOG_ELACG69_StartOnStayOn] [varchar](50) NULL,
	[DN_ELACG69_anyRawDP] [int] NULL,
	[DN_ELACG69_2RawDP] [int] NULL,
	[DN_ELACG69_2LOCAL_PERFLVLDP] [int] NULL,
	[DN_ELACG69_2NORM_PERFLVLDP] [int] NULL,
	[DN_ELACG69_StartBelowB] [varchar](255) NULL,
	[DN_ELACG69_StartOffSlid] [varchar](255) NULL,
	[DN_ELACG69_IncreaseGradeLevel] [varchar](255) NULL,
	[DN_ELACG69_SOSMoveON] [varchar](255) NULL,
	[DN_ELACG69_StartOnStayOn] [varchar](50) NULL,
	[MATHCG_SKILL_DESCRIPTION] [varchar](255) NULL,
	[MATHCG_PRE_INTERVAL] [varchar](255) NULL,
	[MATHCG_PRE_DATE] [date] NULL,
	[MATHCG_PRE_VALUE] [varchar](255) NULL,
	[MATHCG_PRE_VALUE_NUM_LOCAL] [varchar](255) NULL,
	[MATHCG_PRE_VALUE_NUM_NORM] [varchar](255) NULL,
	[MATHCG_PRE_SCALE_LOCAL] [varchar](255) NULL,
	[MATHCG_PRE_SCALE_NORM] [varchar](255) NULL,
	[MATHCG_PRE_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[MATHCG_PRE_SCALE_NORM_RANK] [varchar](255) NULL,
	[MATHCG_MY_INTERVAL] [varchar](255) NULL,
	[MATHCG_MY_DATE] [date] NULL,
	[MATHCG_MY_VALUE] [varchar](255) NULL,
	[MATHCG_MY_VALUE_NUM_LOCAL] [varchar](255) NULL,
	[MATHCG_MY_VALUE_NUM_NORM] [varchar](255) NULL,
	[MATHCG_MY_SCALE_LOCAL] [varchar](255) NULL,
	[MATHCG_MY_SCALE_NORM] [varchar](255) NULL,
	[MATHCG_MY_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[MATHCG_MY_SCALE_NORM_RANK] [varchar](255) NULL,
	[MATHCG_POST_INTERVAL] [varchar](255) NULL,
	[MATHCG_POST_DATE] [date] NULL,
	[MATHCG_POST_VALUE] [varchar](255) NULL,
	[MATHCG_POST_VALUE_NUM_LOCAL] [varchar](255) NULL,
	[MATHCG_POST_VALUE_NUM_NORM] [varchar](255) NULL,
	[MATHCG_POST_SCALE_LOCAL] [varchar](255) NULL,
	[MATHCG_POST_SCALE_NORM] [varchar](255) NULL,
	[MATHCG_POST_SCALE_RANK_LOCAL] [varchar](255) NULL,
	[MATHCG_POST_SCALE_NORM_RANK] [varchar](255) NULL,
	[MATHCG_MY_RAWCHANGE] [varchar](255) NULL,
	[MATHCG_RAWCHANGE] [varchar](255) NULL,
	[MATHCG_MY_RAWCHANGE_NUM_LOCAL] [varchar](255) NULL,
	[MATHCG_RAWCHANGE_NUM_LOCAL] [varchar](255) NULL,
	[MATHCG_MY_RAWCHANGE_NUM_NORM] [varchar](255) NULL,
	[MATHCG_RAWCHANGE_NUM_NORM] [varchar](255) NULL,
	[MATHCG_MY_RAWCHANGE_NUM_LOCAL_DEGREE] [varchar](255) NULL,
	[MATHCG_RAWCHANGE_NUM_LOCAL_DEGREE] [varchar](255) NULL,
	[MATHCG_MY_RAWCHANGE_NUM_NORM_DEGREE] [varchar](255) NULL,
	[MATHCG_RAWCHANGE_NUM_NORM_DEGREE] [varchar](255) NULL,
	[MATHCG_MY_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[MATHCG_SCALE_CHANGE_LOCAL] [varchar](255) NULL,
	[MATHCG_SCALE_CHANGE_LOCAL_DEGREE] [varchar](20) NULL,
	[MATHCG_MY_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[MATHCG_SCALE_CHANGE_NORM] [varchar](255) NULL,
	[MATHCG_SCALE_CHANGE_NORM_DEGREE] [varchar](20) NULL,
	[MATHCG_MY_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[MATHCG_SCALE_CHANGE_LOCAL_TEXT] [varchar](255) NULL,
	[MATHCG_MY_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[MATHCG_SCALE_CHANGE_NORM_TEXT] [varchar](255) NULL,
	[MATHCG_MY_SOS_MoveOn] [varchar](255) NULL,
	[MATHCG_MY_INCGRADELEVEL] [varchar](255) NULL,
	[MATHCG_MATHCG_anyRawDP] [int] NULL,
	[MATHCG_MATHCG_2RawDP] [int] NULL,
	[MATHCG_MATHCG_2LOCAL_PERFLVLDP] [int] NULL,
	[MATHCG_MATHCG_2NORM_PERFLVLDP] [int] NULL,
	[MATHCG_MATHCG_StartBelowB] [varchar](255) NULL,
	[MATHCG_MATHCG_StartOffSlid] [varchar](255) NULL,
	[MATHCG_MATHCG_IncreaseGradeLevel] [varchar](255) NULL,
	[MATHCG_MATHCG_SOSMoveON] [varchar](255) NULL,
	[MATHCG_StartOnStayOn] [varchar](255) NULL,
	[IOG_MATHCG69_anyRawDP] [int] NULL,
	[IOG_MATHCG69_2RawDP] [int] NULL,
	[IOG_MATHCG69_2LOCAL_PERFLVLDP] [int] NULL,
	[IOG_MATHCG69_2NORM_PERFLVLDP] [int] NULL,
	[IOG_MATHCG69_StartBelowB] [varchar](255) NULL,
	[IOG_MATHCG69_StartOffSlid] [varchar](255) NULL,
	[IOG_MATHCG69_IncreaseGradeLevel] [varchar](255) NULL,
	[IOG_MATHCG69_SOSMoveON] [varchar](255) NULL,
	[IOG_MATHCG69_StartOnStayOn] [varchar](255) NULL,
	[DN_MATHCG69_anyRawDP] [int] NULL,
	[DN_MATHCG69_2RawDP] [int] NULL,
	[DN_MATHCG69_2LOCAL_PERFLVLDP] [int] NULL,
	[DN_MATHCG69_2NORM_PERFLVLDP] [int] NULL,
	[DN_MATHCG69_StartBelowB] [varchar](255) NULL,
	[DN_MATHCG69_StartOffSlid] [varchar](255) NULL,
	[DN_MATHCG69_IncreaseGradeLevel] [varchar](255) NULL,
	[DN_MATHCG69_SOSMoveON] [varchar](255) NULL,
	[DN_MATHCG69_StartOnStayOn] [varchar](255) NULL,
	[SAYOY_NewCYID_Pre] [nvarchar](255) NULL,
	[SAYOY_ResponseID_Pre] [float] NULL,
	[SAYOY_ResponseID_Post] [float] NULL,
	[SAYOY_DateSubmitted_Pre] [datetime] NULL,
	[SAYOY_DateSubmitted_Post] [datetime] NULL,
	[SAYOY_Survey_Language_Pre] [float] NULL,
	[SAYOY_PE_1_Friendly_ALL_Pre] [float] NULL,
	[SAYOY_PE_1_Teasing_ALL_Pre] [float] NULL,
	[SAYOY_PE_1_Respect_ALL_Pre] [float] NULL,
	[SAYOY_PE_2_Friends_ALL_Pre] [float] NULL,
	[SAYOY_PE_2_Upset_ALL_Pre] [float] NULL,
	[SAYOY_PE_2_Listen_ALL_Pre] [float] NULL,
	[SAYOY_PE_3_LikeComing_ALL_Pre] [float] NULL,
	[SAYOY_PE_3_Fun_ALL_Pre] [float] NULL,
	[SAYOY_PE_3_Bored_ALL_Pre] [float] NULL,
	[SAYOY_PE_3_ThingsToDo_ALL_Pre] [float] NULL,
	[SAYOY_PE_4_LearnNew_ALL_Pre] [float] NULL,
	[SAYOY_PE_4_Challenged_ALL_Pre] [float] NULL,
	[SAYOY_PE_4_NeverBefore_ALL_Pre] [float] NULL,
	[SAYOY_PE_5_InterestedAdult_ALL_Pre] [float] NULL,
	[SAYOY_PE_5_AdultUpset_ALL_Pre] [float] NULL,
	[SAYOY_PE_5_AdultHelp_ALL_Pre] [float] NULL,
	[SAYOY_PE_5_AdultListen_ALL_Pre] [float] NULL,
	[SAYOY_PE_6_Teacher_ALL_Pre] [float] NULL,
	[SAYOY_PE_6_Principal_ALL_Pre] [datetime] NULL,
	[SAYOY_PE_6_CityYear_ALL_Pre] [float] NULL,
	[SAYOY_PE_6_Counselor_ALL_Pre] [float] NULL,
	[SAYOY_PE_6_Coach_ALL_Pre] [float] NULL,
	[SAYOY_PE_6_Other_ALL_Pre] [float] NULL,
	[SAYOY_PE_6_Other_TEXT_ALL_Pre] [nvarchar](255) NULL,
	[SAYOY_SC_7_TryNew_ALL_Pre] [float] NULL,
	[SAYOY_SC_7_GoodInSchool_ALL_Pre] [float] NULL,
	[SAYOY_SC_7_ProblemSolving_ALL_Pre] [float] NULL,
	[SAYOY_SC_7_GoodLearning_ALL_Pre] [float] NULL,
	[SAYOY_SC_7_TryUntilGetIt_ALL_Pre] [float] NULL,
	[SAYOY_SC_8_EasyGetAlong_ALL_Pre] [float] NULL,
	[SAYOY_SC_8_LikedNew_ALL_Pre] [float] NULL,
	[SAYOY_SC_8_GetAlongOthers_ALL_Pre] [float] NULL,
	[SAYOY_SC_8_EasyJoin_ALL_Pre] [float] NULL,
	[SAYOY_FPE_9_Older_ALL_Pre] [float] NULL,
	[SAYOY_FPE_9_College_ALL_Pre] [float] NULL,
	[SAYOY_FPE_9_Interests_ALL_Pre] [float] NULL,
	[SAYOY_FPE_9_LifeGoals_ALL_Pre] [float] NULL,
	[SAYOY_FPE_10_Parent_ALL_Pre] [float] NULL,
	[SAYOY_FPE_10_Teacher_ALL_Pre] [float] NULL,
	[SAYOY_FPE_10_Counselor_ALL_Pre] [float] NULL,
	[SAYOY_FPE_10_CityYear_ALL_Pre] [float] NULL,
	[SAYOY_FPE_11_HighSchool_ALL_Pre] [float] NULL,
	[SAYOY_FPE_11_Graduate_ALL_Pre] [float] NULL,
	[SAYOY_FPE_11_College_ALL_Pre] [float] NULL,
	[SAYOY_FPE_12_TryHard_ALL_Pre] [float] NULL,
	[SAYOY_FPE_12_TellMyself_ALL_Pre] [float] NULL,
	[SAYOY_FPE_12_GetHelp_ALL_Pre] [float] NULL,
	[SAYOY_FPE_12_SetGoals_ALL_Pre] [float] NULL,
	[SAYOY_PE_1_Friendly_ALL_Post] [float] NULL,
	[SAYOY_PE_1_Teasing_ALL_Post] [float] NULL,
	[SAYOY_PE_1_Respect_ALL_Post] [float] NULL,
	[SAYOY_PE_2_Friends_ALL_Post] [float] NULL,
	[SAYOY_PE_2_Upset_ALL_Post] [float] NULL,
	[SAYOY_PE_2_Listen_ALL_Post] [float] NULL,
	[SAYOY_PE_3_LikeComing_ALL_Post] [float] NULL,
	[SAYOY_PE_3_Fun_ALL_Post] [float] NULL,
	[SAYOY_PE_3_Bored_ALL_Post] [float] NULL,
	[SAYOY_PE_3_ThingsToDo_ALL_Post] [float] NULL,
	[SAYOY_PE_4_LearnNew_ALL_Post] [float] NULL,
	[SAYOY_PE_4_Challenged_ALL_Post] [float] NULL,
	[SAYOY_PE_4_NeverBefore_ALL_Post] [float] NULL,
	[SAYOY_PE_5_InterestedAdult_ALL_Post] [float] NULL,
	[SAYOY_PE_5_AdultUpset_ALL_Post] [float] NULL,
	[SAYOY_PE_5_AdultHelp_ALL_Post] [float] NULL,
	[SAYOY_PE_5_AdultListen_ALL_Post] [float] NULL,
	[SAYOY_PE_6_Teacher_ALL_Post] [float] NULL,
	[SAYOY_PE_6_Principal_ALL_Post] [float] NULL,
	[SAYOY_PE_6_CityYear_ALL_Post] [float] NULL,
	[SAYOY_PE_6_Counselor_ALL_Post] [float] NULL,
	[SAYOY_PE_6_Coach_ALL_Post] [float] NULL,
	[SAYOY_PE_6_Other_ALL_Post] [float] NULL,
	[SAYOY_PE_6_Other_TEXT_ALL_Post] [nvarchar](255) NULL,
	[SAYOY_SC_7_TryNew_ALL_Post] [float] NULL,
	[SAYOY_SC_7_GoodInSchool_ALL_Post] [float] NULL,
	[SAYOY_SC_7_ProblemSolving_ALL_Post] [float] NULL,
	[SAYOY_SC_7_GoodLearning_ALL_Post] [float] NULL,
	[SAYOY_SC_7_TryUntilGetIt_ALL_Post] [float] NULL,
	[SAYOY_SC_8_EasyGetAlong_ALL_Post] [float] NULL,
	[SAYOY_SC_8_LikedNew_ALL_Post] [float] NULL,
	[SAYOY_SC_8_GetAlongOthers_ALL_Post] [float] NULL,
	[SAYOY_SC_8_EasyJoin_ALL_Post] [float] NULL,
	[SAYOY_FPE_9_Older_ALL_Post] [float] NULL,
	[SAYOY_FPE_9_College_ALL_Post] [float] NULL,
	[SAYOY_FPE_9_Interests_ALL_Post] [float] NULL,
	[SAYOY_FPE_9_LifeGoals_ALL_Post] [float] NULL,
	[SAYOY_FPE_10_Parent_ALL_Post] [float] NULL,
	[SAYOY_FPE_10_Teacher_ALL_Post] [float] NULL,
	[SAYOY_FPE_10_Counselor_ALL_Post] [float] NULL,
	[SAYOY_FPE_10_CityYear_ALL_Post] [float] NULL,
	[SAYOY_FPE_11_HighSchool_ALL_Post] [float] NULL,
	[SAYOY_FPE_11_Graduate_ALL_Post] [float] NULL,
	[SAYOY_FPE_11_College_ALL_Post] [float] NULL,
	[SAYOY_FPE_12_TryHard_ALL_Post] [float] NULL,
	[SAYOY_FPE_12_TellMyself_ALL_Post] [float] NULL,
	[SAYOY_FPE_12_GetHelp_ALL_Post] [float] NULL,
	[SAYOY_FPE_12_SetGoals_ALL_Post] [float] NULL,
	[SAYOY_PE_1_Teasing_ALL_Pre_RC] [float] NULL,
	[SAYOY_PE_3_Bored_ALL_Pre_RC] [float] NULL,
	[SAYOY_PE_1_Teasing_ALL_Post_RC] [float] NULL,
	[SAYOY_PE_3_Bored_ALL_Post_RC] [float] NULL,
	[SAYOY_PE_1_ALL_Pre] [float] NULL,
	[SAYOY_PE_2_ALL_Pre] [float] NULL,
	[SAYOY_PE_4_ALL_Pre] [float] NULL,
	[SAYOY_PE_5_ALL_Pre] [float] NULL,
	[SAYOY_SC_7_ALL_Pre] [float] NULL,
	[SAYOY_SC_8_ALL_Pre] [float] NULL,
	[SAYOY_FPE_9_ALL_Pre] [float] NULL,
	[SAYOY_FPE_11_ALL_Pre] [float] NULL,
	[SAYOY_FPE_12_ALL_Pre] [float] NULL,
	[SAYOY_PE_1_ALL_Post] [float] NULL,
	[SAYOY_PE_2_ALL_Post] [float] NULL,
	[SAYOY_PE_4_ALL_Post] [float] NULL,
	[SAYOY_PE_5_ALL_Post] [float] NULL,
	[SAYOY_SC_7_ALL_Post] [float] NULL,
	[SAYOY_SC_8_ALL_Post] [float] NULL,
	[SAYOY_FPE_9_ALL_Post] [float] NULL,
	[SAYOY_FPE_11_ALL_Post] [float] NULL,
	[SAYOY_FPE_12_ALL_Post] [float] NULL,
	[SAYOY_PE_1_ALL_Pre_Category] [float] NULL,
	[SAYOY_PE_2_ALL_Pre_Category] [float] NULL,
	[SAYOY_PE_3_ALL_Pre_Category] [float] NULL,
	[SAYOY_PE_4_ALL_Pre_Category] [float] NULL,
	[SAYOY_PE_5_ALL_Pre_Category] [float] NULL,
	[SAYOY_SC_7_ALL_Pre_Category] [float] NULL,
	[SAYOY_SC_8_ALL_Pre_Category] [float] NULL,
	[SAYOY_FPE_9_ALL_Pre_Category] [float] NULL,
	[SAYOY_FPE_11_ALL_Pre_Category] [float] NULL,
	[SAYOY_FPE_12_ALL_Pre_Category] [float] NULL,
	[SAYOY_PE_1_ALL_Post_Category] [float] NULL,
	[SAYOY_PE_2_ALL_Post_Category] [float] NULL,
	[SAYOY_PE_3_ALL_Post_Category] [float] NULL,
	[SAYOY_PE_4_ALL_Post_Category] [float] NULL,
	[SAYOY_PE_5_ALL_Post_Category] [float] NULL,
	[SAYOY_SC_7_ALL_Post_Category] [float] NULL,
	[SAYOY_SC_8_ALL_Post_Category] [float] NULL,
	[SAYOY_FPE_9_ALL_Post_Category] [float] NULL,
	[SAYOY_FPE_11_ALL_Post_Category] [float] NULL,
	[SAYOY_FPE_12_ALL_Post_Category] [float] NULL,
	[SAYOY_AC_MET_IMP] [float] NULL,
	[SAYOY_PE_3_ALL_Post] [float] NULL,
	[SAYOY_AC_Start_Below] [float] NULL,
	[SAYOY_PE_3_ALL_Pre] [float] NULL,
	[ATT_WEEKSENROLLED] [varchar](17) NULL,
	[BEH_WEEKSENROLLED] [varchar](17) NULL,
	[LITERACY_DOSAGECATEGORY] [varchar](17) NULL,
	[MATH_DOSAGECATEGORY] [varchar](17) NULL,
	[UNIQUEFL] [int] NULL,
	[OFFICIALFLLIT] [int] NULL,
	[OFFICIALFLMTH] [int] NULL,
	[OFFICIALFLATT] [int] NULL,
	[OFFICIALFLBEH] [int] NULL,
	[TotalNumFL] [int] NULL,
	[NOTOFFICIALFLLIT] [int] NULL,
	[NOTOFFICIALFLMTH] [int] NULL,
	[NOTOFFICIALFLATT] [int] NULL,
	[NOTOFFICIALFLBEH] [int] NULL,
	[PARTICIPATE_AFTERSCHOOL] [int] NULL,
	[NOTFLATTMET56DOSE] [int] NULL,
	[NOTFLBEHMET56DOSE] [int] NULL,
	[FLATTMET56DOSE] [int] NULL,
	[FLBEHMET56DOSE] [int] NULL,
	[FLLITMETMONTHLYDOSE] [int] NULL,
	[FLMTHMETMONTHLYDOSE] [int] NULL,
	[NOTFLLITMETMONTHLYDOSE] [int] NULL,
	[NOTFLMTHMETMONTHLYDOSE] [int] NULL,
	[FLATTMET56DOSE1DP] [int] NULL,
	[FLATTMET56DOSE2DP] [int] NULL,
	[ACREPORTGRADE_ACADEMIC] [int] NULL,
	[ACREPORTGRADE_ENGAGEMENT] [int] NULL,
	[ACDOSAGEGOALLIT] [int] NULL,
	[ACDOSAGEGOALMTH] [int] NULL,
	[ACLITOFFICIALFL] [int] NULL,
	[ACMTHOFFICIALFL] [int] NULL,
	[ACTUAL_ED1_ACAD] [int] NULL,
	[ACLITMETACDOSE] [int] NULL,
	[ACMTHMETACDOSE] [int] NULL,
	[ACTUAL_ED2_ACAD] [int] NULL,
	[ACTUAL_ED5_ACAD_LIT] [int] NULL,
	[ACTUAL_ED5_ACAD_MTH] [int] NULL,
	[ACTUAL_ED5_ACAD] [int] NULL,
	[ACATTOFFICIALFL] [int] NULL,
	[ACTUAL_ED1_ENGAGE_ATT] [int] NULL,
	[ACATTMET56DOSE] [int] NULL,
	[ACTUAL_ED2_ENGAGE_ATT] [int] NULL,
	[ACTUAL_ED27_ENGAGE_ATT] [int] NULL,
	[ACBEHOFFICIALFL] [int] NULL,
	[ACTUAL_ED1_ENGAGE_BEH] [int] NULL,
	[ACBEHMET56DOSE] [int] NULL,
	[ACTUAL_ED2_ENGAGE_BEH] [int] NULL,
	[ACTUAL_ED27_ENGAGE_BEH] [int] NULL,
	[ACTUAL_ED27_ENGAGE_BEH_SAYODENOMINATOR] [int] NULL,
	[flcombo] [varchar](50) NULL,
	[ela_literacy_anyrawdp] [varchar](100) NULL,
	[ela_literacy_2rawdp] [varchar](100) NULL,
	[math_anyrawdp] [varchar](100) NULL,
	[Math_2rawdp] [varchar](100) NULL,
	[Beh_anyrawdp] [varchar](100) NULL,
	[Beh_2rawdp] [varchar](100) NULL
) ON [PRIMARY]

GO
