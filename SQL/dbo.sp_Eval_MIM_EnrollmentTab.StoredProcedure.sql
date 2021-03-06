USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Eval_MIM_EnrollmentTab]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Eval_MIM_EnrollmentTab]  
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT 
	CYCHANNEL_SCHOOL_ACCOUNT_NBR, 
	REGION_NAME, 
	SITE_NAMe, 
	min(school_name) as SCHOOL_NAME, 
	MIN(case when enrolleddayslit>=1 then GRADE_ID_numeric end) AS MINlitGRADE, 
	MAX(case when enrolleddayslit>=1 then GRADE_ID_numeric end) AS MAXlitGRADE, 
	SUM(CASE WHEN ENROLLEDDAYSLIT>=1 THEN 1 END) AS TOTALlitENROLL, 
	SUM(OFFICIALFLLIT) AS OFFICIALFLLIT, 
	SUM(OFFICIALFLLIT)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYSLIT>=1 THEN 1 END),0) AS OFFICIALlit_PERC, 
	SUM(notofficialfllit) AS NOTOFFICIALFLLIT, SUM(notofficialfllit)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYSLIT>=1 THEN 1 END),0) AS NONOFFICIALlit_PERC,
	MIN(case when enrolleddaysmth>=1 then GRADE_ID_numeric end) AS MINmthGRADE, 
	MAX(case when enrolleddaysmth>=1 then GRADE_ID_numeric end) AS MAXmthGRADE, 
	SUM(CASE WHEN ENROLLEDDAYSmth>=1 THEN 1 END) AS TOTALmthENROLL, 
	SUM(OFFICIALFLmth) AS OFFICIALFLmth, 
	SUM(OFFICIALFLmth)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYSmth>=1 THEN 1 END),0) AS OFFICIALmth_PERC, 
	SUM(NOTOFFICIALFLmth) AS NOTOFFICIALFLmth, 
	SUM(NOTOFFICIALFLmth)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYsmth>=1 THEN 1 END),0) AS NONOFFICIALmth_PERC,
	MIN(case when enrolleddaysatt>=1 then GRADE_ID_numeric end) AS MINattGRADE, 
	MAX(case when enrolleddaysatt>=1 then GRADE_ID_numeric end) AS MAXattGRADE, 
	SUM(CASE WHEN ENROLLEDDAYSatt>=1 THEN 1 END) AS TOTALattENROLL, 
	SUM(OFFICIALFLatt) AS OFFICIALFLatt, 
	SUM(OFFICIALFLatt)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYSatt>=1 THEN 1 END),0) AS OFFICIALatt_PERC, 
	SUM(NOTOFFICIALFLatt) AS NOTOFFICIALFLatt, 
	SUM(NOTOFFICIALFLatt)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYsatt>=1 THEN 1 END),0) AS NONOFFICIALatt_PERC,
	MIN(case when enrolleddaysbeh>=1 then GRADE_ID_numeric end) AS MINbehGRADE, 
	MAX(case when enrolleddaysbeh>=1 then GRADE_ID_numeric end) AS MAXbehGRADE, 
	SUM(CASE WHEN ENROLLEDDAYSbeh>=1 THEN 1 END) AS TOTALbehENROLL, 
	SUM(OFFICIALFLbeh) AS OFFICIALFLbeh, 
	SUM(OFFICIALFLbeh)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYSbeh>=1 THEN 1 END),0) AS OFFICIALbeh_PERC, 
	SUM(NOTOFFICIALFLbeh) AS NOTOFFICIALFLbeh, 
	SUM(NOTOFFICIALFLbeh)*1.0/NULLIF(SUM(CASE WHEN ENROLLEDDAYsbeh>=1 THEN 1 END),0) AS NONOFFICIALbeh_PERC
INTO #ENROLLTAB
from eval_labs.dbo.eval_studentlevelfile_quarantinewithids
GROUP BY REGION_NAME, SITE_NAMe, CYCHANNEL_SCHOOL_ACCOUNT_NBR


TRUNCATE TABLE Eval_Labs.DBO.FY16_EVAL_MIM_EnrollmentTab
INSERT INTO Eval_Labs.DBO.FY16_EVAL_MIM_EnrollmentTab
SELECT * FROM #EnrollTab
ORDER BY SITE_NAME, SCHOOL_NAME

alter index ALL on Eval_Labs.DBO.FY16_EVAL_MIM_EnrollmentTab REBUILD

END

GO
