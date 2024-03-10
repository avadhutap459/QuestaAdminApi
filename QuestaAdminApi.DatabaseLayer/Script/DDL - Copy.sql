IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AssessmentId' AND Object_ID = Object_ID(N'mstCompany'))
BEGIN
    alter table mstCompany drop constraint FK_mstCompany_mstAssessmentSet_AssessmentId

    alter table mstCompany drop column AssessmentId
END

IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsBulkSentRequire' AND Object_ID = Object_ID(N'mstHumanResourceRepo'))
BEGIN
    alter table mstHumanResourceRepo drop column IsBulkSentRequire
END

IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsReportSentToCandidate' AND Object_ID = Object_ID(N'mstHumanResourceRepo'))
BEGIN
    alter table mstHumanResourceRepo drop column IsReportSentToCandidate
END

IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsReportSentToHr' AND Object_ID = Object_ID(N'mstHumanResourceRepo'))
BEGIN
    alter table mstHumanResourceRepo drop column IsReportSentToHr
END

IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'LinkCount' AND Object_ID = Object_ID(N'mstHumanResourceRepo'))
BEGIN
    alter table mstHumanResourceRepo drop column LinkCount
END


IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'mstmailConfigByAssessment'))
BEGIN
			CREATE TABLE [dbo].[mstmailConfigByAssessment](
			[MailConfigId] [int] IDENTITY(1,1) NOT NULL,
			[MailType] [varchar](50) NULL,
			[MailConfigName] [nvarchar](250) NULL,
			[AssessmentId] [int] NULL,
			[MailTemplateId] [int] NULL,
		 CONSTRAINT [PK_mstmailConfigByAssessment_MailConfigId] PRIMARY KEY CLUSTERED 
		(
			[MailConfigId] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]

		ALTER TABLE [dbo].[mstmailConfigByAssessment]  WITH CHECK ADD  CONSTRAINT [FK_mstmailConfigByAssessment_mstAssessmentSet_AssessmentId] FOREIGN KEY([AssessmentId])
		REFERENCES [dbo].[mstAssessmentSet] ([AssessmentId])

		ALTER TABLE [dbo].[mstmailConfigByAssessment] CHECK CONSTRAINT [FK_mstmailConfigByAssessment_mstAssessmentSet_AssessmentId]

		ALTER TABLE [dbo].[mstmailConfigByAssessment]  WITH CHECK ADD  CONSTRAINT [FK_mstmailConfigByAssessment_mstMailTemplate_MailTemplateId] FOREIGN KEY([MailTemplateId])
		REFERENCES [dbo].[mstMailTemplate] ([MailTemplateId])

		ALTER TABLE [dbo].[mstmailConfigByAssessment] CHECK CONSTRAINT [FK_mstmailConfigByAssessment_mstMailTemplate_MailTemplateId]


END






IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'txnCandidateLinkHistory'))
BEGIN
			CREATE TABLE [dbo].[txnCandidateLinkHistory](
				[LinkHisId] [int] IDENTITY(1,1) NOT NULL,
				[TestId] [int] NULL,
				[InitialMailTemplateId] [int] NULL,
				[FinalMailTemplateId] [int] NULL,
				[ReportSendToHr] [bit] NULL,
				[ReportSendToCandidate] [bit] NULL,
			 CONSTRAINT [PK_txnCandidateLinkHistory_LinkHisId] PRIMARY KEY CLUSTERED 
			(
				[LinkHisId] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]

			ALTER TABLE [dbo].[txnCandidateLinkHistory]  WITH CHECK ADD  CONSTRAINT [FK_txnCandidateLinkHistory_mstMailTemplate_FinalMailTemplateId] FOREIGN KEY([FinalMailTemplateId])
			REFERENCES [dbo].[mstMailTemplate] ([MailTemplateId])

			ALTER TABLE [dbo].[txnCandidateLinkHistory] CHECK CONSTRAINT [FK_txnCandidateLinkHistory_mstMailTemplate_FinalMailTemplateId]

			ALTER TABLE [dbo].[txnCandidateLinkHistory]  WITH CHECK ADD  CONSTRAINT [FK_txnCandidateLinkHistory_mstMailTemplate_InitialMailTemplateId] FOREIGN KEY([InitialMailTemplateId])
			REFERENCES [dbo].[mstMailTemplate] ([MailTemplateId])

			ALTER TABLE [dbo].[txnCandidateLinkHistory] CHECK CONSTRAINT [FK_txnCandidateLinkHistory_mstMailTemplate_InitialMailTemplateId]

			ALTER TABLE [dbo].[txnCandidateLinkHistory]  WITH CHECK ADD  CONSTRAINT [FK_txnCandidateLinkHistory_txnUserTestDetails_TestId] FOREIGN KEY([TestId])
			REFERENCES [dbo].[txnUserTestDetails] ([TestId])

			ALTER TABLE [dbo].[txnCandidateLinkHistory] CHECK CONSTRAINT [FK_txnCandidateLinkHistory_txnUserTestDetails_TestId]


END


IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'mstUserLogin'))
BEGIN

	
CREATE TABLE [dbo].[mstUserLogin](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[EmailId] [nvarchar](100) NULL,
	[MobileNo] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedAt] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_mstUserLogin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END


Alter table [dbo].[mstUserLogin] add RefreshToken Nvarchar(max)
Alter table [dbo].[mstUserLogin] add RefreshTokenExpiryTime DateTime