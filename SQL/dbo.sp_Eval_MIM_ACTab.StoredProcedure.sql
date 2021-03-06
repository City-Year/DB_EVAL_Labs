USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Eval_MIM_ACTab]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Eval_MIM_ACTab] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

--AGGREGATE TO GRANT-LEVEL
SELECT	C.GrantCategory, 
		C.GrantSite, 
		MIN(case when (ACREPORTGRADE_ACADEMIC=1 AND (enrolleddayslit>=1 or enrolleddaysmth>=1 or enrolleddaysatt>=1 or enrolleddaysbeh>=1)) then c.GRADE_ID_NUMERIC end) AS MIN_GRADE_SERVED, 
		MAX(case when (ACREPORTGRADE_ACADEMIC=1 AND (enrolleddayslit>=1 or enrolleddaysmth>=1 or enrolleddaysatt>=1 or enrolleddaysbeh>=1)) then c.GRADE_ID_NUMERIC end) AS MAX_GRADE_SERVED, 
		max(c.ACREPORTLIT) AS ACREPORTLIT,
		max(c.ACREPORTMTH) AS ACREPORTMTH, 
		max(c.ACREPORTATT) AS ACREPORTATT, 
		max(c.ACREPORTBEH) AS ACREPORTBEH, 
		max(c.ED1_ACAD_GOAL) AS ED1_ACAD_GOAL, 
		sum(c.ACTUAL_ED1_ACAD) AS ACTUAL_ED1_ACAD, 
		sum(c.ACLITOFFICIALFL) as ACLITOFFICIALFL, 
		sum(c.acmthofficialfl) as ACMTHOFFICIALFL, 
		max(c.ED2_ACAD_GOAL) as ED2_ACAD_GOAL, 
		sum(c.ACTUAL_ED2_ACAD) as ACTUAL_ED2_ACAD, 
		sum(c.ACLITMETACDOSE) as ACLITMETACDOSE, 
		sum(c.ACMTHMETACDOSE) as ACMTHMETACDOSE , 
		min(c.ACDOSAGEGOALLIT) as minACDOSAGEGOALLIT, 
		max(c.ACDOSAGEGOALLIT) as maxACDOSAGEGOALLIT, 
		min(c.acdosagegoalmth) as minacdosagegoalmth, 
		max(c.acdosagegoalmth) as maxacdosagegoalmth,
		max(c.ED5_ACAD_GOAL) as ED5_ACAD_GOAL,  
		sum(c.ACTUAL_ED5_ACAD) as ACTUAL_ED5_ACAD,
		sum(c.ACTUAL_ED5_ACAD_LIT) as ACTUAL_ED5_ACAD_LIT,
		sum(c.ACTUAL_ED5_ACAD_MTH) as ACTUAL_ED5_ACAD_MTH,
		max(c.ED1_ENGAGE_GOAL) as ED1_ENGAGE_GOAL_ATT,
		sum(C.ACTUAL_ED1_ENGAGE_ATT) as ACTUAL_ED1_ENGAGE_ATT, 
		max(c.ED2_ENGAGE_GOAL) as ED2_ENGAGE_GOAL_ATT,
		sum(C.ACTUAL_ED2_ENGAGE_ATT) as ACTUAL_ED2_ENGAGE_ATT, 
		max(C.ED27B_ENGAGE_GOAL) as ED27B_ENGAGE_GOAL,
		sum(c.ACTUAL_ED27_ENGAGE_ATT) as ACTUAL_ED27_ENGAGE_ATT,
		MAX(C.AC_SEL_OUPUT1_GOAL) AS ED1_ENGAGE_GOAL_BEH,
		SUM(C.ACTUAL_ED1_ENGAGE_BEH) AS ACTUAL_ED1_ENGAGE_BEH,
		MAX(C.AC_SEL_OUTPUT2_GOAL) AS ED2_ENGAGE_GOAL_BEH,
		SUM(C.ACTUAL_ED2_ENGAGE_BEH) AS ACTUAL_ED2_ENGAGE_BEH,
		MAX(C.AC_SELOUTCOME_GOAL) AS ED27A_ENGAGE_GOAL,
		sum(C.ACTUAL_ED27_ENGAGE_BEH) AS ACTUAL_ED27_ENGAGE_BEH,
		SUM(C.SAYOY_AC_Start_Below) AS SAYOY_AC_Start_Below,
		SUM(C.ACTUAL_ED27_ENGAGE_BEH)*1.0/SUM(C.SAYOY_AC_Start_Below) AS  STA_SAYOY_BEHED27_PERC
into #ACtab  FROM
--JOIN STUDENT-LEVEL DATA WITH SCHOOL AND GRANT DATA FROM TABLE 2
      (SELECT A.grade_id_numeric, 
	  A.ACREPORTGRADE_ACADEMIC,
	  a.enrolleddayslit, 
	  a.enrolleddaysmth, 
	  a.enrolleddaysatt, 
	  a.enrolleddaysbeh, 
	  a.cyschoolhouse_student_id, 
	  a.actual_ed1_acad, 
	  a.aclitofficialfl, 
	  a.acmthofficialfl, 
	  a.actual_ed2_acad, 
	  a.aclitmetacdose,
	  a.acmthmetacdose, 
	  a.actual_ed1_engage_ATT, 
	  A.ACTUAL_ED1_ENGAGE_BEH, 
	  a.acattofficialfl, 
	  a.acbehofficialfl, 
	  a.actual_ed2_engage_ATT, 
	  A.ACTUAL_ED2_ENGAGE_BEH, 
	  a.acattmet56dose, 
	  a.acbehmet56dose, 
	  a.acdosagegoallit, 
	  a.acdosagegoalmth, 
	  a.ACTUAL_ED5_ACAD,
	  a.ACTUAL_ED5_ACAD_LIT,
	  a.ACTUAL_ED5_ACAD_MTH,
	  a.ACTUAL_ED27_ENGAGE_ATT,
	 A.ACTUAL_ED27_ENGAGE_BEH,
	 A.SAYOY_AC_Start_Below,
	  B.*
FROM
Eval_Labs.[dbo].[eval_studentlevelfile_quarantinewithids] a
RIGHT JOIN [ReportCYData_Prod].[dbo].[2_RPT_SCHOOL_MAIN] B
ON A.CYCHANNEL_SCHOOL_ACCOUNT_NBR=B.CYCHANNEL_SCHOOL_ACCOUNT_NBR) C
GROUP BY GRANTCATEGORY, GRANTSITE






/*--INSERT #ACTAB INTO ACTAB TABLE
TRUNCATE TABLE Eval_Labs.dbo.FY16_Eval_MIM_ACTab 
INSERT INTO Eval_Labs.dbo.FY16_Eval_MIM_ACTab 
select * 
from #actab
order by grantcategory, grantsite*/

--INSERT #ACTAB INTO ACTAB TABLE RESULTS
TRUNCATE TABLE EVAL_LABS.DBO.fy16_EVAL_ACRESULTS
INSERT INTO EVAL_LABS.DBO.fy16_EVAL_ACRESULTS
select * 
from #actab
order by grantcategory, grantsite




/*alter index ALL on Eval_Labs.dbo.FY16_Eval_MIM_ACTab REBUILD*/
alter index ALL on EVAL_LABS.DBO.fy16_EVAL_ACRESULTS REBUILD


END



GO
