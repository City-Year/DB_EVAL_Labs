USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Validate_High_Assessment_Frequency]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[Validate_High_Assessment_Frequency] AS
SELECT  CASE
		WHEN B.Num_Days_After < 28 and B.Num_Days_After > 0 THEN 'Check if record under "Assessment_ID" is a valid administration.'
		WHEN B.Num_Days_After = 0 THEN 'Likely duplicate assessment record.'
	  END AS High_Assessment_Frequency
	  ,B.  *
FROM
	(SELECT A. School_Name
			, A. Student_Name
			, A. CY_ID
			, A. Local_Student_ID
			, A. Assessment_Name
			, A. Assessment_Date
			, A. Assessment_SF_ID
	,LAG(A.Assessment_Date, 1) OVER (PARTITION BY A. Student_SF_ID, A. Assessment_Name ORDER BY A. Student_SF_ID, A. Assessment_Name, A.Assessment_Date ASC) AS Prior_Assessment_Date
	,LAG(A.Assessment_SF_ID, 1) OVER (PARTITION BY A. Student_SF_ID, A. Assessment_Name ORDER BY A. Student_SF_ID, A. Assessment_Name, A.Assessment_Date ASC) AS Prior_Assessment_SF_ID
	,DateDiff(day, LAG(A.Assessment_Date, 1) OVER (PARTITION BY A. Student_SF_ID, A. Assessment_Name ORDER BY A. Student_SF_ID, A. Assessment_Name, A.Assessment_Date ASC), A.Assessment_Date) AS Num_Days_After
	, A.Student_SF_ID
	, A.Location
	FROM
		(SELECT			Student__c.School_Name__c AS School_Name
						, Student__c.Name AS [Student_Name]
						, Student__c.Student_ID_Auto_Number__c AS CY_ID
						, Student__c.Local_Student_ID__c AS Local_Student_ID
						, Assessment_Name__c AS Assessment_Name
						, CASE
							WHEN (Date_Administered__c is null) THEN 1/1/1900
							ELSE Date_Administered__c 
						END AS Assessment_Date
						, Assesment__c.Name as Assessment_SF_ID
						, Student__c.Id AS Student_SF_ID
						,Student__c.Location__c AS Location
		FROM            -- SDW_Stage_Prod.DBO.Student__c ** this is the table used in FY16
						[SDW_Stage_Prod_17].[dbo].[Student__c]
						INNER JOIN
						-- SDW_Stage_Prod.DBO.Assesment__c ON Student__c.Id = SDW_Stage_Prod.DBO.Assesment__c.Student__c) A
						-- ** this is the table used in FY16
						[SDW_Stage_Prod_17].[dbo].[Assesment__c] ON [Student__c].Id = [SDW_Stage_Prod_17].[dbo].[Assesment__c].[Student__c]) A
						) B
		
WHERE B.Assessment_Date ! = '1900-01-01 00:00:00.000' and Num_Days_After <28 and (Location !='Orlando' and  Assessment_Name !='Cumulative Time Based Behavior Tracker - BEHAVIOR')









GO
