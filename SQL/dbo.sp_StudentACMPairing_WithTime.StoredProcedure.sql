USE [EVAL_Labs]
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentACMPairing_WithTime]    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_StudentACMPairing_WithTime] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	drop table Eval_Labs.dbo.StudentACMPairing_WithTime
	select a.*, c.Section_Primary_Staff, c.section_primary_staff_id, d.email__C, c.section_ia, e.cy_student_id as dosage_cyid, e.section_primary_staff_id as dosage_primaryid, e.section_ia as dosage_sectionia, e.totaltime, e.maxdosage
	into Eval_Labs.dbo.StudentACMPairing_WithTime
from
(SELECT DISTINCT 
	business_unit,
	student_name, 
	student_gender, 
	student_ethnicity, 
	student_ell, 
	student_grade, 
	cy_student_id, 
	student_school_name, 
	cych_Accnt_SF_ID, 
	Student_SF_ID,
	STUDENT_IA_ATT, 
	STUDENT_IA_BEH, 
	STUDENT_IA_ELA, 
	STUDENT_IA_MATH, 
	SECTION_IA as SECTION_IA_INTFINAL, 
	CASE WHEN SECTION_IA LIKE 'BEH%' AND STUDENT_IA_BEH = 1 THEN 1 ELSE NULL END AS BEHFL, 
	CASE WHEN SECTION_IA LIKE 'ATT%' AND STUDENT_IA_ATT = 1 THEN 1 ELSE NULL END AS ATTfl, 
	CASE WHEN SECTION_IA LIKE 'ELA%' AND STUDENT_IA_ELA=1 THEN 1 ELSE NULL END AS ELAFL,
	CASE WHEN SECTION_IA LIKE 'MAT%' AND STUDENT_IA_MATH=1 THEN 1 ELSE NULL END AS MATHFL
FROM [SDW_Stage_Prod].[dbo].[vw_Intervention_final]) a
LEFT JOIN 
(SELECT DISTINCT 
			[SDW_Stage_Prod].dbo.vw_Intervention_final.cych_Accnt_SF_ID, [SDW_Stage_Prod].dbo.vw_Intervention_final.Student_SF_ID, [SDW_Stage_Prod].dbo.vw_Intervention_final.Section_IA, 
			[SDW_Stage_Prod].dbo.vw_Section_Staff_to_Int_Staff_IDs.Intervention_Corps_Member_ID AS Section_Primary_Staff_ID, 
			[SDW_Stage_Prod].dbo.vw_Section_Staff_to_Int_Staff_IDs.Intervention_Corps_Member AS Section_Primary_Staff
FROM        [SDW_Stage_Prod].dbo.vw_Section_Staff_to_Int_Staff_IDs RIGHT OUTER JOIN
            [SDW_Stage_Prod].dbo.vw_Intervention_final ON [SDW_Stage_Prod].dbo.vw_Section_Staff_to_Int_Staff_IDs.Section_Primary_Staff_ID = [SDW_Stage_Prod].dbo.vw_Intervention_final.Section_Primary_Staff_ID
WHERE       [SDW_Stage_Prod].dbo.vw_Section_Staff_to_Int_Staff_IDs.Intervention_Corps_Member_ID IS NOT NULL) C
ON C.STUDENT_SF_ID=a.STUDENT_SF_ID AND a.SECTION_IA_INTFINAL=c.section_ia
join
[SDW_Stage_Prod].[dbo].[Staff__c] d
on d.id=c.section_primary_staff_id
join 
(select * from
(select *, max(totaltime) over (partition by  cy_student_id, section_ia) as maxdosage from
(select cy_student_id, section_primary_staff_id, section_ia, sum(session_dossage) as totaltime
from [sdw_stage_prod].[dbo].[vw_Intervention_final] 
group by cy_student_id, section_primary_staff_id, section_ia) f) g
where  totaltime=maxdosage) e
on e.section_primary_staff_id=c.section_primary_staff_id and e.cy_student_id= a.cy_student_id and e.section_ia=c.section_ia
WHERE (BEHFL IS NOT NULL OR ATTFL IS NOT NULL OR ELAFL IS NOT NULL OR MATHFL IS NOT NULL)


END

GO
