USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[SR_ST_SPMBEH_Demographics]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SR_ST_SPMBEH_Demographics](
	[Student_Name] [varchar](80) NULL,
	[student_school_name] [varchar](1300) NULL,
	[cych_Accnt_SF_ID] [varchar](20) NULL,
	[Student_SF_ID] [varchar](18) NOT NULL,
	[student_ia_att] [decimal](1, 0) NULL,
	[Student_IA_Beh] [decimal](1, 0) NULL,
	[Student_IA_ELA] [decimal](1, 0) NULL,
	[Student_IA_Math] [decimal](1, 0) NULL,
	[student_gender] [varchar](255) NULL,
	[student_ethnicity] [varchar](255) NULL,
	[student_ell] [int] NOT NULL,
	[student_grade] [varchar](255) NULL,
	[cy_student_id] [varchar](100) NULL,
	[afterschoolpart] [int] NULL
) ON [Student]

GO
