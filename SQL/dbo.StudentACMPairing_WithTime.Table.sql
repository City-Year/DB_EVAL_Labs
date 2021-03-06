USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].[StudentACMPairing_WithTime]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentACMPairing_WithTime](
	[business_unit] [varchar](255) NULL,
	[student_name] [varchar](80) NULL,
	[student_gender] [varchar](255) NULL,
	[student_ethnicity] [varchar](255) NULL,
	[student_ell] [int] NOT NULL,
	[student_grade] [varchar](255) NULL,
	[cy_student_id] [varchar](100) NULL,
	[student_school_name] [varchar](1300) NULL,
	[cych_Accnt_SF_ID] [varchar](20) NULL,
	[Student_SF_ID] [varchar](18) NOT NULL,
	[STUDENT_IA_ATT] [decimal](1, 0) NULL,
	[STUDENT_IA_BEH] [decimal](1, 0) NULL,
	[STUDENT_IA_ELA] [decimal](1, 0) NULL,
	[STUDENT_IA_MATH] [decimal](1, 0) NULL,
	[SECTION_IA_INTFINAL] [varchar](255) NULL,
	[BEHFL] [int] NULL,
	[ATTfl] [int] NULL,
	[ELAFL] [int] NULL,
	[MATHFL] [int] NULL,
	[Section_Primary_Staff] [varchar](80) NULL,
	[section_primary_staff_id] [varchar](18) NULL,
	[email__C] [varchar](80) NULL,
	[section_ia] [varchar](255) NULL,
	[dosage_cyid] [varchar](100) NULL,
	[dosage_primaryid] [varchar](18) NULL,
	[dosage_sectionia] [varchar](255) NULL,
	[totaltime] [decimal](38, 0) NULL,
	[maxdosage] [decimal](38, 0) NULL
) ON [PRIMARY]

GO
