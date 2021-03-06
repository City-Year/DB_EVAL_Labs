USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Lit_Enrollment_QA_Student_Level]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE View [dbo].[Lit_Enrollment_QA_Student_Level] AS

SELECT					 Student_Section__c.Location__c, Student_Section__c.School__c, Enrollment_Tracking__c.Id AS ET_ID, Enrollment_Tracking__c.Name AS ET_Name, 
                         Student_Section__c.Student__c, Student_Section__c.Student_Name__c, Enrollment_Tracking__c.Current_Record__c AS ET_Current_Record, 
                         Enrollment_Tracking__c.Active__c AS ET_Active, Enrollment_Tracking__c.Start_Date__c, Enrollment_Tracking__c.End_Date__c, 
                         Enrollment_Tracking__c.Exit_Reason__c, 
						 ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC)  AS ET_Record_Count,
						 Enrollment_Tracking__c.Student_Section__c, Student_Section__c.Name AS Stu_Sec_Name, 
                         Student_Section__c.Section__c, Student_Section__c.Active__c AS Stu_Sec_Active, Student_Section__c.Intervention_Enrollment_Start_Date__c, 
                         Student_Section__c.Enrollment_End_Date__c, Student_Section__c.Section_Exit_Reason__c, Student_Section__c.Dosage_to_Date_hrs__c, 
                         Section__c.Indicator_Area__c, Section__c.Program__c, Section__c.Name AS Section_Name,

						 /****** Test_First_Record_Active checks to see if the first record is active - this record should be a student's initial enrollment into a section ******/

						 CASE
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC)=1 AND Enrollment_Tracking__c.Active__c = 1 THEN 'Pass'
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC)=1 AND Enrollment_Tracking__c.Active__c = 0 THEN 'Fail'
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC)>1 THEN 'Not First Record'
							ELSE Null END AS Test_First_Record_Active,

						/****** Test_Complete_ET_Record checks to see if enrollment records are created correctly -any record not currently active should have an enrollment
						start and end date. ******/

						CASE
							WHEN Current_Record__c = 0 AND Enrollment_Tracking__c.Start_Date__c IS NOT NULL AND Enrollment_Tracking__c.End_Date__c IS NOT NULL THEN 'Pass'
							WHEN Current_Record__c = 0 AND (Enrollment_Tracking__c.Start_Date__c IS NULL OR Enrollment_Tracking__c.End_Date__c IS NULL) THEN 'Fail'
							WHEN Current_Record__c = 1 THEN 'Active Record'
							ELSE Null END AS Test_Complete_ET_Record,

						/****** Test_Odd_Record_Active checks to see if all odd ET records are odd. The patterns should go Active, Inactive, Active... ******/

						CASE
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC) % 2 = 1 AND Enrollment_Tracking__c.Active__c =1 THEN 'Pass'
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC) % 2 = 0 AND Enrollment_Tracking__c.Active__c =1 THEN 'Fail'
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC) % 2 = 0 AND Enrollment_Tracking__c.Active__c =0 THEN 'Pass'
							WHEN ROW_NUMBER() OVER (PARTITION BY Student_Section__c,Student_Section__c.Student__c ORDER BY Enrollment_Tracking__c.Start_Date__c ASC) % 2 = 1 AND Enrollment_Tracking__c.Active__c =0 THEN 'Fail'
							ELSE Null END AS Test_Odd_Record_Active,

						/****** Test_Stu_Sec_Active checks to see if there is agreement between ET records and the Student Section Active fields. If currently inactive, both should equal 0 ******/

						CASE
							WHEN Enrollment_Tracking__c.Active__c = 1 AND Current_Record__c = 1 AND Student_Section__c.Active__c = 1 THEN 'Pass'
							WHEN Enrollment_Tracking__c.Active__c = 0 AND Current_Record__c = 1 AND Student_Section__c.Active__c = 1 THEN 'Fail'
							WHEN Student_Section__c.Active__c = 0 THEN 'Student Section Inactive'
							ELSE Null END AS Test_Stu_Sec_Active,

						/****** Test_Invalid_Start checks to see if the start dates are later than the end dates ******/

						CASE
							WHEN Enrollment_Tracking__c.End_Date__c IS NOT NULL AND Enrollment_Tracking__c.Start_Date__c <= Enrollment_Tracking__c.End_Date__c THEN 'Pass'
							WHEN Enrollment_Tracking__c.End_Date__c IS NOT NULL AND Enrollment_Tracking__c.Start_Date__c > Enrollment_Tracking__c.End_Date__c THEN 'Fail'
							WHEN Section__c.End_Date__c IS NOT NULL AND Student_Section__c.Intervention_Enrollment_Start_Date__c <= Section__c.End_Date__c THEN 'Pass'
							WHEN Section__c.End_Date__c IS NOT NULL AND Student_Section__c.Intervention_Enrollment_Start_Date__c > Section__c.End_Date__c THEN 'Fail'
							WHEN Enrollment_Tracking__c.End_Date__c IS NULL THEN 'No End Date'
							ELSE Null END AS Test_Invalid_Start,

						/****** NonCritTest_Exit_Reasons checks to see if the exit reasons for the section match those entered at the time the student was exited ******/

						CASE
							WHEN Enrollment_Tracking__c.Active__c = 0 AND Exit_Reason__c = Section_Exit_Reason__c THEN 'Pass'
							WHEN Enrollment_Tracking__c.Active__c = 0 AND Exit_Reason__c != Section_Exit_Reason__c THEN 'Fail'
							WHEN Student_Section__c.Active__c = 0 AND Section_Exit_Reason__c IS null THEN 'Fail'
							WHEN Enrollment_Tracking__c.Active__c = 1 THEN 'Not Applicable'
							ELSE Null END AS NonCritTest_Exit_Reasons
FROM            SDW_STAGE_PROD.DBO.Section__c 
				RIGHT OUTER JOIN
                         SDW_STAGE_PROD.DBO.Student_Section__c ON SDW_STAGE_PROD.DBO.Section__c.Id = Student_Section__c.Section__c 
				RIGHT OUTER JOIN
                         SDW_STAGE_PROD.DBO.Enrollment_Tracking__c ON SDW_STAGE_PROD.DBO.Student_Section__c.Id = SDW_STAGE_PROD.DBO.Enrollment_Tracking__c.Student_Section__c
WHERE        (Section__c.Name LIKE 'Tutoring: Literacy%')








GO
