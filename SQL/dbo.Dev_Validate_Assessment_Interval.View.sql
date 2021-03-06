USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Dev_Validate_Assessment_Interval]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Dev_Validate_Assessment_Interval] AS

SELECT A. *
, B.Start_Date AS Start_of_Reporting_Period
, B.End_Date AS End_of_Reporting_Period
, B.Quarter
, CASE 
	WHEN B.End_Date is null THEN 'This assessment is not part of a reporting period'
	ELSE 'Pass' END AS Assessment_In_Reporting_Period_Check
FROM
(SELECT			Student__c.Location__c
				, Student__c.School_Name__c
				, Student__c.Name AS [Student_Name]
				, Student__c.Student_ID_Auto_Number__c AS CY_ID
				, Student__c.Local_Student_ID__c
				, Assesment__c.Name
				, Assessment_Name__c
				, Date_Administered__c
				, Student__c.Id AS Student_SF_ID
				, Student__c.School__c AS School_SF_ID
FROM            SDW_Stage_Dev.DBO.Student__c  
				INNER JOIN
                         SDW_Stage_Dev.DBO.Assesment__c ON Student__c.Id = Assesment__c.Student__c) A
				LEFT JOIN 
						[SDW_Dev].[dbo].[DimSchoolSetup] AS B ON A.School_SF_ID = B.CYSch_SF_ID and 
						(A.Date_Administered__c BETWEEN B.Start_Date AND B.End_Date)
			
WHERE        (A.Date_Administered__c is not null) and B.End_Date is null









GO
