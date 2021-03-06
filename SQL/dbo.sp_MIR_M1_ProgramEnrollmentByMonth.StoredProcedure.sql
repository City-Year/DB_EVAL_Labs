USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_MIR_M1_ProgramEnrollmentByMonth]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_MIR_M1_ProgramEnrollmentByMonth] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


SELECT  [STUDENT_ID]
      ,[PROG_DESC]
      ,[INDICATOR_AREA_DESC]
      ,Max([ENROLLED_DAYS]) AS ENROLLED_DAYS
      ,MIN([FIRST_INTERVENTION]) AS FIRST_INTERVENTION
	  ,min(FORMAT([FIRST_INTERVENTION], 'MM-yyyy')) as minfirst_intervention_mmyyyy
      ,MAX([LAST_INTERVENTION]) AS LAST_INTERVENTION
	   , min(FIRST_INTERVENTION_MONTH) as FIRST_INTERVENTION_MONTH
      ,[FISCAL_YEAR]
      ,[SITE_NAME]
      ,[SCHOOL_NAME]
      ,[CYSCHOOLHOUSE_STUDENT_ID]
      ,[StudentName]

	  INTO #TABLE1
FROM
(SELECT d.StudentID as STUDENT_ID
	  , c.Name as StudentName
	  , c.ID
	  , LEFT(b.Name,CharIndex('-',b.Name,1)-1) AS PROG_DESC
	  , a.Section_IA AS INDICATOR_AREA_DESC
      , CASE WHEN  StuSec_End = '1900-01-01' THEN  DATEDIFF(dd,a.StuSect_Start,getdate()) 
			WHEN DATEDIFF(dd,a.StuSect_Start, ISNULL(a.StuSec_End, GETDATE())) < 0 THEN NULL 
			ELSE DATEDIFF(dd, StuSect_Start, ISNULL(a.StuSec_End, GETDATE())) 
	    END AS ENROLLED_DAYS
	  , a.StuSect_Start AS FIRST_INTERVENTION
      , a.StuSec_End AS LAST_INTERVENTION
      , c.School_Year_Name__c FISCAL_YEAR
      , c.Location__c SITE_NAME
      , c.School_Name__c SCHOOL_NAME
      , c.Student_Id__c [CYSCHOOLHOUSE_STUDENT_ID]
	  , month(StuSect_Start) as FIRST_INTERVENTION_MONTH
      --, c.Name as StudentName
  FROM [SDW_Stage_Prod_17].[dbo].[vw_StudentSection_Active_EnrollmentTracking_Start_and_End] AS a INNER JOIN
  [SDW_Stage_Prod_17].[dbo].Section__c  AS b WITH(nolock) ON 
	a.Section__c = b.Id INNER JOIN
  [SDW_Stage_Prod_17].[dbo].Student__c AS c WITH(nolock) ON 
	a.student__c = c.Id LEFT JOIN 
  SDW_Prod_FY17.dbo.DimStudent AS d WITH(nolock) ON
	a.Student__c = d.StudentSF_ID LEFT JOIN
  SDW_Prod_FY17.dbo.DimSchool AS e WITH(nolock) ON
  	c.School__c = e.CYSch_SF_ID
	  
  GROUP BY d.StudentID
	, b.Name,[Section_IA]
	, a.StuSec_End
	, a.StuSect_Start
	, c.School_Year_Name__c
	, c.Location__c
	, c.School_Name__c
	, e.SchoolID
	, e.Diplomas_Now
	, c.Student_Id__c
	, c.Name
	, c.ID)T2
	Group by T2.[STUDENT_ID]
      ,T2.[StudentName]
      ,T2.[ID]
      ,T2.[PROG_DESC]
      ,T2.[INDICATOR_AREA_DESC]
      ,T2.[FISCAL_YEAR]
      ,T2.[SITE_NAME]
      ,T2.[SCHOOL_NAME]
      ,T2.[CYSCHOOLHOUSE_STUDENT_ID]


	  drop table eval_labs.dbo.mir_M1_programenrollment_bymonth 
	  select * into eval_labs.dbo.MIR_M1_programenrollment_bymonth 
	  from #table1
END

GO
