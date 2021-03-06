USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Assessment_Performance_Bands_Numeric]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

















CREATE VIEW [dbo].[Assessment_Performance_Bands_Numeric] AS

  select distinct site_name, school_name, grade, skill_Description, data_type, indicator_desc, assessment_date, performance_value, 
   scale_local, scale_num_local, scale_norm, 
   scale_num_norm,    
   case when (scale_local is null or scale_local='') then 'Missing Local Performance Band' else 'Pass' end as Scale_Local_Check,
case when (scale_num_local is null or scale_num_local='') then 'Missing Local Performance Band Ranking' else 'Pass' end as Scale_Rank_Local_Check,
case when (scale_norm is null or scale_norm='') then 'Missing National Performance Band' else 'Pass' end as Scale_norm_Check,
case when (scale_num_norm is null or scale_num_norm='') then 'Missing National Performance Band Ranking' else 'Pass' end as Scale_Rank_Norm_Check
    FROM [ReportCYData_Prod].[dbo].[9_RPT_PERFORMANCE_LEVEL_As]
	where scale_local is null or scale_local ='' or scale_norm is null or scale_norm ='' or scale_num_local is null or scale_num_local=''
	 or scale_num_norm is null or scale_num_norm='' 




GO
