USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Behavior_Enrollment_QA_School_Level]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[Behavior_Enrollment_QA_School_Level] AS

SELECT B.*
FROM(
	SELECT DISTINCT

		/****** Count the number of distint students having this problem ******/

					A.Location__c, 
					A.School__c,
					COUNT(CASE WHEN First_Record_Inactive > 0 THEN 1 END) AS TTL_First_Record_Inactive, 
					COUNT(CASE WHEN Incomplete_ET_Records > 0 THEN 1 END) AS TTL_Incomplete_ET_Records, 
					COUNT(CASE WHEN Odd_Records_Active > 0 THEN 1 END) AS TTL_Odd_Records_Active, 
					COUNT(CASE WHEN Active_Inactive_Mismatch > 0 THEN 1 END) AS TTL_Active_Inactive_Mismatch,  
					COUNT(CASE WHEN Invalid_Start > 0 THEN 1 END) AS TTL_Invalid_Start,
					COUNT(CASE WHEN Any_Error > 0 THEN 1 END) AS TTL_Enrollment_Errors

		/****** Find the instances of students who have records that fail this test ******/

		FROM(
			SELECT DISTINCT      
						Location__c, 
						School__c,
						Student__c,
						COUNT(CASE WHEN Test_First_Record_Active = 'Fail' THEN 1 END) AS First_Record_Inactive, 
						COUNT(CASE WHEN Test_Complete_ET_Record = 'Fail' THEN 1 END) AS Incomplete_ET_Records, 
						COUNT(CASE WHEN Test_Odd_Record_Active = 'Fail' THEN 1 END) AS Odd_Records_Active, 
						COUNT(CASE WHEN Test_Stu_Sec_Active = 'Fail' THEN 1 END) AS Active_Inactive_Mismatch,  
						COUNT(CASE WHEN Test_Invalid_Start = 'Fail' THEN 1 END) AS Invalid_Start,
						COUNT(CASE WHEN Test_Invalid_Start = 'Fail' 
										OR Test_Invalid_Start = 'Fail' 
										OR Test_Stu_Sec_Active = 'Fail' 
										OR Test_Odd_Record_Active = 'Fail'
										OR Test_Complete_ET_Record = 'Fail'
										OR Test_First_Record_Active = 'Fail' 
						THEN 1 END) AS Any_Error
							
			FROM        dbo.Behavior_Enrollment_QA_Student_Level
			GROUP BY	location__c, school__c, student__c) A
	GROUP BY location__c, school__c) B
WHERE B.TTL_Enrollment_Errors > 5






GO
