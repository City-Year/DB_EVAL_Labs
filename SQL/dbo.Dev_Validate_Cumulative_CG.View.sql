USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Dev_Validate_Cumulative_CG]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Dev_Validate_Cumulative_CG] AS

SELECT A. *
, B.End_Date AS End_of_School_Year
, CASE 
	WHEN A.Due_Date__c ! = B.End_Date THEN 'This grade would not be analyzed as an EOY Final Cumulative Course Grade'
	ELSE 'Pass' END AS EOY_Assignment_Date_Check
FROM
(SELECT        Student__c.Location__c, Student__c.School_Name__c, Student__c.Name AS [Student_Name], Student__c.Student_ID_Auto_Number__c AS CY_ID, 
                         Student__c.Local_Student_ID__c, Course__c.Name AS [Course_Name], Section__c.Name AS [Section_Name], Assignment_Lib__c.Type__c, 
                         Assignment__c.Name_in_Gradebook__c, Grade__c.Reporting_Period_Name__c, Assignment__c.Due_Date__c, Grade__c.Entered_Grade__c, 
                         Student__c.Id AS Student_SF_ID, Student__c.School__c AS School_SF_ID
FROM            SDW_Stage_Dev.DBO.Student__c 
				INNER JOIN
                         SDW_Stage_Dev.DBO.Grade__c ON Student__c.Id = Grade__c.Student__c 
				LEFT OUTER JOIN
                         SDW_Stage_Dev.DBO.Assignment__c 
				LEFT OUTER JOIN
                         SDW_Stage_Dev.DBO.Section__c ON Assignment__c.Section__c = Section__c.Id ON Grade__c.Assignment__c = Assignment__c.Id 
				LEFT OUTER JOIN
                         SDW_Stage_Dev.DBO.Assignment_Lib__c ON Assignment__c.Assignment_Library__c = Assignment_Lib__c.Id 
				LEFT OUTER JOIN
                         SDW_Stage_Dev.DBO.Course__c ON Assignment_Lib__c.Course__c = Course__c.Id) A
				LEFT JOIN 
						[SDW_Dev].[dbo].[DimSchoolSetup] AS B ON A.School_SF_ID = B.CYSch_SF_ID and 
						(B.Quarter = 'Marking Period 6' 
						or B.Quarter = 'Quarter 4' 
						or B.Quarter = 'Trimester 3' 
						or B.Quarter = 'Semester 2') 
			 
WHERE        (A.Type__c = 'Cumulative Course Grade' and Reporting_Period_Name__c ! = 'Prior Year') and (A.Due_Date__c ! = B.End_Date)










GO
