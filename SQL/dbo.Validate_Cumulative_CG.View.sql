USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Validate_Cumulative_CG]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[Validate_Cumulative_CG] AS

SELECT 
 CASE 
	WHEN A.Due_Date ! = B.End_Date THEN 'This grade would not be analyzed as an EOY Final Cumulative Course Grade'
	ELSE 'Pass' END AS EOY_Assignment_Date_Check
, A. *
, B.End_Date AS End_of_School_Year
FROM
(SELECT        Student__c.School_Name__c AS [School_Name],
			   Student__c.Name AS [Student_Name], 
			   Student__c.Student_ID_Auto_Number__c AS [CY_ID],
			   Student__c.Local_Student_ID__c AS [Local_Student_ID],
			   Course__c.Name AS [Course_Name],
			   Section__c.Name AS [Section_Name],
			   Assignment_Lib__c.Type__c AS [Course_Grade_Type],
			   Assignment__c.Name_in_Gradebook__c AS [Name_in_Gradebook],
			   Grade__c.Reporting_Period_Name__c AS [Reporting_Period],
			   Grade__c.Entered_Grade__c AS [Entered_Grade],
			   Assignment__c.Due_Date__c AS [Due_Date],
			   Student__c.Id AS [Student_SF_ID],
			   Student__c.School__c AS School_SF_ID,
			   Student__c.Location__c AS [Location]
FROM            -- SDW_Stage_Prod.DBO.Student__c ** this was the table used in FY16
				[SDW_Stage_Prod_17].[dbo].[Student__c]
				INNER JOIN
                         -- SDW_Stage_Prod.DBO.Grade__c ON Student__c.Id = Grade__c.Student__c ** this was the table used in FY16
						 [SDW_Stage_Prod_17].[dbo].[Grade__c] ON Student__c.Id = Grade__c.Student__c
				LEFT OUTER JOIN
                         -- SDW_Stage_Prod.DBO.Assignment__c ** this was the table used in FY16
						 [SDW_Stage_Prod_17].[dbo].[Assignment__c]
				LEFT OUTER JOIN
                         -- SDW_Stage_Prod.DBO.Section__c ON Assignment__c.Section__c = Section__c.Id ON Grade__c.Assignment__c = Assignment__c.Id 
						 -- ** this was the table used in FY16
						 [SDW_Stage_Prod_17].[dbo].[Section__c] ON Assignment__c.Section__c = Section__c.Id ON Grade__c.Assignment__c = Assignment__c.Id 
				LEFT OUTER JOIN
                         -- SDW_Stage_Prod.DBO.Assignment_Lib__c ON Assignment__c.Assignment_Library__c = Assignment_Lib__c.Id
						 -- ** this was the table used in FY16
						 [SDW_Stage_Prod_17].[dbo].[Assignment_Lib__c] ON Assignment__c.Assignment_Library__c = Assignment_Lib__c.Id
				LEFT OUTER JOIN
                         -- SDW_Stage_Prod.DBO.Course__c ON Assignment_Lib__c.Course__c = Course__c.Id) A
						 -- ** this was the table used in FY16
						 [SDW_Stage_Prod_17].[dbo].[Course__c] ON Assignment_Lib__c.Course__c = Course__c.Id) A
				LEFT JOIN 
						-- [SDW_Prod].[dbo].[DimSchoolSetup] AS B ON A.School_SF_ID = B.CYSch_SF_ID and 
						SDW_Prod_FY17.[dbo].[DimSchoolSetup] AS B ON A.School_SF_ID = B.CYSch_SF_ID and 
						(B.Quarter = 'Marking Period 6' 
						or B.Quarter = 'Quarter 4' 
						or B.Quarter = 'Trimester 3' 
						or B.Quarter = 'Semester 2') 
			 
WHERE        (A.Course_Grade_Type = 'Cumulative Course Grade' and Reporting_Period ! = 'Prior Year') and (A.Due_Date ! = B.End_Date)











GO
