USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_MIR_M2_AVGDAYSBTWDESSA]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_MIR_M2_AVGDAYSBTWDESSA]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
drop table eval_labs.dbo.MIR_M2_AVGDAYSBTWDESSA	
select student_id__c, avg(SEL_Date_Administered__c_Diff) as avg_SEL_Date_Administered__c_Diff, max(Date_Administered__c) as mostrecentassess, datediff(d, max(Date_Administered__c), getdate()) as
Days_Since_Last_Administration
into eval_labs.dbo.MIR_M2_AVGDAYSBTWDESSA
from
(SELECT  
	
	Date_Administered__c, 
	ROW_NUMBER() OVER (PARTITION BY student_id__c ORDER BY date_administered__c ASC)  AS Assessment_Administration_Number,
	SEL_Composite_Description__c, 
	SEL_Composite_T_Score__c,
	Assessment_Name__c,
	LAG(Date_Administered__c, 1, NULL) OVER (PARTITION BY student_id__c ORDER BY date_administered__c ASC) AS SEL_Date_Administered__c__MostRecent,
	datediff(d, lag(Date_Administered__c, 1, NULL) OVER (PARTITION BY student_id__c ORDER BY date_administered__c ASC),Date_Administered__c) AS SEL_Date_Administered__c_Diff, 
	student_id__c
FROM [SDW_Stage_Prod_17].[dbo].[Assesment__c] WHERE Assessment_Name__c = 'DESSA' and sel_composite_t_score__c is not null) a
group by student_id__c


END

GO
