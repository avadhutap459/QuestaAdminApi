CREATE TABLE [dbo].[mstAssessmentSet](
	[AssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentName] [varchar](50) NULL,
	[CreateBy] [varchar](50) NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[LastModifiedAt] [datetime] NULL,
	[TotalQuestion] [int] NULL,
 CONSTRAINT [PK_mstAssessmentSet_AssessmentId] PRIMARY KEY CLUSTERED 
(
	[AssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mstCompany](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastModifiedAt] [datetime] NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_mstCompany] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[mstHumanResourceRepo](
	[HrId] [int] IDENTITY(1,1) NOT NULL,
	[HrName] [varchar](250) NULL,
	[HrEmail] [varchar](250) NULL,
	[HrPhoneNumber] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_mstHumanResourceRepo_HrId] PRIMARY KEY CLUSTERED 
(
	[HrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[mstHumanResourceRepo]  WITH CHECK ADD  CONSTRAINT [FK_mstHumanResourceRepo_mstCompany_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[mstCompany] ([CompanyId])
GO

ALTER TABLE [dbo].[mstHumanResourceRepo] CHECK CONSTRAINT [FK_mstHumanResourceRepo_mstCompany_CompanyId]
GO




CREATE TABLE [dbo].[mstMailTemplate](
	[MailTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[SMTP_SenderNAME] [varchar](max) NULL,
	[SMTP_USERNAME] [varchar](max) NULL,
	[SMTP_PASSWORD] [varchar](max) NULL,
	[CONFIGSET] [varchar](max) NULL,
	[FromMailAddress] [varchar](max) NULL,
	[BCCMailAddress] [varchar](max) NULL,
	[CCMailAddress] [varchar](max) NULL,
	[HOST] [varchar](max) NULL,
	[PORT] [varchar](max) NULL,
	[BODY] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_mstMailTemplate] PRIMARY KEY CLUSTERED 
(
	[MailTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

Insert into [dbo].[mstMailTemplate](SMTP_SenderNAME,SMTP_USERNAME,SMTP_PASSWORD,CONFIGSET,FromMailAddress,BCCMailAddress,CCMailAddress,HOST,PORT,BODY,Active)
VALUES('Questa Enneagram Assessment','AKIAYNH52N4VNGNPG774','BLhNdOkLRjvzh2VQO3v5dgu5AK1LnBpYFVUWQljxEP5e','QuestaEmailServer','assessment@questa.in','support@questa.in;avadhutap459@gmail.com','','email-smtp.ap-south-1.amazonaws.com',587,'<p>Dear @RecevierName,</p>    <p>Welcome to Questa Enneagram Assessment Framework. As a part of the Hiring Process of the organization you are requested to undergo this assessment which multiple modules broadly classified into two sections - </p>  <ul>      <li>          Personality and Behavioural Assessments (No time limit)      </li>      <li>          Aptitude (30 minutes Time limit)      </li>  </ul>    <div class="border">      <p><b>Important Instructions: </b></p>      <ul>          <li>              You can take this assessment through a mobile device/PC or Laptop which has uninterrupted internet connectivity. The assessment is compatible with browsers like Google Chrome, Safari and Mozilla Firefox.           </li>          <li>              On an average it takes 40 to 45 minutes to complete the assessment. Please ensure that you dedicate this time entirely without any disturbances or interruptions.           </li>          <li>              In case you get logged off during the assessment, please open the link shared on mail again and click on start test directly without providing the details again. Your previous responses will be saved and you will be able to start from where you left!            </li>          <li>              Please read the on-page module instructions carefully and respond accordingly. This is important as each module has a different set of guidelines.           </li>          <li>              Once you submit all the responses, your Profile will be sent to the HR.           </li>          <ul>  </div>      <p style="font-size:15px"><b>Click on the link below to start your Online Assessment now!</b></p>  <p>@URL</p>  <p><b>User Email</b> :- @Email</p>  <p><b>Assessment Id</b> :- @TestId </p>  <p><b>Please note that the link for the assessment will remain active for 15 days from the date of generation of this          email.</b></p>  <p>Feel free to reach out to us for any queries/further assistance or issues while attempting the assessment at <a          href="mailto:support@questaenneagram.com">support@questaenneagram.com</a></p>  <p>To know more about us, please visit our site at <a href="https://questaenneagram.com"          target="_self">www.questaenneagram.com<a /></p><br /><br /><br />  <center><i>Paving a path towards self-discovery and transformation</i><br /><i>Team Questa Enneagram</i></center>  <center><a href="https://questaenneagram.com" target="_self"> <img class="image" src=cid:myFooterID></a></center><br />  <center>      <div class="box">          <div class="image-container"><a href="https://www.facebook.com/questaenneagram/" target="_self"> <img                      src=cid:myFacebookID>              </a>&nbsp;&nbsp;<a href="mailto:support@questaenneagram.com" target="_self"> <img                      src=cid:myAtID></a>&nbsp;&nbsp;<a                  href="https://www.linkedin.com/company/questa-management-consultants-pvt-ltd-/" target="_self"> <img                      src=cid:myLinkedInID><a></div>      </div>  </center>',1),
('Questa Enneagram Assessment','AKIAYNH52N4VNGNPG774','BLhNdOkLRjvzh2VQO3v5dgu5AK1LnBpYFVUWQljxEP5e','QuestaEmailServer','assessment@questa.in','support@questa.in;avadhutap459@gmail.com','','email-smtp.ap-south-1.amazonaws.com',587,'<p>Dear @RecevierName,</p>    <p>Thank you for completing the assessment.    You are now a step closer to discovering more about yourself! We would be sending your profile to the registered email within the <b>next 48-72 working hours</b>.</p>    <p>In the meantime, you can learn more about the concepts of the Enneagram <a href = "https://questaenneagram.com" target = "_self">here </a>.</p>      <p>Your profile will help you to understand yourself better. Following aspects are covered in our detailed 40-page report:</p>        <table>   <tr>    <td>     <ol style="list-style-type:none">        <li> &#10003; Personality Structure</li>        <li> &#10003; Workplace behaviour</li>        <li> &#10003; Wings & Lines Usage</li>     </ol>    </td>    <td>     <ol style="list-style-type:none">        <li> &#10003; Motivation</li>        <li> &#10003; Social & Conflict style</li>        <li> &#10003; How others see you</li>     </ol>    </td>    <td>     <ol style="list-style-type:none">        <li> &#10003; Childhood patterns</li>        <li> &#10003; Strengths & Derailers</li>        <li> &#10003; Instincts </li>     </ol>    </td>   </tr>  </table>      <p>If you have any queries, please feel free to reach out to us at <a href = "mailto:support@questaenneagram.com" target = "_self"> support@questaeneagram.com </a>   </p>    <p>To know more, please visit us at <a href = "https://questaenneagram.com" target = "_self">www.questaenneagram.com</a></p>    <br/>  <center><i>Paving a path towards self-discovery and transformation</i><br/><i>Team Questa Enneagram</i></center>  <center><a href = "https://questaenneagram.com" target = "_self"> <img class="image"   src=cid:myFooterID></a></center>  <br/>    <center>  <div class="box">   <div class="image-container">  <a href = "https://www.facebook.com/questaenneagram/" target = "_self">    <img src=cid:myFacebookID>  </a>   &nbsp;&nbsp;  <a href="mailto:support@questaenneagram.com" target = "_self">   <img  src=cid:myAtID>  </a>&nbsp;&nbsp;  <a href = "https://www.linkedin.com/company/questa-management-consultants-pvt-ltd-/" target = "_self">    <img  src=cid:myLinkedInID>  <a>             </div>  </div>  </center>',1)

