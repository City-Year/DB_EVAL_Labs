USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Eval_Duplicates]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Eval_Duplicates] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DROP TABLE EVAL_LABS.DBO.Duplicates_Site_StudentName
SELECT a.Duplicate_Type
	  ,b.[Name]
      ,b.[Date_of_Birth__c]
      ,b.[Gender__c]
      ,b.[Grade__c]
      ,b.[School_Name__c]
      ,b.[Student_Id__c]
      ,b.[Attendance__c]
      ,b.[Behavior__c]
      ,b.[ELA_Literacy__c]
      ,b.[Math__c]
      ,b.[Location__c]
      ,b.[Local_Student_ID__c]
	  ,b.[CreatedDate]
      ,b.[LastModifiedDate]
INTO EVAL_LABS.DBO.Duplicates_Site_StudentName
FROM
	(SELECT NAME, 
			LOCATION__C, 
			CASE WHEN COUNT(*)>1 THEN 'Duplicate on Site and Student Name' END AS Duplicate_Type
	FROM --[SDW_Stage_Prod].[dbo].[Student__c] ** this was the table used in FY16
	[SDW_Stage_Prod_17].[dbo].[Student__c]
	GROUP BY NAME, LOCATION__C
	HAVING COUNT(*)>1) a
JOIN --[SDW_Stage_Prod].[dbo].[Student__c] b ** this was the table used in FY16
[SDW_Stage_Prod_17].[dbo].[Student__c] b
ON a.name=b.name and a.location__c=b.location__C
order by location__c, name




DROP TABLE EVAL_LABS.DBO.Duplicates_Site_LocalID
SELECT a.Duplicate_Type
	  ,b.[Name]
	  ,b.[Local_Student_ID__c]
      ,b.[Date_of_Birth__c]
      ,b.[Gender__c]
      ,b.[Grade__c]
	  ,b.[Location__c]
      ,b.[School_Name__c]
      ,b.[Student_Id__c]
      ,b.[Attendance__c]
      ,b.[Behavior__c]
      ,b.[ELA_Literacy__c]
      ,b.[Math__c]
	  ,b.[CreatedDate]
      ,b.[LastModifiedDate]
INTO EVAL_LABS.DBO.Duplicates_Site_LocalID
FROM
	(SELECT LOCATION__C,
			LOCAL_STUDENT_ID__C,
			CASE WHEN COUNT(*)>1 THEN 'Duplicate on Site and Local_ID' END AS Duplicate_Type
			FROM -- [SDW_Stage_Prod].[dbo].[Student__c] ** this was the table used in FY16
			[SDW_Stage_Prod_17].[dbo].[Student__c]
			GROUP BY LOCATION__C, LOCAL_STUDENT_ID__C
			HAVING COUNT(*)>1) A
			JOIN --[SDW_Stage_Prod].[dbo].[Student__c] b ** this was the table used in FY16
			[SDW_Stage_Prod_17].[dbo].[Student__c] b
ON A.LOCATION__c=B.LOCATION__c AND A.LOCAL_STUDENT_ID__C=B.LOCAL_STUDENT_id__c
ORDER BY A.location__c, a.LOCAL_STUDENT_ID__C




END

GO
