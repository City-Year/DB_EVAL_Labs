USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_FY17ELACG]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_FY17ELACG]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DROP TABLE eval_labs.dbo.FY17elacg
SELECT D.*,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_anyRawDP ELSE NULL END AS IOG_ELACG69_anyRawDP,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_2RawDP ELSE NULL END AS IOG_ELACG69_2RawDP,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_2LOCAL_PERFLVLDP ELSE NULL END AS IOG_ELACG69_2LOCAL_PERFLVLDP,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_2NORM_PERFLVLDP ELSE NULL END AS IOG_ELACG69_2NORM_PERFLVLDP,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_StartBelowB ELSE NULL END AS IOG_ELACG69_StartBelowB,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_StartOffSlid ELSE NULL END AS IOG_ELACG69_StartOffSlid,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_IncreaseGradeLevel ELSE NULL END AS IOG_ELACG69_IncreaseGradeLevel,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_SOSMoveON ELSE NULL END AS IOG_ELACG69_SOSMoveON,
CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_StartonStayOn ELSE NULL END AS IOG_ELACG69_StartonStayOn,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_anyRawDP ELSE NULL END AS DN_ELACG69_anyRawDP,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_2RawDP ELSE NULL END AS DN_ELACG69_2RawDP,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_2LOCAL_PERFLVLDP ELSE NULL END AS DN_ELACG69_2LOCAL_PERFLVLDP,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_2NORM_PERFLVLDP ELSE NULL END AS DN_ELACG69_2NORM_PERFLVLDP,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_StartBelowB ELSE NULL END AS DN_ELACG69_StartBelowB,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_StartOffSlid ELSE NULL END AS DN_ELACG69_StartOffSlid,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_IncreaseGradeLevel ELSE NULL END AS DN_ELACG69_IncreaseGradeLevel,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_SOSMoveON ELSE NULL END AS DN_ELACG69_SOSMoveON,
CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ELACG_StartonStayOn ELSE NULL END AS DN_ELACG69_StartonStayOn

into eval_labs.dbo.FY17elacg
FROM
(select c.*,
	CASE WHEN PRE_VALUE IS NOT NULL THEN 1 ELSE 0 END AS ELACG_anyRawDP,
	CASE WHEN PRE_VALUE IS NOT NULL AND POST_VALUE IS NOT NULL THEN 1 ELSE 0 END AS ELACG_2RawDP,
	CASE WHEN (PRE_SCALE_LOCAL IS NOT NULL and pre_scale_local!='') AND (POST_SCALE_LOCAL IS NOT NULL and post_scale_local!='') THEN 1 ELSE 0 END AS ELACG_2LOCAL_PERFLVLDP,
	CASE WHEN (PRE_SCALE_NORM IS NOT NULL and pre_scale_norm!='') AND (POST_SCALE_NORM IS NOT NULL and post_scale_norm!='') THEN 1 ELSE 0 END AS ELACG_2NORM_PERFLVLDP,
	case when ((pre_value_num_norm is not null or pre_value_num_norm !='') and
	(post_value_num_norm is not null and post_value_num_norm!='')) then STARTBELOWB end AS ELACG_StartBelowB,
	STARTOFFSLIDING AS ELACG_StartOffSlid,
	INCGRADELEVEL AS ELACG_IncreaseGradeLevel,
	SOS_MOVEON AS ELACG_SOSMoveON,
	StartonStayOn as ELACG_StartonStayOn,
	CASE WHEN DIPLOMAS_NOW_SCHOOL=0 AND ENROLLED_DAYS>=1 AND ELA_IA=1 AND STATUS_JUNE_DOSAGE_GOAL=1 THEN 1 ELSE 0 END AS IOG_CRITERIA,
	CASE WHEN DIPLOMAS_NOW_SCHOOL=1 AND ENROLLED_DAYS>=1 AND ELA_IA=1 AND STATUS_JUNE_DOSAGE_GOAL=1 THEN 1 ELSE 0 END AS DN_CRITERIA
 from
(select b.*
from
(select cyschoolhouse_Student_id,  min(case when eoy_report=1 then 1
				 when eoy_report=2 then 2
				when eoy_report is null and my_report=1 then 3
				when eoy_report is null and my_report=2 then 4
				when (eoy_report is null and my_report is null) and soy_report=1 then 5
				when (eoy_report is null and my_report is null) and soy_report=2 then 6 end) as tagrank
				from [ReportCYData_prod_17].[dbo].[EVAL_ela_cg]
				group by cyschoolhouse_student_id) a
join
(select *, case when eoy_report=1 then 1
				 when eoy_report=2 then 2
				when eoy_report is null and my_report=1 then 3
				when eoy_report is null and my_report=2 then 4
				when (eoy_report is null and my_report is null) and soy_report=1 then 5
				when (eoy_report is null and my_report is null) and soy_report=2 then 6 end as tagrank
				from [ReportCYData_prod_17].[dbo].[EVAL_ela_cg]) b
on a.cyschoolhouse_student_id=b.cyschoolhouse_Student_id and a.tagrank=b.tagrank) c) D

END

GO
