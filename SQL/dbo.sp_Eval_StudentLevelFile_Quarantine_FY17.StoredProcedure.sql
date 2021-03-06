USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Eval_StudentLevelFile_Quarantine_FY17]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Eval_StudentLevelFile_Quarantine_FY17]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/*Join dosage and enrollment information from tables 3 and 8, create dummy variables for program enrollment*/
SELECT	b.PROGRAM_DESC, 
		b.INDICATOR_AREA_DESC, 
		a.TTL_TIME, 
		b.CYSCHOOLHOUSE_STUDENT_ID, 
		b.SITE_NAME, 
		b.SCHOOL_NAME, 
		b.FIRST_INTERVENTION, 
		b.LAST_INTERVENTION, 
		B.ENROLLED_DAYS
INTO #LEVEL1
FROM [ReportCYData_Prod_17].[dbo].[8_RPT_STUDENT_TIME_LINEAR] a
FULL OUTER JOIN [ReportCYData_Prod_17].[dbo].[3_RPT_STUDENT_ENROLLMENT_WIP] b
on		a.PROGRAM_DESC = b.PROGRAM_DESC AND 
		a.INDICATOR_AREA_DESC=b.INDICATOR_AREA_DESC AND 
		a.FISCAL_YEAR=b.FISCAL_YEAR AND 
		a.CYSCHOOLHOUSE_STUDENT_ID=b.CYSCHOOLHOUSE_STUDENT_ID

		/*get min and max enrollment dates by program*/
		select cyschoolhouse_student_id, program_desc, datediff(d, min(first_intervention), max(last_intervention)) as programdatediff
		into #programdatediff
		from [ReportCYData_Prod_17].[dbo].[3_RPT_STUDENT_ENROLLMENT_WIP]
		group by cyschoolhouse_student_id, program_desc

		/*join program datediff back to program enrollment information to determine if students were enrolled for 1+ days*/
		select a.*,
		CASE WHEN b.programdatediff>0 and  a.PROGRAM_DESC = 'Tutoring: Math' THEN 1 ELSE 0 END AS MATH_TUTORING,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Tutoring: Literacy' THEN 1 ELSE 0 END AS LITERACY_TUTORING,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = '50 Acts of Leadership' THEN 1 ELSE 0 END AS LEADERSHIP_50ACTS,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Attendance Check in Check Out' THEN 1 ELSE 0 END AS ATT_CICO,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Coaching: Attendance' THEN 1 ELSE 0 END AS ATTENDANCE_COACHING,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = '50 Acts of Greatness' THEN 1 ELSE 0 END AS GREATNESS_50ACTS,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Coaching: Behavior (Local)' THEN 1 ELSE 0 END AS BEHAVIOR_COACHING,
		CASE WHEn b.programdatediff>0 and a.PROGRAM_DESC = 'SEL Check in Check Out' THEN 1 ELSE 0 END AS BEH_CICO,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Enrichment' THEN 1 ELSE 0 END AS ENRICHMENT,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Homework Assistance' THEN 1 ELSE 0 END AS HOMEWORK_ASSISTANCE, 
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Starfish Corps' THEN 1 ELSE 0 END AS STARFISH_CORPS,
		CASE WHEN b.programdatediff>0 and a.PROGRAM_DESC = 'Afterschool Heroes' THEN 1 ELSE 0 END AS AFTERSCHOOL_HEROES 
		 into #level1a from #level1 a
		left join #programdatediff b
		on a.cyschoolhouse_student_id=b.cyschoolhouse_student_id and a.program_desc=b.program_desc


/*Aggregrate the joined dosage and enrollment information from program-level to indicator area level*/
SELECT	SITE_NAME, 
		SCHOOL_NAME, 
		CYSCHOOLHOUSE_STUDENT_ID, 
		INDICATOR_AREA_DESC, 
		SUM(TTL_TIME) as TotalDosage, 
		MIN(FIRST_INTERVENTION) as EnrollDateEarliest, 
		MAX(LAST_INTERVENTION) as ExitDateLatest, 
		MAX (MATH_TUTORING) AS MATH_TUTORING, 
		MAX (LITERACY_TUTORING) AS LITERACY_TUTORING, 
		MAX (LEADERSHIP_50ACTS) AS LEADERSHIP_50ACTS,
		MAX (ATTENDANCE_COACHING) AS ATTENDANCE_COACHING, 
		MAX(GREATNESS_50ACTS) AS GREATNESS_50ACTS,
		MAX (BEHAVIOR_COACHING) AS BEHAVIOR_COACHING, 
		MAX(ENRICHMENT) AS ENRICHMENT, 
		MAX(HOMEWORK_ASSISTANCE) AS HOMEWORK_ASSISTANCE,
		MAX (STARFISH_CORPS) AS STARFISH_CORPS, 
		MAX (AFTERSCHOOL_HEROES) AS AFTERSCHOOL_HEROES, 
		MAX(ATT_CICO) AS ATT_CICO, 
		MAX(BEH_CICO) AS BEH_CICO
INTO #LEVEL2
FROM #LEVEL1a
GROUP BY SITE_NAME, SCHOOL_NAME, CYSCHOOLHOUSE_STUDENT_ID, INDICATOR_AREA_DESC

/*Create dosage and enrollment variables by indicator area*/
SELECT	*,
		CASE WHEN INDICATOR_AREA_DESC = 'ELA/Literacy' then TOTALDOSAGE ELSE NULL END AS TOTALDOSAGELIT,
		CASE WHEN INDICATOR_AREA_DESC = 'Math' then TOTALDOSAGE ELSE NULL END AS TOTALDOSAGEMTH,
		CASE WHEN INDICATOR_AREA_DESC = 'Attendance' THEN TOTALDOSAGE ELSE NULL END AS TOTALDOSAGEATT,
		CASE WHEN INDICATOR_AREA_DESC = 'Behavior' THEN TOTALDOSAGE ELSE NULL END AS TOTALDOSAGEBEH,
		CASE WHEN INDICATOR_AREA_DESC = 'Non-specific IA' THEN TOTALDOSAGE ELSE NULL END AS TOTALDOSAGEOTH,
		CASE WHEN INDICATOR_AREA_DESC = 'ELA/Literacy' then ENROLLDATEEARLIEST ELSE NULL END AS LITENROLLDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'ELA/Literacy' then EXITDATELatest ELSE NULL END AS LITEXITDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Math' then ENROLLDATEEARLIEST ELSE NULL END AS MTHENROLLDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Math' then EXITDATELatest ELSE NULL END AS MTHEXITDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Attendance' then ENROLLDATEEARLIEST ELSE NULL END AS ATTENROLLDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Attendance' then EXITDATELatest ELSE NULL END AS ATTEXITDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Behavior' then ENROLLDATEEARLIEST ELSE NULL END AS BEHENROLLDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Behavior' then EXITDATELatest ELSE NULL END AS BEHEXITDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Non-specific IA' then ENROLLDATEEARLIEST ELSE NULL END AS OTHENROLLDATE,
		CASE WHEN INDICATOR_AREA_DESC = 'Non-specific IA' then EXITDATELatest ELSE NULL END AS OTHEXITDATE
INTO #LEVEL3
FROM #LEVEL2

/*GROUP BY STUDENT*/
SELECT	SITE_NAME, 
		SCHOOL_NAME, 
		CYSCHOOLHOUSE_STUDENT_ID, 
		MAX(MATH_TUTORING) AS MATH_TUTORING, 
		MAX(LITERACY_TUTORING) AS LITERACY_TUTORING, 
		MAX(LEADERSHIP_50ACTS) AS LEADERSHIP_50ACTS, 
		MAX(ATTENDANCE_COACHING) AS ATTENDANCE_COACHING,
		MAX(GREATNESS_50ACTS) AS GREATNESS_50ACTS, 
		MAX(BEHAVIOR_COACHING) AS BEHAVIOR_COACHING, 
		MAX(ENRICHMENT) AS ENRICHMENT,
		MAX(HOMEWORK_ASSISTANCE) AS HOMEWORK_ASSISTANCE, 
		MAX(STARFISH_CORPS) AS STARFISH_CORPS, 
		MAX(AFTERSCHOOL_HEROES) AS AFTERSCHOOL_HEROES, 
		max(ATT_CICO) as ATT_CICO, 
		max(beh_CICO) as BEH_CICO, 
		MAX(TOTALDOSAGELIT) AS TOTALDOSAGELIT, 
		MAX(TOTALDOSAGEMTH) AS TOTALDOSAGEMTH, 
		max(totaldosageatt) as totaldosageatt, 
		max(totaldosagebeh) as totaldosagebeh, 
		MAX(TOTALDOSAGEOTH) as TOTALDOSAGEOTH, 
		MAX(LITENROLLDATE) as LITENROLLDATE, 
		MAX(LITEXITDATE) as LITEXITDATE, 
		MAX(MTHENROLLDATE) as MTHENROLLDATE,
		MAX(MTHEXITDATE) as MTHEXITDATE, 
		MAX(ATTENROLLDATE) as ATTENROLLDATE, 
		MAX(ATTEXITDATE) as ATTEXITDATE, 
		MAX(BEHENROLLDATE) AS BEHENROLLDATE,
		MAX(BEHEXITDATE) AS BEHEXITDATE,
		MAX(OTHENROLLDATE) as OTHENROLLDATE, 
		MAX(OTHEXITDATE) as OTHEXITDATE 
INTO #LEVEL4
FROM #LEVEL3
GROUP BY SITE_NAME, SCHOOL_NAME, CYSCHOOLHOUSE_STUDENT_ID


/*Join student-level dosage and enrollement information with student info from Student Main and school info from School Main*/
SELECT	G.CYSCHOOLHOUSE_STUDENT_ID, 
		g.FIRST_NAME, 
		g.MIDDLE_NAME,
		g.LAST_NAME,  
		g.CYCHANNEL_SCHOOL_ACCOUNT_NBR, 
		g.GENDER, 
		g.GRADE_ID, 
		CASE WHEN G.GRADE_ID= 'K' THEN 0 WHEN G.GRADE_ID = 'PK' THEN -1 WHEN G.GRADE_ID = 'UN Ungraded' then 9999 ELSE GRADE_ID END AS GRADE_ID_NUMERIC, 
		g.ATTENDANCE_IA, 
		g.ELA_IA, 
		g.MATH_IA, 
		g.BEHAVIOR_IA, 
		g.FISCAL_YEAR, 
		g.ELL, 
		g.RACE_ETHNICITY, 
		g.STUDENT_DISTRICT_ID, 
		g.CYSCHOOLHOUSE_SCHOOL_ID, 
		g.ELA_PRIMARY_CM_SF_ID,
        g.ELA_PRIMARY_CM_NAME,
		g.ELA_PRIMARY_CM_EMAIL,
		g.MATH_PRIMARY_CM_SF_ID,
        g.MATH_PRIMARY_CM_NAME,
		g.MATH_PRIMARY_CM_EMAIL,
        g.ATT_PRIMARY_CM_SF_ID,
        g.ATT_PRIMARY_CM_NAME,
		g.ATT_PRIMARY_CM_EMAIL,
        g.BEH_PRIMARY_CM_SF_ID,
        g.BEH_PRIMARY_CM_NAME,
		g.BEH_PRIMARY_CM_EMAIL,
		h.DIPLOMAS_NOW_SCHOOL, 
		h.site_name, 
		h.school_name, 
		h.region_name,
		h.CY_CHANNEL_SF_ID, 
		f.MATH_TUTORING,	
		f.LITERACY_TUTORING,	
		f.LEADERSHIP_50ACTS,	
		f.ATTENDANCE_COACHING,	
		f.GREATNESS_50ACTS,	
		f.BEHAVIOR_COACHING,	
		f.ENRICHMENT,	
		f.HOMEWORK_ASSISTANCE,	
		f.STARFISH_CORPS,	
		f.AFTERSCHOOL_HEROES, 
		F.ATT_CICO, 
		F.BEH_CICO,	
		case when f.LEADERSHIP_50ACTS=1 or f.GREATNESS_50ACTS=1 or f.BEHAVIOR_COACHING=1 or F.BEH_CICO=1 then 1 end as BEHAVIOR_ENROLLED,
		case when f.ATTENDANCE_COACHING =1 or F.ATT_CICO=1 then 1 end as ATTENDANCE_ENROLLED,
		CASE WHEN F.STARFISH_CORPS=1 OR f.AFTERSCHOOL_HEROES=1 OR f.HOMEWORK_ASSISTANCE =1 OR f.ENRICHMENT =1 THEN 1 END AS AFTERSCHOOL_ENROLLED,
		f.TOTALDOSAGELIT,	
		f.TOTALDOSAGEMTH,	
		f.TOTALDOSAGEOTH, 
		f.totaldosageatt, 
		f.totaldosagebeh,
		f.TOTALDOSAGELIT*1.0/60 as TOTALDOSAGELITHRS,	
		f.TOTALDOSAGEMTH*1.0/60 as TOTALDOSAGEMTHHRS,		
		f.TOTALDOSAGEOTH*1.0/60 as TOTALDOSAGEOTHHRS,	
		f.totaldosageatt*1.0/60 as TOTALDOSAGEATTHRS,	 
		f.totaldosagebeh*1.0/60 as TOTALDOSAGEBEHHRS,	
		round(f.totaldosagelit*1.0/60,0) as TOTALDOSAGELITHRSROUND,
		round(f.totaldosageMTH*1.0/60,0) as TOTALDOSAGEMTHHRSROUND,
		datediff(d, litenrolldate, litexitdate) as ENROLLEDDAYSLIT,
		datediff(d, mthenrolldate, mthexitdate) as enrolleddaysmth,
		datediff(d, attenrolldate, attexitdate) as enrolleddaysatt,
		datediff(d, behenrolldate, behexitdate) as enrolleddaysbeh,
		datediff(d, othenrolldate, othexitdate) as enrolleddaysoth,
		case when 	datediff(d, attenrolldate, attexitdate) >=56 then 1
		     when datediff(d, attenrolldate, attexitdate) <56 then 0 else null end as ATTMET56DOSE,
		CASE WHEN datediff(d, behenrolldate, behexitdate) >=56 THEN 1
			WHEN datediff(d, behenrolldate, behexitdate) <56 THEN 0 ELSE NULL END AS BEHMET56DOSE,
		case when datediff(d, litenrolldate, litexitdate)>0 and ela_ia=1 then 1 
		     when datediff(d, litenrolldate, litexitdate)>0 and ela_ia=0 then 0 else null end as OFFICIALFLLIT,
		case when datediff(d, mthenrolldate, mthexitdate)>0 and MATH_ia=1 then 1 
		     when datediff(d, mthenrolldate, mthexitdate)>0 and MATH_ia=0 then 0 else null end as OFFICIALFLMTH,
	case when datediff(d, attenrolldate, attexitdate)>0 and ATTENDANCE_ia=1 then 1 
		     when datediff(d, attenrolldate, attexitdate)>0 and ATTENDANCE_ia=0 then 0 else null end as OFFICIALFLATT,
		case when datediff(d, behenrolldate, behexitdate)>0 and BEHAVIOR_ia=1 then 1 
		     when datediff(d, behenrolldate, behexitdate)>0 and BEHAVIOR_ia=0 then 0 else null end as OFFICIALFLBEH,
		CASE 
		 WHEN totaldosagelit*1.0/60>= h.PrMnth_Literacy_Dosage_Target then 1
		 WHEN totaldosagelit*1.0/60< h.PrMnth_Literacy_Dosage_Target then 0 ELSE NULL END AS METPrMONTHLYLITDOSAGEGOAL,
		CASE when totaldosagemth*1.0/60>=h.PrMnth_Math_Dosage_Target then 1
			 when totaldosagemth*1.0/60< h.PrMnth_Math_Dosage_Target then 0 ELSE NULL END AS METPrMONTHLYMTHDOSAGEGOAL,
		 CASE when totaldosagelit*1.0/60>=h.CurrMnth_Literacy_Dosage_Target then 1
		      when  totaldosagelit*1.0/60<h.CurrMnth_Literacy_Dosage_Target then 0 ELSE NULL END AS METCurrMONTHLYLITDOSAGEGOAL,
		case when totaldosagemth*1.0/60>=h.CurrMnth_Math_Dosage_Target then 1
		when totaldosagemth*1.0/60<h.CurrMnth_Math_Dosage_Target then 0 ELSE NULL END AS METCurrMONTHLYMTHDOSAGEGOAL,

		 /*WHEN month(GETDATE()) = 10 and year(getdate())=2016 and  totaldosagemth*1.0/60>= OCT_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 10 and  year(getdate())=2016 and totaldosagemth*1.0/60< OCT_MTH_DosageGoal then 0
		  WHEN month(GETDATE()) = 11 and year(getdate())=2016 and  totaldosagemth*1.0/60>= NOV_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 11 and  year(getdate())=2016 and totaldosagemth*1.0/60< NOV_MTH_DosageGoal then 0 
		 WHEN month(GETDATE()) = 12 and  year(getdate())=2016 and totaldosagemth*1.0/60>= DEC_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 12 and  year(getdate())=2016 and totaldosagemth*1.0/60< DEC_MTH_DosageGoal then 0
		 WHEN month(GETDATE()) = 01 and year(getdate())=2017 and   totaldosagemth*1.0/60>= JAN_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 01 and year(getdate())=2017 and   totaldosagemth*1.0/60< JAN_MTH_DosageGoal then 0 
		 WHEN month(GETDATE()) = 02 and year(getdate())=2017 and   totaldosagemth*1.0/60>= FEB_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 02 and year(getdate())=2017 and   totaldosagemth*1.0/60< FEB_MTH_DosageGoal then 0
		  WHEN month(GETDATE()) = 03 and  year(getdate())=2017 and  totaldosagemth*1.0/60>= MAR_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 03 and year(getdate())=2017 and   totaldosagemth*1.0/60< MAR_MTH_DosageGoal then 0 
		 WHEN month(GETDATE()) = 04 and year(getdate())=2017 and   totaldosagemth*1.0/60>= APR_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 04 and year(getdate())=2017 and   totaldosagemth*1.0/60< APR_MTH_DosageGoal then 0
		   WHEN month(GETDATE()) = 05 and year(getdate())=2017 and   totaldosagemth*1.0/60>= MAY_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) = 05 and  year(getdate())=2017 and  totaldosagemth*1.0/60< MAY_MTH_DosageGoal then 0 
		 WHEN month(GETDATE()) >= 06 and  year(getdate())>=2017 and  totaldosagemth*1.0/60>= JUN_MTH_DosageGoal then 1
		 WHEN month(GETDATE()) >= 06 and year(getdate())>=2017 and   totaldosagemth*1.0/60< JUN_MTH_DosageGoal then 0*/
		f.LITENROLLDATE,	
		f.LITEXITDATE,	
		f.MTHENROLLDATE,	
		f.MTHEXITDATE,	
		f.ATTENROLLDATE,	
		f.ATTEXITDATE,	
		F.BEHENROLLDATE,
		F.BEHEXITDATE,
		f.OTHENROLLDATE,	
		f.OTHEXITDATE,  
		h.[AUG_ELA_DosageGoal],
h.[SEP_ELA_DosageGoal],
h.[OCT_ELA_DosageGoal],
h.[NOV_ELA_DosageGoal],
h.[DEC_ELA_DosageGoal],
h.[JAN_ELA_DosageGoal],
h.[FEB_ELA_DosageGoal],
h.[MAR_ELA_DosageGoal],
h.[APR_ELA_DosageGoal],
h.[MAY_ELA_DosageGoal],
h.[JUN_ELA_DosageGoal],
h.[AUG_MTH_DosageGoal],
h.[SEP_MTH_DosageGoal],
h.[OCT_MTH_DosageGoal],
h.[NOV_MTH_DosageGoal],
h.[DEC_MTH_DosageGoal],
h.[JAN_MTH_DosageGoal],
h.[FEB_MTH_DosageGoal],
h.[MAR_MTH_DosageGoal],
h.[APR_MTH_DosageGoal],
h.[MAY_MTH_DosageGoal],
h.[JUN_MTH_DosageGoal],
h.[Q1_ELA_EnrollGoal (3-9)],
h.[Q1_ELA_EnrollGoal (All Grades)],
h.[Q2_ELA_EnrollGoal (3-9)],
h.[Q2_ELA_EnrollGoal (All Grades)],
h.[Q3_ELA_EnrollGoal (3-9)],
h.[Q3_ELA_EnrollGoal (All Grades)],
h.[ELA_FinalEnrollGoal (3-9)],
h.[ELA_FinalEnrollGoal (All Grades)],
h.[Q1_MTH_EnrollGoal (3-9)],
h.[Q1_MTH_EnrollGoal (All Grades)],
h.[Q2_MTH_EnrollGoal (3-9)],
h.[Q2_MTH_EnrollGoal (All Grades)],
h.[Q3_MTH_EnrollGoal (3-9)],
h.[Q3_MTH_EnrollGoal (All Grades)],
h.[MTH_FinalEnrollGoal (3-9)],
h.[MTH_FinalEnrollGoal (All Grades)],
h.[Q1_ATT_EnrollGoal (3-9)],
h.[Q1_ATT_EnrollGoal (All Grades)],
h.[Q2_ATT_EnrollGoal (3-9)],
h.[Q2_ATT_EnrollGoal (All Grades)],
h.[Q3_ATT_EnrollGoal (3-9)],
h.[Q3_ATT_EnrollGoal (All Grades)],
h.[ATT_FinalEnrollGoal (3-9)],
h.[ATT_FinalEnrollGoal (All Grades)],
h.[Q1_BEH_EnrollGoal (3-9)],
h.[Q1_BEH_EnrollGoal (All Grades)],
h.[Q2_BEH_EnrollGoal (3-9)],
h.[Q2_BEH_EnrollGoal (All Grades)],
h.[Q3_BEH_EnrollGoal (3-9)],
h.[Q3_BEH_EnrollGoal (All Grades)],
h.[BEH_FinalEnrollGoal (3-9)],
h.[BEH_FinalEnrollGoal (All Grades)],
h.[Q1_ASP_EnrollGoal (3-9)],
h.[Q1_ASP_EnrollGoal (All Grades)],
h.[Q2_ASP_EnrollGoal (3-9)],
h.[Q2_ASP_EnrollGoal (All Grades)],
h.[Q3_ASP_EnrollGoal (3-9)],
h.[Q3_ASP_EnrollGoal (All Grades)],
h.[ASP_FinalEnrollGoal (3-9)],
h.[ASP_FinalEnrollGoal (All Grades)],
h.[GrantCategory],
h.[GrantSiteNum],
h.[GrantSite],
h.[GrantSite_GR],
h.[ACREPORTLIT],
h.[ACREPORTMTH],
h.[ACREPORTATT],
h.[ACREPORTBEH],
h.[ED1_ACAD_GOAL],
h.[ED2_ACAD_GOAL],
h.[ED5_ACAD_GOAL],
h.[ED1_ENGAGE_GOAL],
h.[ED2_ENGAGE_GOAL],
h.[ED27B_ENGAGE_GOAL],
h.[AC_SEL_OUPUT1_GOAL],
h.[AC_SEL_OUTPUT2_GOAL],
h.[AC_SELOUTCOME_GOAL]
 ,h.[TEAM_CORP_SPONSOR]
      ,h.[PrMnth_Literacy_Dosage_Target]
      ,h.[PrMnth_Math_Dosage_Target]
      ,h.[Quarterly_ELA_Enrollment_Goal]
      ,h.[Quarterly_Math_Enrollment_Goal]
      ,h.[Quarterly_ATT_Enrollment_Goal]
      ,h.[Quarterly_BEH_Enrollment_Goal]
      ,h.[Quarterly_ASP_Enrollment_Goal]
      ,h.[CurrMnth_Literacy_Dosage_Target]
      ,h.[CurrMnth_Math_Dosage_Target]
INTO #LEVEL5
FROM #LEVEL4 F
RIGHT JOIN [ReportCYData_Prod_17].[dbo].[1_RPT_STUDENT_MAIN_wip] g
ON f.CYSCHOOLHOUSE_STUDENT_ID=g.CYSCHOOLHOUSE_STUDENT_ID
LEFT JOIN [ReportCYData_Prod_17].[dbo].[2_RPT_SCHOOL_MAIN] h
ON h.CYCHANNEL_SCHOOL_ACCOUNT_NBR = g.CYCHANNEL_SCHOOL_ACCOUNT_NBR

SELECT *,
CASE WHEN OFFICIALFLATT=1 THEN ATTMET56DOSE ELSE NULL END AS FLATTMET56DOSE,
CASE WHEN OFFICIALFLBEH=1 THEN BEHMET56DOSE ELSE NULL END AS FLBEHMET56DOSE,
CASE WHEN OFFICIALFLLIT=1 THEN METPrMONTHLYLITDOSAGEGOAL ELSE NULL END AS FLLITMETPrMONTHLYDOSAGEGOAL,
CASE WHEN OFFICIALFLMTH=1 THEN METPrMONTHLYMTHDOSAGEGOAL ELSE NULL END AS FLMTHMETPrMONTHLYDOSAGEGOAL,
CASE WHEN OFFICIALFLLIT=1 THEN METCurrMONTHLYLITDOSAGEGOAL ELSE NULL END AS FLLITMETCurrMONTHLYDOSAGEGOAL,
CASE WHEN OFFICIALFLMTH=1 THEN METCurrMONTHLYMTHDOSAGEGOAL ELSE NULL END AS FLMTHMETCurrMONTHLYDOSAGEGOAL,
CASE WHEN OFFICIALFLLIT=1 OR OFFICIALFLMTH=1 OR OFFICIALFLBEH=1 OR OFFICIALFLATT=1 THEN 1 ELSE 0 END AS UNIQUEFL,
NULL AS ED1_LIT_ACTUAL
,NULL AS ED1_MTH_ACTUAL
,NULL AS ACTUAL_ED1_ACAD
,NULL AS ED2_LIT_ACTUAL
,NULL AS ED2_MTH_ACTUAL
,NULL AS ACTUAL_ED2_ACAD
,NULL AS ED1_ATT_ACTUAL
,NULL AS ED1_BEH_ACTUAL
,NULL AS ED2_ATT_ACTUAL
,NULL AS ED2_BEH_ACTUAL
,NULL AS ACDOSAGEGOALMTH
,NULL AS ACDOSAGEGOALLIT
,getdate() as currentdate

INTO #LEVEL6
FROM #LEVEL5 I


----AC VARIABLES-----------------------------------------------------------------

/*AC Academic dosage*/
UPDATE #LEVEL6 SET 
	ACDOSAGEGOALMTH			= CASE WHEN DIPLOMAS_NOW_SCHOOL = 1 THEN 6 ELSE JUN_MTH_DosageGoal END,
	ACDOSAGEGOALLIT			= CASE WHEN DIPLOMAS_NOW_SCHOOL = 1 THEN 6 ELSE JUN_ELA_DosageGoal END
FROM #LEVEL6

/*ED1*/
UPDATE #LEVEL6 SET
ED1_LIT_ACTUAL				= CASE WHEN ACREPORTLIT=1 THEN OFFICIALFLLIT ELSE NULL END,
ED1_MTH_ACTUAL				= CASE WHEN ACREPORTMTH=1 THEN OFFICIALFLMTH ELSE NULL END,
ED1_ATT_ACTUAL				= CASE WHEN ACREPORTATT=1 THEN OFFICIALFLATT ELSE NULL END,
ED1_BEH_ACTUAL				= CASE WHEN ACREPORTBEH=1 THEN OFFICIALFLBEH ELSE NULL END
FROM #LEVEL6

UPDATE #LEVEL6 SET
	ACTUAL_ED1_ACAD			= CASE WHEN ED1_LIT_ACTUAL=1 OR ED1_MTH_ACTUAL=1 THEN 1 ELSE NULL END
FROM #LEVEL6

/*ED2*/

--ACADEMIC
UPDATE #LEVEL6 SET
	ED2_LIT_ACTUAL			= CASE WHEN ED1_LIT_ACTUAL=1 AND (TOTALDOSAGELIT*1.0/60)>=ACDOSAGEGOALLIT THEN 1 WHEN ED1_LIT_ACTUAL=1 AND (TOTALDOSAGELIT*1.0/60)<ACDOSAGEGOALLIT THEN 0 ELSE NULL END,
	ED2_MTH_ACTUAL			= CASE WHEN ED1_MTH_ACTUAL=1 AND (TOTALDOSAGEMTH*1.0/60)>=ACDOSAGEGOALMTH THEN 1 WHEN ED1_MTH_ACTUAL=1 AND (TOTALDOSAGEMTH*1.0/60)<ACDOSAGEGOALMTH THEN 0 ELSE NULL END
FROM #LEVEL6

UPDATE #LEVEL6 SET
	ACTUAL_ED2_ACAD			= CASE WHEN ED2_LIT_ACTUAL=1 OR ED2_MTH_ACTUAL	=1 THEN 1 ELSE NULL END
FROM #LEVEL6

--ATTENDANCE

UPDATE #LEVEL6 SET
	ED2_ATT_ACTUAL		= CASE WHEN ED1_ATT_ACTUAL=1 AND ENROLLEDDAYSATT>=56 THEN 1 WHEN ED1_ATT_ACTUAL=1 AND ENROLLEDDAYSATT<56 THEN 0 ELSE NULL END
FROM #LEVEL6

--BEHAVIOR
UPDATE #LEVEL6 SET
	ED2_BEH_ACTUAL		= CASE WHEN ED1_BEH_ACTUAL=1 AND ENROLLEDDAYSBEH>=56 THEN 1 WHEN ED1_BEH_ACTUAL=1 AND ENROLLEDDAYSBEH<56 THEN 0 ELSE NULL END
FROM #LEVEL6


DROP TABLE eval_labs.[dbo].[Eval_StudentLevelFile_Quarantine_FY17]
select * 
into eval_labs.[dbo].[Eval_StudentLevelFile_Quarantine_FY17]
from #level6

END

GO
