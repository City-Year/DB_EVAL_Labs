USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[StudentLevelFile_ValidationReports]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentLevelFile_ValidationReports](
	[School_Name] [varchar](100) NULL,
	[Diplomas_Now_School] [varchar](15) NULL,
	[First_Name] [varchar](100) NULL,
	[Middle_Name] [varchar](100) NULL,
	[Last_Name] [varchar](100) NULL,
	[Student_Local_District_ID] [varchar](250) NULL,
	[CY_ID] [varchar](100) NULL,
	[Gender] [varchar](50) NULL,
	[Grade_Level] [int] NULL,
	[Literacy_Indicator_Area] [varchar](250) NULL,
	[Math_Indicator_Area] [varchar](250) NULL,
	[Behavior_Indicator_Area] [varchar](250) NULL,
	[Attendance_Indicator_Area] [varchar](250) NULL,
	[Literacy_Primary_ACM_Name] [varchar](50) NULL,
	[Math_Primary_ACM_Name] [varchar](50) NULL,
	[Behavior_Primary_ACM_Name] [varchar](50) NULL,
	[Attendance_Primary_ACM_Name] [varchar](50) NULL,
	[Literacy_Enrollment_Date] [datetime] NULL,
	[Literacy_Exit_Date] [datetime] NULL,
	[Literacy_Days_Enrolled] [int] NULL,
	[Literacy_Total_Dosage] [int] NULL,
	[Literacy_Met_Current_Monthly_Dosage_Goal] [int] NULL,
	[Literacy_Met_Prior_Monthly_Dosage_Goal] [int] NULL,
	[Math_Enrollment_Date] [datetime] NULL,
	[Math_Exit_Date] [datetime] NULL,
	[Math_Days_Enrolled] [int] NULL,
	[Math_Total_Dosage] [int] NULL,
	[Math_Met_Current_Monthly_Dosage_Goal] [int] NULL,
	[Math_Met_Prior_Monthly_Dosage_Goal] [int] NULL,
	[Behavior_Enrollment_Date] [datetime] NULL,
	[Behavior_Exit_Date] [datetime] NULL,
	[Behavior_Days_Enrolled] [int] NULL,
	[Behavior_Met_56hours_Dosage] [int] NULL,
	[Attendance_Enrollment_Date] [datetime] NULL,
	[Attendance_Exit_Date] [datetime] NULL,
	[Attendance_Days_Enrolled] [int] NULL,
	[Attendance_Met_56hours_Dosage] [int] NULL,
	[OtherProgramming_Total_Dosage] [int] NULL,
	[OtherProgramming_Days_Enrolled] [int] NULL,
	[OtherProgramming_Enrollment_Date] [datetime] NULL,
	[OtherProgramming_Exit_Date] [datetime] NULL,
	[Literacy_Focus_List_Student] [int] NULL,
	[Math_Focus_List_Student] [int] NULL,
	[Behavior_Focus_List_Student] [int] NULL,
	[Attendance_Focus_List_Student] [int] NULL,
	[Literacy_Focus_List_Student_Met_Current_Monthly_Dosage_Goal] [int] NULL,
	[Literacy_Focus_List_Student_Met_Prior_Monthly_Dosage_Goal] [int] NULL,
	[Math_Focus_List_Student_Met_Current_Monthly_Dosage_Goal] [int] NULL,
	[Math_Focus_List_Student_Met_Prior_Monthly_Dosage_Goal] [int] NULL,
	[Behavior_Focus_List_Student_Met_56hours_Dosage] [int] NULL,
	[Attendance_Focus_List_Student_Met_56hours_Dosage] [int] NULL,
	[Site_Name] [varchar](100) NULL,
	[Region_Name] [varchar](100) NULL
) ON [PRIMARY]

GO
