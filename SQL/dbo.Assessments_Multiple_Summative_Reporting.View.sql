USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Assessments_Multiple_Summative_Reporting]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















CREATE VIEW [dbo].[Assessments_Multiple_Summative_Reporting] AS

   
  select site_name, school_name, grade, indicator_desc, concat(min(skill_description) , ', ', max(skill_description)) as Assessments_for_Summative_Reporting, count(*) as Number_of_Assessments_for_Summative_Reporting from
  (select distinct site_name, school_name, grade, skill_Description, data_type, indicator_desc, used_for_summative_reporting
    FROM [ReportCYData_Prod].[dbo].[9_RPT_PERFORMANCE_LEVEL_As]
	where USED_FOR_SUMMATIVE_REPORTING =1) a 
	group by site_name, school_name, grade, indicator_desc
	having count(*)>1







GO
