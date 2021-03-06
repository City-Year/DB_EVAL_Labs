USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Validate_Assessment_Interval]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[Validate_Assessment_Interval] AS

SELECT
  CASE 
	WHEN B.End_Date is null THEN 'This assessment is not part of a reporting period'
	ELSE 'Pass' END AS Assessment_In_Reporting_Period_Check
, A.*
, B.Start_Date AS Start_of_Reporting_Period
, B.End_Date AS End_of_Reporting_Period
, B.Quarter
FROM
(SELECT			  Student__c.School_Name__c AS [School_Name]
				, Student__c.Name AS [Student_Name]
				, Student__c.Student_ID_Auto_Number__c AS [CY_ID]
				, Student__c.Local_Student_ID__c AS [Local_Student_ID]
				, Assessment_Name__c AS [Assessment_Name]
				, Date_Administered__c AS [Date_Administered]
				, Assesment__c.Name AS [Assessment_SF_ID]
				, Student__c.Id AS [Student_SF_ID]
				, Student__c.School__c AS [School_SF_ID]
				, Student__c.Location__c AS [Location]
FROM            SDW_Stage_Prod.DBO.Student__c  
				INNER JOIN
                         -- SDW_Stage_Prod.DBO.Assesment__c ON Student__c.Id = Assesment__c.Student__c) A **this was the table used in FY16
						 SDW_Stage_Prod_17.DBO.Assesment__c ON Student__c.Id = Assesment__c.Student__c) A
				LEFT JOIN 
						-- [SDW_Prod].[dbo].[DimSchoolSetup] AS B ON A.School_SF_ID = B.CYSch_SF_ID and **this was the table used in FY16
						[SDW_Prod_FY17].[dbo].[DimSchoolSetup] AS B ON A.School_SF_ID = B.CYSch_SF_ID and
						(A.Date_Administered BETWEEN B.Start_Date AND B.End_Date)
			
WHERE        (A.Date_Administered is not null) and B.End_Date is null









GO
