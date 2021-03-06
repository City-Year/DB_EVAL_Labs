USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_Attendance]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Attendance] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DROP TABLE eval_labs.dbo.Attendance
SELECT D.*,
CASE WHEN ENROLLED_DAYS>=56 AND Attendance_IA=1 THEN ATT_ANYRAWDP END AS IOG_ATT_ANYRAWDP,
	CASE WHEN ENROLLED_DAYS>=56 AND Attendance_IA=1 THEN ATT_2RAWDP END AS IOG_ATT_2RAWDP,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_anyRawDP END AS IOG_ATT69_anyRawDP,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2RawDP END AS IOG_ATT69_2RawDP,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2PerfLvlDP_Local END AS IOG_ATT69_2PerfLvlDP_Local,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2PerfLvlDP_Norm END AS IOG_ATT69_2PerfLvlDP_Norm,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartLTE99ADA END AS IOG_ATT69_StartLTE99ADA,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartLTE98ADA END AS IOG_ATT69_StartLTE98ADA,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartLT90ADA END AS IOG_ATT69_StartLT90ADA,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_SOSMoveOn END AS IOG_ATT69_SOSMoveOn,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_1PercInc END AS IOG_ATT69_1PercInc,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2PERCINC END AS IOG_ATT69_2PercInc,
	CASE WHEN IOG_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartOnStayOn END AS IOG_ATT69_StartOnStayOn,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_anyRawDP END AS DN_ATT69_anyRawDP,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2RawDP END AS DN_ATT69_2RawDP,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2PerfLvlDP_Local END AS DN_ATT69_2PerfLvlDP_Local,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2PerfLvlDP_Norm END AS DN_ATT69_2PerfLvlDP_Norm,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartLTE99ADA END AS DN_ATT69_StartLTE99ADA,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartLTE98ADA END AS DN_ATT69_StartLTE98ADA,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartLT90ADA END AS DN_ATT69_StartLT90ADA,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_SOSMoveOn END AS DN_ATT69_SOSMoveOn,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_1PercInc END AS DN_ATT69_1PercInc,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_2PERCINC END AS DN_ATT69_2PercInc,
	CASE WHEN DN_CRITERIA=1 AND GRADE>=6 AND GRADE<=9 THEN ATT_StartOnStayOn END AS DN_ATT69_StartOnStayOn,
	CASE WHEN (convert(float, post_value) >=.9 or ATT_2PERCINC=1) AND GRANTSITENUM IN (1, 8, 28, 29) THEN 1
		 WHEN (ATT_SOSMoveOn=1 or ATT_2PERCINC=1) AND GRANTSITENUM IN ( 46) THEN 1 
		 WHEN (GRANTSITENUM in (2, 3, 4, 5, 7, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 47, 48, 49)) AND (ATT_SOSMOVEON=1 OR ATT_2PERCINC=1 OR (CONVERT(FLOAT, PRE_VALUE)>=.9 AND RAWCHANGE>0)) THEN 1
		 ELSE NULL END AS ATT_METACGOAL


into eval_labs.dbo.Attendance
 FROM 
(select c.*,
	CASE WHEN PRE_VALUE IS NOT NULL THEN 1 ELSE 0 END AS ATT_anyRawDP,
	CASE WHEN PRE_VALUE IS NOT NULL AND POST_VALUE IS NOT NULL THEN 1 ELSE 0 END AS ATT_2RawDP,
	CASE WHEN PRE_SCALE_LOCAL IS NOT NULL AND POST_SCALE_LOCAL IS NOT NULL THEN 1 ELSE 0 END AS ATT_2PerfLvlDP_Local,
	CASE WHEN PRE_SCALE_NORM IS NOT NULL AND POST_SCALE_NORM IS NOT NULL THEN 1 ELSE 0 END AS ATT_2PerfLvlDP_Norm,
	START_LTE99 AS ATT_StartLTE99ADA,
	START_LTE98 AS ATT_StartLTE98ADA,
	STARTOFFSLIDING AS ATT_StartLT90ADA,
	SOS_MOVEON AS ATT_SOSMoveOn,
	SHOW_1PERC_INC AS ATT_1PercInc,
	SHOW_2PERC_INC AS ATT_2PERCINC,
	StartonStayon as ATT_StartOnStayOn,
	CASE WHEN DIPLOMAS_NOW_SCHOOL=0 AND ENROLLED_DAYS>=56 AND Attendance_IA=1 THEN 1 ELSE 0 END AS IOG_CRITERIA,
	CASE WHEN DIPLOMAS_NOW_SCHOOL=1 AND ENROLLED_DAYS>=56 AND ATTENDANCE_IA=1 THEN 1 ELSE 0 END AS DN_CRITERIA
FROM
(select b.*
from
(select cyschoolhouse_Student_id,  min(case when eoy_report=1 then 1
				 when eoy_report=2 then 2
				when eoy_report is null and my_report=1 then 3
				when eoy_report is null and my_report=2 then 4
				when (eoy_report is null and my_report is null) and soy_report=1 then 5
				when (eoy_report is null and my_report is null) and soy_report=2 then 6 end) as tagrank
				from [ReportCYData_prod].[dbo].[EVAL_ATT]
				group by cyschoolhouse_student_id) a
join
(select *, case when eoy_report=1 then 1
				 when eoy_report=2 then 2
				when eoy_report is null and my_report=1 then 3
				when eoy_report is null and my_report=2 then 4
				when (eoy_report is null and my_report is null) and soy_report=1 then 5
				when (eoy_report is null and my_report is null) and soy_report=2 then 6 end as tagrank
				from [ReportCYData_prod].[dbo].[EVAL_ATT]) b
on a.cyschoolhouse_student_id=b.cyschoolhouse_Student_id and a.tagrank=b.tagrank) c) d
END

GO
