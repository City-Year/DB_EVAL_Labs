USE [EVAL_Labs]
GO
/****** Object:  View [dbo].[Assessment_Performance_Bands_Alpha]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

















CREATE VIEW [dbo].[Assessment_Performance_Bands_Alpha] AS

  select distinct site_name, school_name, grade, skill_Description, data_type, indicator_desc, assessment_date, performance_value, 
  score_rank, score_rank_norm, alpha_target_score_rank, alpha_target_score_rank_norm, scale_local, scale_num_local, scale_norm, 
   scale_num_norm,     case when isnumeric(performance_value)=0 and (alpha_target_score_rank is null or alpha_Target_score_rank='') then 'Missing Score Rank (Alpha Scores)' else 'Pass' end as
   Alpha_Target_Score_Check, case when isnumeric(performance_value)=0 and alpha_Target_score_rank is not null and
   alpha_Target_score_rank!='' and (alpha_target_score_rank_Norm is null or alpha_target_score_rank_norm='') then 'Missing Score Rank Norm (Alpha Scores)' else
   'Pass' end as Alpha_Target_Score_Rank_Norm_Check, 
    case when isnumeric(performance_value)=0 and (score_rank is null or score_rank='') then 'Missing Score Rank (Alpha Scores)' else 'Pass' end as
   Alpha_Score_Rank_Check, case when isnumeric(performance_value)=0 and (score_rank_Norm is null or score_rank='') then 'Missing Score Rank Norm (Alpha Scores)' else
   'Pass' end as Alpha_Score_Rank_Norm_Check, 
   case when (scale_local is null or scale_local='') then 'Missing Local Performance Band' else 'Pass' end as Scale_Local_Check,
case when (scale_num_local is null or scale_num_local='') then 'Missing Local Performance Band Ranking' else 'Pass' end as Scale_Rank_Local_Check,
case when (scale_norm is null or scale_norm='') then 'Missing National Performance Band' else 'Pass' end as Scale_norm_Check,
case when (scale_num_norm is null or scale_num_norm='') then 'Missing National Performance Band Ranking' else 'Pass' end as Scale_Rank_Norm_Check
    FROM [ReportCYData_Prod].[dbo].[9_RPT_PERFORMANCE_LEVEL_As]
	where scale_local is null or scale_local ='' or scale_norm is null or scale_norm ='' or scale_num_local is null or scale_num_local=''
	 or scale_num_norm is null or scale_num_norm='' or (isnumeric(Performance_value)=0 and (alpha_target_Score_rank is null or alpha_target_score_Rank=''))
	or (isnumeric(Performance_value)=0 and ((alpha_target_score_Rank is not null and alpha_target_score_rank!='') and 
	(alpha_target_Score_rank_norm is null or alpha_target_score_rank_norm='')) or 
	(isnumeric(Performance_value)=0 and (Score_rank is null or score_rank='')) or
	 (isnumeric(Performance_value)=0 and (score_rank_norm is null or score_rank_norm='')))






GO
