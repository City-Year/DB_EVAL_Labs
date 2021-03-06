USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_FY17Susp]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_FY17Susp]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
drop table eval_labs.dbo.FY17beh_susp
SELECT *,
	--CASE WHEN GRANTSITENUM =23 and post_value<pre_value THEN 1 ELSE NULL END AS AC_MET_IMP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 5 THEN BEHSUS_ANYRAWDP END AS IOG_BEHSUS35_ANYRAWDP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 5 THEN BEHSUS_2RAWDP END AS IOG_BEHSUS35_2RAWDP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 5 THEN StartEWI_EndNoEWI END AS IOG_BEHSUS35_StartEWI_EndNoEWI,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 5 THEN RawImp END AS IOG_BEHSUS35_RawImp,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 5 THEN Start_EWI END AS IOG_BEHSUS35_Start_EWI,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN BEHSUS_ANYRAWDP END AS IOG_BEHSUS69_ANYRAWDP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN BEHSUS_2RAWDP END AS IOG_BEHSUS69_2RAWDP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN StartEWI_EndNoEWI END AS IOG_BEHSUS69_StartEWI_EndNoEWI,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN RawImp END AS IOG_BEHSUS69_RawImp,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN Start_EWI END AS IOG_BEHSUS69_Start_EWI,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 9 THEN BEHSUS_ANYRAWDP END AS IOG_BEHSUS39_ANYRAWDP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 9 THEN BEHSUS_2RAWDP END AS IOG_BEHSUS39_2RAWDP,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 9 THEN StartEWI_EndNoEWI END AS IOG_BEHSUS39_StartEWI_EndNoEWI,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 9 THEN RawImp END AS IOG_BEHSUS39_RawImp,
	CASE WHEN IOG_CRITERIA=1 AND Grade_ID_Numeric between 3 and 9 THEN Start_EWI END AS IOG_BEHSUS39_Start_EWI,
	CASE WHEN DN_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN BEHSUS_ANYRAWDP END AS DN_BEHSUS69_ANYRAWDP,
	CASE WHEN DN_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN BEHSUS_2RAWDP END AS DN_BEHSUS69_2RAWDP,
	CASE WHEN DN_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN StartEWI_EndNoEWI END AS DN_BEHSUS69_StartEWI_EndNoEWI,
	CASE WHEN DN_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN RawImp END AS DN_BEHSUS69_RawImp,
	CASE WHEN DN_CRITERIA=1 AND Grade_ID_Numeric between 6 and 9 THEN Start_EWI END AS DN_BEHSUS69_Start_EWI
	into eval_labs.dbo.FY17beh_susp
	from
	(SELECT *, case when grade = 'K' then 0 else grade end as grade_id_numeric,
	CASE WHEN PRE_VALUE IS NOT NULL THEN 1 ELSE 0 END AS BEHSUS_ANYRAWDP,
	CASE WHEN PRE_VALUE IS NOT NULL AND POST_VALUE IS NOT NULL THEN 1 ELSE 0 END AS BEHSUS_2RAWDP,
	CASE WHEN DIPLOMAS_NOW_SCHOOL=0 AND ENROLLED_DAYS>=56 AND behavior_IA=1 THEN 1 ELSE 0 END AS IOG_CRITERIA,
	CASE WHEN DIPLOMAS_NOW_SCHOOL=1 AND ENROLLED_DAYS>=56 AND behavior_ia=1 THEN 1 ELSE 0 END AS DN_CRITERIA,
	case when pre_ewi=1 and post_ewi is not null then 1
		when pre_ewi=0 and post_ewi is not null then 0
		else null end as Start_EWI,
	CASE WHEN PRE_EWI=1 AND POST_EWI=0 THEN 1
		 WHEN PRE_EWI=1 AND POST_EWI=1 THEN 0 ELSE NULL END AS StartEWI_EndNoEWI,
	CASE WHEN RAWCHANGE<0 THEN 1
		 WHEN RAWCHANGE>=0 then 0 else null end as RawImp
FROM (
select b.*
from
(select cyschoolhouse_Student_id,  min(case when eoy_report=1 then 1
				 when eoy_report=2 then 2
				when eoy_report is null and my_report=1 then 3
				when eoy_report is null and my_report=2 then 4
				when (eoy_report is null and my_report is null) and soy_report=1 then 5
				when (eoy_report is null and my_report is null) and soy_report=2 then 6 end) as tagrank
				from [ReportCYData_prod_17].[dbo].[EVAL_BEH]
				group by cyschoolhouse_student_id) a
join
(select *, case when eoy_report=1 then 1
				 when eoy_report=2 then 2
				when eoy_report is null and my_report=1 then 3
				when eoy_report is null and my_report=2 then 4
				when (eoy_report is null and my_report is null) and soy_report=1 then 5
				when (eoy_report is null and my_report is null) and soy_report=2 then 6 end as tagrank
				from [ReportCYData_prod_17].[dbo].[EVAL_BEH]) b
on a.cyschoolhouse_student_id=b.cyschoolhouse_Student_id and a.tagrank=b.tagrank) c) d
END

GO
