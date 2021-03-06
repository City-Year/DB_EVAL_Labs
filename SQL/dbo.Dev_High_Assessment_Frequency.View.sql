USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Dev_High_Assessment_Frequency]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[Dev_High_Assessment_Frequency] AS
SELECT B.  *
	, CASE
		WHEN B. Num_Days_After < 28 THEN 'Check if record under "Assessment_ID" is a valid administration.'
	  END AS High_Assessment_Frequency
FROM
	(SELECT A. *
	,LAG(A.Date_Administered__c, 1) OVER (PARTITION BY A. Student_SF_ID, A. Assessment_Name__c ORDER BY A. Student_SF_ID, A. Assessment_Name__c, A.Date_Administered__c ASC) AS Pr_Assessment_Date
	,LAG(A.Assessment_ID, 1) OVER (PARTITION BY A. Student_SF_ID, A. Assessment_Name__c ORDER BY A. Student_SF_ID, A. Assessment_Name__c, A.Date_Administered__c ASC) AS Pr_Assessment_ID
	,DateDiff(day, LAG(A.Date_Administered__c, 1) OVER (PARTITION BY A. Student_SF_ID, A. Assessment_Name__c ORDER BY A. Student_SF_ID, A. Assessment_Name__c, A.Date_Administered__c ASC), A.Date_Administered__c) AS Num_Days_After
	FROM
		(SELECT			Student__c.Location__c
						, Student__c.School_Name__c
						, Student__c.Name AS [Student_Name]
						, Student__c.Student_ID_Auto_Number__c AS CY_ID
						, Student__c.Local_Student_ID__c
						, Assessment_Name__c
						, CASE
							WHEN (Date_Administered__c is null) THEN 1/1/1900
							ELSE Date_Administered__c 
						END AS Date_Administered__c 
						, Student__c.Id AS Student_SF_ID
						, Assesment__c.Name as Assessment_ID
		FROM            SDW_Stage_Dev.DBO.Student__c 
						INNER JOIN
						SDW_Stage_Dev.DBO.Assesment__c ON Student__c.Id = SDW_Stage_Dev.DBO.Assesment__c.Student__c) A
						) B
		
WHERE B.Date_Administered__c ! = '1900-01-01 00:00:00.000' and Num_Days_After <28







GO
