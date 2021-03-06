USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_MIR_M2_ASSESSMENTSBYMONTH]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_MIR_M2_ASSESSMENTSBYMONTH]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	drop table eval_labs.dbo.MIR_M2_DESSAASSESSMENTSBYMONTH
	
select		FORMAT([date_administered__c], 'MM-yyyy') as DATE_ADMINISTERED_MMYYYY,  
			student_id__c,
			COUNT(*) AS NUM_stu
into		eval_labs.dbo.MIR_M2_DESSAASSESSMENTSBYMONTH
FROM		[SDW_Stage_Prod_17].[dbo].[Assesment__c]
where		date_administered__C is not null AND Assessment_Name__c = 'DESSA' AND SEL_Composite_T_Score__c IS NOT NULL
group by	FORMAT([date_administered__c], 'MM-yyyy'), student_id__c

  	drop table eval_labs.dbo.MIR_M2_MIASSESSMENTSBYADMINPERIOD
	
select		CASE 
			WHEN Date_Administered__c BETWEEN '08/15/2016' AND '10/31/2016' THEN 'Cat_1: August-October (1st Administration Period)'
			WHEN DATE_ADMINISTERED__C BETWEEN '11/1/2016' AND '1/1/2017' THEN 'Cat_2: November-December'
			WHEN Date_Administered__c BETWEEN '01/02/2017' AND '02/28/2017' THEN 'Cat_3: January-February (2nd Administration Period)'
			WHEN DATE_ADMINISTERED__C BETWEEN '2/29/2017' AND '4/30/2017' THEN 'Cat_4: March-April'
			WHEN Date_Administered__c BETWEEN '05/01/2017' AND '06/30/2017' THEN 'Cat_5: May-June (3rd Administration Period)' end as ASSESSMENT_ADMIN_PERIOD,
			student_id__c 
into		eval_labs.dbo.MIR_M2_MIASSESSMENTSBYADMINPERIOD
FROM		[SDW_Stage_Prod_17].[dbo].[Assesment__c]
where		date_administered__C is not null AND Assessment_Name__c LIKE 'MI%' AND QUANTILE_SCORE__C IS NOT NULL and date_administered__c!='2016-07-01 00:00:00.000'




END

GO
