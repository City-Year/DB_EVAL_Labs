USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_QA_FY17Beh_SUSP]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_QA_FY17Beh_SUSP]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

/*Check for duplicates. If duplicates are found, check if they also exist in EVAL_BEH. If so, report the issue to ITS. Otherwise, check
stored procedure for this table*/

select cyschoolhouse_student_id, count(*) as duplicatecheck
FROM [EVAL_Labs].[dbo].[fy17beh_susp]
group by cyschoolhouse_student_id
having count(*)>1

/*Check that proper number of students came over from Eval_Attendance. The following numbers should match*/

select count(cyschoolhouse_Student_id) as numstuIA
FROM [EVAL_Labs].[dbo].[fy17beh_susp]

select count(distinct cyschoolhouse_student_id) as numstueval
from [ReportCYData_Prod_17].dbo.EVAL_beh

select a.cyschoolhouse_student_id as suspids, b.cyschoolhouse_student_id as eval_suspids
from [EVAL_Labs].[dbo].[fy17beh_susp] a
full outer join [ReportCYData_Prod_17].[dbo].[EVAL_beh] b
on a.cyschoolhouse_student_id=b.cyschoolhouse_student_id
where a.cyschoolhouse_student_id is null or b.cyschoolhouse_student_id is null

/*Check that BEHSUS_ANYRAWDP is correct */
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (pre_value is null and behsus_anyrawdp=1) or (pre_value is not null and behsus_anyrawdp=0) or isnull(behsus_anyrawdp,999)!=1

/*Check that BEHSUS_2RawDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (pre_value is not null and post_value is not null and isnull(behsus_2rawdp,999)!=1) or (((pre_value is null or post_value is null) and isnull(behsus_2rawdp,999)!=0))

	/*Check that IOG_CRITERIA is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where	(IOG_CRITERIA=1 and	(isnull(diplomas_now_school,999)!=0 or isnull(BEHAVIOR_ia,999)!=1 or isnull(met_56_days,999)!=1))
or (iog_criteria=0 and (BEHAVIOR_ia=1 and met_56_days=1 and diplomas_now_school=0))

	/*Check that DN_CRITERIA is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where	(DN_CRITERIA=1 and	(diplomas_now_school!=1 or isnull(BEHAVIOR_ia,999)!=1 or isnull(met_56_days,999)!=1))
or (DN_criteria=0 and (BEHAVIOR_ia=1 and met_56_days=1 and diplomas_now_school=1))

/*Check that Start_EWI is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (Start_EWI	=1 and (post_value is null or isnull(pre_ewi,999)!=1))
or (start_ewi=0 and (post_value is null or pre_ewi!=0))
or (start_ewi is null and post_value is not null)

/*Check that StartEWI_EndNoEWI is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (startewi_endnoewi = 1 and (isnull(start_ewi,999)!=1 or isnull(post_ewi,999)!=0))
or (startewi_endnoewi = 0 and (isnull(start_ewi,999)!=1 and isnull(post_ewi,999)!=1))
or (startewi_endnoewi is not null and isnull(start_ewi,999)!=1)

/*Check that RawImp is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (rawimp=1 and rawchange>=0)
or (rawimp=0 and rawchange<0)
or (Rawimp is not null and rawchange is null)

/*Check that IOG_BEHSUS35_ANYRAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS35_ANYRAWDP=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(behsus_anyrawdp,999)!=1))

/*Check that IOG_BEHSUS35_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS35_2RAWDP=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(behsus_2rawdp,999)!=1))

/*Check that IOG_BEHSUS35_StartEWI_EndNoEWI is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS35_StartEWI_EndNoEWI=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(StartEWI_EndNoEWI,999)!=1))

/*Check that IOG_BEHSUS35_RawImp	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS35_RawImp	=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(rawimp,999)!=1))

/*Check that IOG_BEHSUS35_Start_EWI	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS35_Start_EWI=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(start_ewi,999)!=1))

/*Check that IOG_BEHSUS69_ANYRAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS69_ANYRAWDP=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(behsus_anyrawdp,999)!=1))

/*Check that IOG_BEHSUS69_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS69_2RAWDP=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(behsus_2rawdp,999)!=1))

/*Check that IOG_BEHSUS69_StartEWI_EndNoEWI is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS69_StartEWI_EndNoEWI=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(StartEWI_EndNoEWI,999)!=1))

/*Check that IOG_BEHSUS69_RawImp	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS69_RawImp	=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(rawimp,999)!=1))

/*Check that IOG_BEHSUS69_Start_EWI	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS69_Start_EWI=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(start_ewi,999)!=1))

/*Check that IOG_BEHSUS39_ANYRAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS39_ANYRAWDP=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(behsus_anyrawdp,999)!=1))

/*Check that IOG_BEHSUS39_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS39_2RAWDP=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(behsus_2rawdp,999)!=1))

/*Check that IOG_BEHSUS39_StartEWI_EndNoEWI is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS39_StartEWI_EndNoEWI=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(StartEWI_EndNoEWI,999)!=1))

/*Check that IOG_BEHSUS39_RawImp	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS39_RawImp	=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(rawimp,999)!=1))

/*Check that IOG_BEHSUS39_Start_EWI	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (IOG_BEHSUS39_Start_EWI=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(start_ewi,999)!=1))

/*Check that DN_BEHSUS69_ANYRAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (DN_BEHSUS69_ANYRAWDP=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(behsus_anyrawdp,999)!=1))

/*Check that DN_BEHSUS69_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (DN_BEHSUS69_2RAWDP=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(behsus_2rawdp,999)!=1))

/*Check that DN_BEHSUS69_StartEWI_EndNoEWI is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (DN_BEHSUS69_StartEWI_EndNoEWI=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(StartEWI_EndNoEWI,999)!=1))

/*Check that DN_BEHSUS69_RawImp	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (DN_BEHSUS69_RawImp	=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(rawimp,999)!=1))

/*Check that DN_BEHSUS69_Start_EWI	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17beh_susp]
where (DN_BEHSUS69_Start_EWI=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(start_ewi,999)!=1))


/*Check AC_MET_IMP according to improvement definitions from ACPM summary spreadsheet (GR)*/

END

GO
