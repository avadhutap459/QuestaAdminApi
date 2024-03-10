IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AssessmentId' AND Object_ID = Object_ID(N'mstCompany'))
BEGIN
    alter table mstCompany drop constraint FK_mstCompany_mstAssessmentSet_AssessmentId

    alter table mstCompany drop column AssessmentId
END






