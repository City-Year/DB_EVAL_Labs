USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[SP_StudentLevelFile_ValidationReports]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cchin,Cassandra Chin>
-- Create date: <11.03.2016>
-- Description:	<Shows the student-level data behind the Impact Report>
-- =============================================
CREATE PROCEDURE [dbo].[SP_StudentLevelFile_ValidationReports]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	drop table Eval_Labs.dbo.StudentLevelFile_ValidationReports

    -- Insert statements for procedure here
	select [school_name] as School_Name
     ,[DIPLOMAS_NOW_SCHOOL] as Diplomas_Now_School
     ,[FIRST_NAME] as First_Name
      ,[MIDDLE_NAME] as Middle_Name
      ,[LAST_NAME] as Last_Name
      ,[STUDENT_DISTRICT_ID] as Student_Local_District_ID
      ,[CYSCHOOLHOUSE_STUDENT_ID] as CY_ID
      ,[GENDER] as Gender
      ,[GRADE_ID_NUMERIC] as Grade_Level
      ,[ELA_IA] as Literacy_Indicator_Area
      ,[MATH_IA] as Math_Indicator_Area
      ,[BEHAVIOR_IA] as Behavior_Indicator_Area
      ,[ATTENDANCE_IA] as Attendance_Indicator_Area
      ,[ELA_PRIMARY_CM_NAME] as Literacy_Primary_ACM_Name
      ,[MATH_PRIMARY_CM_NAME] as Math_Primary_ACM_Name
      ,[BEH_PRIMARY_CM_NAME] as Behavior_Primary_ACM_Name
      ,[ATT_PRIMARY_CM_NAME] as Attendance_Primary_ACM_Name
      ,[LITENROLLDATE] as Literacy_Enrollment_Date
      ,[LITEXITDATE] as Literacy_Exit_Date
      ,[ENROLLEDDAYSLIT] as Literacy_Days_Enrolled
      ,[TOTALDOSAGELIT] as Literacy_Total_Dosage
      ,[METCurrMONTHLYLITDOSAGEGOAL] as Literacy_Met_Current_Monthly_Dosage_Goal
      ,[METPrMONTHLYLITDOSAGEGOAL] as Literacy_Met_Prior_Monthly_Dosage_Goal
      ,[MTHENROLLDATE] as Math_Enrollment_Date
      ,[MTHEXITDATE] as Math_Exit_Date
	  ,[enrolleddaysmth] as Math_Days_Enrolled
      ,[TOTALDOSAGEMTH] as Math_Total_Dosage
      ,[METCurrMONTHLYMTHDOSAGEGOAL] as Math_Met_Current_Monthly_Dosage_Goal
      ,[METPrMONTHLYMTHDOSAGEGOAL] as Math_Met_Prior_Monthly_Dosage_Goal
      ,[BEHENROLLDATE] as Behavior_Enrollment_Date
      ,[BEHEXITDATE] as Behavior_Exit_Date
      ,[enrolleddaysbeh] as Behavior_Days_Enrolled
	  ,[BEHMET56DOSE] as Behavior_Met_56hours_Dosage
	  ,[ATTENROLLDATE] as Attendance_Enrollment_Date
      ,[ATTEXITDATE] as Attendance_Exit_Date
	  ,[enrolleddaysatt] as Attendance_Days_Enrolled
      ,[ATTMET56DOSE] as Attendance_Met_56hours_Dosage
	  ,[TOTALDOSAGEOTH] as OtherProgramming_Total_Dosage
      ,[enrolleddaysoth] as OtherProgramming_Days_Enrolled
      ,[OTHENROLLDATE] as OtherProgramming_Enrollment_Date
      ,[OTHEXITDATE] as OtherProgramming_Exit_Date
      ,[OFFICIALFLLIT] as Literacy_Focus_List_Student
      ,[OFFICIALFLMTH] as Math_Focus_List_Student
      ,[OFFICIALFLBEH] as Behavior_Focus_List_Student
      ,[OFFICIALFLATT] as Attendance_Focus_List_Student
      ,[FLLITMETCurrMONTHLYDOSAGEGOAL] as Literacy_Focus_List_Student_Met_Current_Monthly_Dosage_Goal
      ,[FLLITMETPrMONTHLYDOSAGEGOAL] as Literacy_Focus_List_Student_Met_Prior_Monthly_Dosage_Goal
      ,[FLMTHMETCurrMONTHLYDOSAGEGOAL] as Math_Focus_List_Student_Met_Current_Monthly_Dosage_Goal
      ,[FLMTHMETPrMONTHLYDOSAGEGOAL] as Math_Focus_List_Student_Met_Prior_Monthly_Dosage_Goal
      ,[FLBEHMET56DOSE] as Behavior_Focus_List_Student_Met_56hours_Dosage
      ,[FLATTMET56DOSE] as Attendance_Focus_List_Student_Met_56hours_Dosage
      ,[site_name] as Site_Name
      ,[REGION_NAME] as Region_Name
	into Eval_Labs.dbo.StudentLevelFile_ValidationReports
	from [EVAL_Labs].[dbo].[Eval_StudentLevelFile_Quarantine_FY17]
END

GO
