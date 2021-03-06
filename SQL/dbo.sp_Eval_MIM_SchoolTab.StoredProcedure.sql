USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Eval_MIM_SchoolTab]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Eval_MIM_SchoolTab]  
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

--JOIN SUMMED ENROLLMENT AND DOSAGE VARIABLES WITH SCHOOL INFORMATION FROM TABLE 2
SELECT C.REGION_NAME, 
		C.SITE_NAME, 
		C.SCHOOL_NAME, 
		C.DIPLOMAS_NOW_SCHOOL, 
		B.MIN_GRADE_SERVED, 
		B.MAX_GRADE_SERVED, 
		CASE WHEN year(getdate())=2016 and month(getdate()) >01 and month(getdate())<05 then C.Q3_ELA_EnrollGoal 
			 when year(getdate())=2016 and month(getdate())>=05 then C.WSWC_ELA_39_EnrollGoal 
			 ELSE NULL END AS ELAQuarterlyEnrollGoal, 
	B.OFFICIALFLLIT, 
	B.NOTOFFICIALFLLIT,  
	CASE WHEN month(GETDATE()) = 03 THEN FEB_ELA_DosageGoal
		 WHEN month(GETDATE()) = 04 THEN MAR_ELA_DosageGoal
		 WHEN month(GETDATE()) = 05 THEN APR_ELA_DosageGoal
		 WHEN month(GETDATE()) = 06 THEN MAY_ELA_DosageGoal
		 WHEN month(GETDATE()) = 07 THEN JUN_ELA_DosageGoal 
		 ELSE NULL END AS ELAMONTHLYDOSE, 
	FLLITMETMONTHLYDOSE, 
	PERC_FL_MET_ELA_DOSE, 
	NOTFLLITMETMONTHLYDOSE, 
	PERC_NOTFL_MET_ELA_DOSE,
	CASE WHEN year(getdate())=2016 and month(getdate()) >01 and month(getdate())<05 then Q3_MTH_EnrollGoaL 
		 when year(getdate())=2016 and month(getdate())>=05 then C.WSWC_MTH_39_EnrollGoal 
		 ELSE NULL END AS MTHQuarterlyEnrollGoal,
	OFFICIALFLMTH, 
	NOTOFFICIALFLMTH,
	CASE WHEN month(GETDATE()) = 03 THEN FEB_MTH_DosageGoal
		 WHEN month(GETDATE()) = 04 THEN MAR_MTH_DosageGoal
		 WHEN month(GETDATE()) = 05 THEN APR_MTH_DosageGoal
		 WHEN month(GETDATE()) = 06 THEN MAY_MTH_DosageGoal
		 WHEN month(GETDATE()) = 07 THEN JUN_MTH_DosageGoal 
		 ELSE NULL END AS MTHMONTHLYDOSE, 
		 FLMTHMETMONTHLYDOSE, 
		 PERC_FL_MET_MTH_DOSE, 
		 NOTFLMTHMETMONTHLYDOSE, 
		 PERC_NOTFL_MET_MTH_DOSE,
	CASE  WHEN year(getdate())=2016 and month(getdate()) >01 and month(getdate())<05 then Q3_ATT_EnrollGoal 
		 when year(getdate())=2016 and month(getdate())>=05 then C.WSWC_ATT_39_EnrollGoal 
		 ELSE NULL END AS ATTQuarterlyEnrollGoal,
	officialflatt, 
	NOTOFFICIALFLATT, 
	FLATTMET56DOSE, 
	FLATT_PERC_MET_DOSE, 
	NOTFLATTMET56DOSE, 
	NOTFLATT_PERC_MET_DOSE,
	CASE WHEN year(getdate())=2016 and month(getdate()) >01 and month(getdate())<05 then Q3_BEH_EnrollGoal 
		 when year(getdate())=2016 and month(getdate())>=05 then C.WSWC_BEH_39_EnrollGoal 
		 ELSE NULL END AS BEHQuarterlyEnrollGoal,
	OFFICIALFLBEH, 
	NOTOFFICIALFLBEH, 
	FLBEHMET56DOSE, 
	FLBEH_PERC_MET_DOSE, 
	NOTFLBEHMET56DOSE, 
	NOTFLBEH_PERC_MET_DOSE 
	INTO #SCHOOL FROM
--SUM DOSAGE AND ENROLLMENT VARIABLES, GROUP BY SCHOOL
	(SELECT 
		SITE_NAME, 
		max(CYschoolhouse_school_id) as cyschoolhouse_school_id, 
		CYCHANNEL_SCHOOL_ACCOUNT_NBR, 
		MIN(GRADE_ID_NUMERIC) AS MIN_GRADE_SERVED, 
		MAX(GRADE_ID_NUMERIC) AS MAX_GRADE_SERVED, 
		SUM(OFFICIALFLlit) AS OFFICIALFLlit, 
		SUM(NOTOFFICIALFLLIT) AS NOTOFFICIALFLLIT, 
		SUM(FLLITMETMONTHLYDOSE) AS FLLITMETMONTHLYDOSE, 
		SUM(FLLITMETMONTHLYDOSE)*1.0/NULLIF(SUM(OFFICIALFLLIT),0) AS PERC_FL_MET_ELA_DOSE, 
		SUM(NOTFLLITMETMONTHLYDOSE) AS NOTFLLITMETMONTHLYDOSE, SUM(NOTFLLITMETMONTHLYDOSE)*1.0/NULLIF(SUM(NOTOFFICIALFLLIT),0) AS PERC_NOTFL_MET_ELA_DOSE, 
		SUM(OFFICIALFLMTH) AS OFFICIALFLMTH, 
		SUM(NOTOFFICIALFLMTH) AS NOTOFFICIALFLMTH,
		SUM(FLMTHMETMONTHLYDOSE) AS FLMTHMETMONTHLYDOSE, 
		SUM(FLMTHMETMONTHLYDOSE)*1.0/NULLIF(SUM(OFFICIALFLMTH), 0) AS PERC_FL_MET_MTH_DOSE,
		SUM(NOTFLMTHMETMONTHLYDOSE) AS NOTFLMTHMETMONTHLYDOSE, 
		SUM(NOTFLMTHMETMONTHLYDOSE)*1.0/NULLIF(SUM(NOTOFFICIALFLMTH),0) AS PERC_NOTFL_MET_MTH_DOSE,
		sum(officialflatt) as officialflatt, 
		SUM(NOTOFFICIALFLATT) AS NOTOFFICIALFLATT, 
		SUM(FLATTMET56DOSE) AS FLATTMET56DOSE, 
		SUM(FLATTMET56DOSE)*1.0/nullif(sum(officialflatt),0) as FLATT_PERC_MET_DOSE,  
		SUM(NOTFLATTMET56DOSE) AS NOTFLATTMET56DOSE, 
		SUM(NOTFLATTMET56DOSE)*1.0/(nullif(sum(NOTofficialflatt),0)) as NOTFLATT_PERC_MET_DOSE,  
		SUM(OFFICIALFLBEH) AS OFFICIALFLBEH, 
		SUM(NOTOFFICIALFLBEH) AS NOTOFFICIALFLBEH, 
		SUM(FLBEHMET56DOSE) AS FLBEHMET56DOSE, 
		SUM(FLBEHMET56DOSE)*1.0/(nullif(sum(officialflBEH),0)) as FLBEH_PERC_MET_DOSE,  
		SUM(NOTFLBEHMET56DOSE) AS NOTFLBEHMET56DOSE, SUM(NOTFLBEHMET56DOSE)*1.0/(nullif(sum(NOTofficialflBEH),0)) as NOTFLBEH_PERC_MET_DOSE
	FROM Eval_Labs.DBO.EVAL_STUDENTLEVELFILE_quarantinewithids K 
	WHERE GRADE_ID_NUMERIC>=3 AND GRADE_ID_NUMERIC<=9
	GROUP BY SITE_NAME, CYCHANNEL_SCHOOL_ACCOUNT_NBR) B
RIGHT JOIN [ReportCYData_Prod].[dbo].[2_RPT_SCHOOL_MAIN] C
ON B.CYCHANNEL_SCHOOL_ACCOUNT_NBR=C.CYCHANNEL_SCHOOL_ACCOUNT_NBR

--INSERT #SCHOOL (ENROLLMENT AND DOSAGE, SCHOOL INFO FROM TABLE 2) INTO THE SCHOOLTAB TABLE
TRUNCATE TABLE Eval_Labs.DBO.FY16_EVAL_MIM_SchoolTab
INSERT INTO Eval_Labs.DBO.FY16_EVAL_MIM_SchoolTab
SELECT * FROM #SCHOOL
ORDER BY SITE_NAME, school_name

alter index ALL on Eval_Labs.DBO.FY16_EVAL_MIM_SchoolTab REBUILD

--AGGREGATE #SCHOOL TO THE SITE LEVEL

SELECT 
	region_name, 
	site_name, 
	min(min_grade_served) as min_grade_served,
	max(max_grade_served) as max_grade_served, 
	sum(ELAQuarterlyEnrollGoal) as ELAQuarterlyEnrollGoal, 
	sum(officialfllit) as officialfllit, 
	sum(notofficialfllit) as notofficialfllit, 
	min(elamonthlydose) as min_elamonthlydose, 
	max(elamonthlydose) as max_elamonthlydose, 
	sum(fllitmetmonthlydose) as fllitmetmonthlydose, 
	SUM(FLLITMETMONTHLYDOSE)*1.0/NULLIF(SUM(OFFICIALFLLIT),0) AS PERC_FL_MET_ELA_DOSE, 
	SUM(NOTFLLITMETMONTHLYDOSE) AS NOTFLLITMETMONTHLYDOSE, 
	SUM(NOTFLLITMETMONTHLYDOSE)*1.0/NULLIF(SUM(NOTOFFICIALFLLIT),0) AS PERC_NOTFL_MET_ELA_DOSE,
	sum(MTHQuarterlyEnrollGoal) as MTHQuarterlyEnrollGoal, 
	sum(officialflmth) as officialflmth, 
	sum(notofficialflmth) as notofficialflmth,
	min(mthmonthlydose) as minmthmonthlydose, 
	max(mthmonthlydose) as maxmthmonthlydose, 
	sum(flmthmetmonthlydose) as flmthmetmonthlydose,
	SUM(FLMTHMETMONTHLYDOSE)*1.0/NULLIF(SUM(OFFICIALFLMTH), 0) AS PERC_FL_MET_MTH_DOSE,
	SUM(NOTFLMTHMETMONTHLYDOSE) AS NOTFLMTHMETMONTHLYDOSE,
	SUM(NOTFLMTHMETMONTHLYDOSE)*1.0/NULLIF(SUM(NOTOFFICIALFLMTH),0) AS PERC_NOTFL_MET_MTH_DOSE,
	sum(attquarterlyenrollgoal) as attquarterlyenrollgoal, 
	sum(officialflatt) as officialflatt, 
	SUM(NOTOFFICIALFLATT) AS NOTOFFICIALFLATT, 
	SUM(FLATTMET56DOSE) AS FLATTMET56DOSE, 
	SUM(FLATTMET56DOSE)*1.0/nullif(sum(officialflatt),0) as FLATT_PERC_MET_DOSE,  
	SUM(NOTFLATTMET56DOSE) AS NOTFLATTMET56DOSE, 
	SUM(NOTFLATTMET56DOSE)*1.0/(nullif(sum(NOTofficialflatt),0)) as NOTFLATT_PERC_MET_DOSE,  
	sum(behquarterlyenrollgoal) as behquarterlyenrollgoal, 
	SUM(OFFICIALFLBEH) AS OFFICIALFLBEH, 
	SUM(NOTOFFICIALFLBEH) AS NOTOFFICIALFLBEH, 
	SUM(FLBEHMET56DOSE) AS FLBEHMET56DOSE, 
	SUM(FLBEHMET56DOSE)*1.0/(nullif(sum(officialflBEH),0)) as FLBEH_PERC_MET_DOSE,  
	SUM(NOTFLBEHMET56DOSE) AS NOTFLBEHMET56DOSE, SUM(NOTFLBEHMET56DOSE)*1.0/(nullif(sum(NOTofficialflBEH),0)) as NOTFLBEH_PERC_MET_DOSE
into #sitetab 
FROM #school
GROUP BY REGION_NAME, SITE_NAME


--INSERT #SITE (AGGREGATED #SCHOOL) INTO THE SITETAB TABLE
TRUNCATE TABLE Eval_Labs.dbo.FY16_Eval_MIM_SiteTab
INSERT INTO Eval_Labs.dbo.FY16_Eval_MIM_SiteTab
select * from #sitetab 
order by site_name

alter index ALL on Eval_Labs.dbo.FY16_Eval_MIM_SiteTab REBUILD

END

GO
