USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[Impact_Report]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Impact_Report]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--exec [dbo].[sp_Eval_StudentLevelFile]
	
	exec [dbo].[sp_Eval_Duplicates]
	EXEC [dbo].[sp_LitAssessment]
	EXEC [dbo].[sp_MthAssessment]
	EXEC [dbo].[sp_Attendance]
	EXEC [dbo].[sp_beh_susp]
	EXEC [dbo].[sp_dessa_mini]
	EXEC [dbo].[sp_elacg]
	EXEC [dbo].[sp_mthcg]
	EXEC [dbo].[sp_Eval_StudentLevelFile_Quarantine]
	exec [dbo].[sp_Eval_MIM_ACTab]
	exec [dbo].[sp_Eval_MIM_SchoolTab]
	exec [dbo].[sp_Eval_MIM_EnrollmentTab]
	exec [dbo].[refresh_fy17tables]
END

GO
