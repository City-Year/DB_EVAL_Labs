USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_QA_FY17DESSA_Mini]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_QA_FY17DESSA_Mini]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/*Check for duplicates. If duplicates are found, check if they also exist in EVAL_DESSAmini. If so, report the issue to ITS. Otherwise, check
stored procedure for this table*/

select cyschoolhouse_student_id, count(*) as duplicatecheck
FROM [EVAL_Labs].[dbo].[fy17_dessa_mini]
group by cyschoolhouse_student_id
having count(*)>1

/*Check that proper number of students came over from Eval_Attendance. The following numbers should match*/

select count(cyschoolhouse_Student_id) as numstuIA
FROM [EVAL_Labs].[dbo].[fy17_dessa_mini]

select count(cyschoolhouse_student_id) as numstueval
from [ReportCYData_Prod_17].[dbo].[EVAL_DESSA_MINI]

select a.cyschoolhouse_student_id as dessaminiids, b.cyschoolhouse_student_id as eval_dessaminiids
from [EVAL_Labs].[dbo].[fy17_dessa_mini] a
full outer join [ReportCYData_Prod_17].[dbo].[EVAL_DESSA_MINI] b
on a.cyschoolhouse_student_id=b.cyschoolhouse_student_id
where a.cyschoolhouse_student_id is null or b.cyschoolhouse_student_id is null

/*Check that DESSA_ANYRAWDP is correct */
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (pre_value is null and DESSA_ANYRAWDP=1) or (pre_value is not null and DESSA_ANYRAWDP=0) or isnull(DESSA_ANYRAWDP,0)!=1

/*Check that DESSA_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (pre_value is not null and post_value is not null and days_between_assessments >=28 and isnull(DESSA_2RAWDP,0)!=1) or (((pre_value is null or post_value is null or days_between_assessments<28) and isnull(DESSA_2RAWDP,999)!=0))

	/*Check that IOG_CRITERIA is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where	(IOG_CRITERIA=1 and	(isnull(diplomas_now_school,999)!=0 or isnull(BEHAVIOR_ia,999)!=1 or isnull(met_56_days,999)!=1))
or (iog_criteria=0 and (BEHAVIOR_ia=1 and met_56_days=1 and diplomas_now_school=0))

	/*Check that DN_CRITERIA is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where	(DN_CRITERIA=1 and	(isnull(diplomas_now_school,999)!=1 or isnull(BEHAVIOR_ia,999)!=1 or isnull(met_56_days,999)!=1))
or (DN_criteria=0 and (BEHAVIOR_ia=1 and met_56_days=1 and diplomas_now_school=1))

/*check that DESSA_4PTIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DESSA_4PTIMP=1 and (days_between_assessments<28 or convert(float,rawchange)<4 or post_value is null))
or (dessa_4ptimp=0 and (days_between_assessments>=28 and convert(float,rawchange)>=4))
or ((dessa_4ptimp is null and days_between_assessments>=28))

/*check that DESSA_ANYRAWIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DESSA_ANYRAWIMP = 1 and (days_between_assessments<28 or convert(float,rawchange)<=0 or post_value is null))
or (DESSA_ANYRAWIMP	=0 and (days_between_assessments>=28 and convert(float,rawchange)>0))
or (DESSA_ANYRAWIMP	is null and days_between_assessments>=28)	

/* check that DESSA_START_NEED is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DESSA_START_NEED=1 and (days_between_assessments<28 or post_value is null or pre_value_desc !='n'))
or (DESSA_START_NEED =0 and (days_between_assessments>=28 and post_value is not null and pre_value_desc = 'n'))
or (DESSA_START_NEED is null and days_between_assessments>=28)

/* check that DESSA_STARTN_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DESSA_STARTN_ENDTS=1 and (days_between_assessments<28 or isnull(dessa_start_need,999)!=1 or post_value_desc = 'n'))
or (DESSA_STARTN_ENDTS=0 and (days_between_assessments>=28 and pre_value_desc = 'n' and post_value_desc != 'n'))
or (DESSA_STARTN_ENDTS is null and days_between_assessments>=28 and dessa_start_need=1)

/* check that DESSA_STARTTS_ENDTS	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where(DESSA_STARTTS_ENDTS=1 and (days_between_assessments<28 or isnull(dessa_start_need,999)!=0 or post_value_Desc = 'n'))
or (DESSA_STARTTS_ENDTS	=0 and (days_between_assessments>=28 and pre_value_desc!='n' and post_value_desc !='n'))
or (DESSA_STARTTS_ENDTS	is null and days_between_assessments>=28 and dessa_start_need=0)
	
	
/*Check that IOG_DESSA35_anyRawDP	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_anyRawDP	=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_anyrawdp,999)!=1))

/*Check that IOG_DESSA35_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_2RAWDP=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_2RAWDP,999)!=1))	
	
/*Check that IOG_DESSA35_4PTIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_4PTIMP=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_4PTIMP,999)!=1))	
	
	
	/*Check that IOG_DESSA35_ANYRAWIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_ANYRAWIMP=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_anyrawimp,999)!=1))	
	
/*Check that IOG_DESSA35_START_NEED is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_START_NEED=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_start_need,999)!=1))	

	/*Check that IOG_DESSA35_STARTN_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_STARTN_ENDTS=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_STARTN_ENDTS,999)!=1))	
	
/*Check that IOG_DESSA35_STARTTS_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA35_STARTTS_ENDTS=1 and (grade not in (3,4,5) or isnull(iog_criteria,999)!=1 or isnull(dessa_STARTTS_ENDTS,999)!=1))


/*Check that IOG_DESSA69_anyRawDP	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_anyRawDP	=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_anyrawdp,999)!=1))

/*Check that IOG_DESSA69_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_2RAWDP=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_2RAWDP,999)!=1))	
	
/*Check that IOG_DESSA69_4PTIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_4PTIMP=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_4PTIMP,0)!=1))	
	
	/*Check that IOG_DESSA69_ANYRAWIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_ANYRAWIMP=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_anyrawimp,999)!=1))	
	
/*Check that IOG_DESSA69_START_NEED is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_START_NEED=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_start_need,999)!=1))	


	/*Check that IOG_DESSA69_STARTN_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_STARTN_ENDTS=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_STARTN_ENDTS,999)!=1))	
	
/*Check that IOG_DESSA69_STARTTS_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA69_STARTTS_ENDTS=1 and (grade not in (6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_STARTTS_ENDTS,999)!=1))

/*Check that IOG_DESSA39_anyRawDP	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_anyRawDP	=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_anyrawdp,999)!=1))

/*Check that IOG_DESSA39_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_2RAWDP=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_2RAWDP,999)!=1))	
	
/*Check that IOG_DESSA39_4PTIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_4PTIMP=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_4PTIMP,0)!=1))	
	
	/*Check that IOG_DESSA39_ANYRAWIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_ANYRAWIMP=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_anyrawimp,999)!=1))	
	
/*Check that IOG_DESSA39_START_NEED is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_START_NEED=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_start_need,999)!=1))	

	/*Check that IOG_DESSA39_STARTN_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_STARTN_ENDTS=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_STARTN_ENDTS,999)!=1))	
	
/*Check that IOG_DESSA39_STARTTS_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (IOG_DESSA39_STARTTS_ENDTS=1 and (grade not in (3,4,5,6,7,8,9) or isnull(iog_criteria,999)!=1 or isnull(dessa_STARTTS_ENDTS,999)!=1))

/*Check that DN_DESSA69_anyRawDP	 is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_anyRawDP	=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_anyrawdp,999)!=1))

/*Check that DN_DESSA69_2RAWDP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_2RAWDP=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_2RAWDP,999)!=1))	
	
/*Check that DN_DESSA69_4PTIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_4PTIMP=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_4PTIMP,0)!=1))	
	
	/*Check that DN_DESSA69_ANYRAWIMP is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_ANYRAWIMP=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_anyrawimp,999)!=1))	
	
/*Check that DN_DESSA69_START_NEED is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_START_NEED=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_start_need,999)!=1))	

	/*Check that DN_DESSA69_STARTN_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_STARTN_ENDTS=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_STARTN_ENDTS,999)!=1))	
	
/*Check that DN_DESSA69_STARTTS_ENDTS is correct*/
select * from [EVAL_Labs].[dbo].[fy17_dessa_mini]
where (DN_DESSA69_STARTTS_ENDTS=1 and (grade not in (6,7,8,9) or isnull(DN_criteria,999)!=1 or isnull(dessa_STARTTS_ENDTS,999)!=1))


/*Check AC_MET_IMP according to improvement definitions from ACPM summary spreadsheet (GR)*/
END

GO
