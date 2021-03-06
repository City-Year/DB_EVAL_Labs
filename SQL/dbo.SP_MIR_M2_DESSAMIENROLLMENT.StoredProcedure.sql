USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[SP_MIR_M2_DESSAMIENROLLMENT]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MIR_M2_DESSAMIENROLLMENT]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	drop table eval_labs.dbo.MIR_M2_DESSAMIENROLLMENT
  select CYSCHOOLHOUSE_STUDENT_ID, max(case when prog_desc = 'dessa' and last_intervention = '1900-01-01 00:00:00.000' then 1 else 0 end) as enrolled_Dessa,
   max(case when prog_desc = 'Math Inventory' and last_intervention='1900-01-01 00:00:00.000'  then 1 else 0 end) as 
  enrolled_mi
  into eval_labs.dbo.MIR_M2_DESSAMIENROLLMENT
 from [EVAL_Labs].[dbo].[MIR_M1_programenrollment_bymonth]
  group by cyschoolhouse_student_id

END

GO
