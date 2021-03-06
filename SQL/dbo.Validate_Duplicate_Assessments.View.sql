USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Validate_Duplicate_Assessments]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Validate_Duplicate_Assessments] AS

SELECT C. *
--, SDW_Stage_Prod.DBO.Assesment__c.Name AS Assessment_ID ** this was the table used in FY16
, [SDW_Stage_Prod_17].[dbo].[Assesment__c].Name AS Assessment_ID
-- ,[SDW_Stage_Prod].[dbo].[User_SF].Name as Created_By ** this was the table used in FY16
,[SDW_Stage_Prod_17].[dbo].[User_SF].Name as Created_By
	FROM
		(SELECT B. *
			FROM
				(SELECT A. *
				/*When there are multiple instances of an assessment meeting the same grouping criteria, there's a duplication problem*/
				, CASE 
					WHEN ROW_NUMBER() OVER (PARTITION BY A.CY_ID, A.Date_Administered__c, A.Assessment_Name__c 
					ORDER BY A.CY_ID, A.Date_Administered__c, A.Assessment_Name__c ASC)>1 
					THEN 'Student has multiple test administrations on same date'
					ELSE 'Pass' END AS Duplicate_Assessment_Administrations
				FROM
					(SELECT			Student__c.Location__c
									, Student__c.School_Name__c
									, Student__c.Name AS [Student_Name]
									, Student__c.Student_ID_Auto_Number__c AS CY_ID
									, Student__c.Local_Student_ID__c
									, Assessment_Name__c
									, Date_Administered__c
									, Student__c.Id AS Student_SF_ID
									, Assesment__c.Name
					FROM            -- SDW_Stage_Prod.DBO.Student__c ** this was the table in FY16
									[SDW_Stage_Prod_17].[dbo].[Student__c]
									INNER JOIN
									-- SDW_Stage_Prod.DBO.Assesment__c ON Student__c.Id = SDW_Stage_Prod.DBO.Assesment__c.Student__c) A
									--** this was the table used in FY16
									[SDW_Stage_Prod_17].[dbo].[Assesment__c] ON [Student__c].Id = [SDW_Stage_Prod_17].[dbo].[Assesment__c].[Student__c] ) A
									) B
							) C

			/*Join back on the scores that have the matching assessment name and date so you would see all the records and their IDs that are causing the offense*/

			INNER JOIN
				-- SDW_Stage_Prod.DBO.Assesment__c ON SDW_Stage_Prod.DBO.Assesment__c.Student__c = C.Student_SF_ID
				-- AND C.Assessment_Name__c = SDW_Stage_Prod.DBO.Assesment__c.Assessment_Name__c
				-- AND C.Date_Administered__c = SDW_Stage_Prod.DBO.Assesment__c.Date_Administered__c
				-- left join SDW_Stage_Prod.dbo.User_SF ON SDW_Stage_Prod.DBO.Assesment__c.CreatedById = SDW_Stage_Prod.dbo.User_SF.Id
				-- ** this was the table used in FY16
				
				[SDW_Stage_Prod_17].[dbo].[Assesment__c] ON [SDW_Stage_Prod_17].[dbo].[Assesment__c].[Student__c] = C.[Student_SF_ID]
				AND C.[Assessment_Name__c] = [SDW_Stage_Prod_17].[dbo].[Assesment__c].[Assessment_Name__c]
				AND C.[Date_Administered__c] = [SDW_Stage_Prod_17].[dbo].[Assesment__c].[Date_Administered__c]
				
			left join [SDW_Stage_Prod_17].[dbo].[User_SF] ON [SDW_Stage_Prod_17].[dbo].[Assesment__c].[CreatedById] = [SDW_Stage_Prod_17].[dbo].[User_SF].Id

WHERE        (C.Date_Administered__c is not null AND C.Duplicate_Assessment_Administrations ! = 'Pass')







GO
