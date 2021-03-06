USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[Refresh_FY17Tables]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Refresh_FY17Tables]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	exec [dbo].[sp_Eval_StudentLevelFile_Quarantine_FY17]
	exec [dbo].[sp_MIR_M2_ASSESSMENTSBYMONTH]
	exec [dbo].[sp_MIR_M2_AVGDAYSBTWDESSA]
	exec [dbo].[sp_MIR_M1_ProgramEnrollmentByMonth]
	exec [dbo].[sp_MIR_M2_DESSAMIENROLLMENT]
	exec [dbo].[sp_mir_p3_ac_met_not_met]
	--exec [dbo].[sp_FY17Att]
	--exec [dbo].[sp_FY17Susp]
	--exec [dbo].[sp_FY17_Dessamini]
	--exec [dbo].[sp_FY17_ELACG]
	--exec [dbo].[sp_FY17LitAssess]
	--exec [dbo].[sp_FY17_MathAssess]
	--exec [dbo].[sp_FY17_MathCG]
END

GO
