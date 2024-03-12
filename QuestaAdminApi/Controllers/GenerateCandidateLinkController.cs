using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;

namespace QuestaAdminApi.Controllers
{
    [Route("api/v1")]
    [ApiController]
    public class GenerateCandidateLinkController : ControllerBase
    {
        private IMaster MasterSvc { get; set; }
        private ILinkGeneration LinkGenerationSvc { get; set; }
        public GenerateCandidateLinkController(IMaster _MasterSvc, ILinkGeneration _LinkGenerationSvc)
        {
            MasterSvc = _MasterSvc;
            LinkGenerationSvc = _LinkGenerationSvc;
        }
        [HttpGet]
        [Route("GetAssessmentDetailForGeneratingLink")]
        public IActionResult GetAssessmentDetailForGeneratingLink()
        {
            try
            {
                List<ClsCompanyModel> lstcompanymodel = new List<ClsCompanyModel>();

                lstcompanymodel = MasterSvc.GetAllCompanyDetail();

                return Ok(new { IsSucess = true, CompanyDetails = lstcompanymodel });
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpGet]
        [Route("GetAllAssessmentNHrDetailsBaseOnAssessmentId/{CompanyId}")]
        public IActionResult GetAllAssessmentNHrDetailsBaseOnAssessmentId(int CompanyId)
        {
            try
            {
                List<ClsAssessmentModel> lstassessmentdetails = new List<ClsAssessmentModel>();
                List<ClsHumanResouceModel> lsthrdetails = new List<ClsHumanResouceModel>();

                lstassessmentdetails = MasterSvc.GetAllAssessmentDetailsBaseCompanyId(CompanyId);

                lsthrdetails = MasterSvc.GetHrDetailsBaseOnCompany(CompanyId);


                return Ok(new {IsSucess = true ,AssessmentDetails = lstassessmentdetails, HrDetails = lsthrdetails });
            }
            catch(Exception ex)
            {
                throw;
            }
        }

        [HttpGet]
        [Route("GetMailConfigDataBaseOnAssessmentId/{AssessmentId}")]
        public IActionResult GetMailConfigDataBaseOnAssessmentId(int AssessmentId)
        {
            try
            {
                List<ClsMailConfigByAssessmentModel> lstinitialmaildetails = new List<ClsMailConfigByAssessmentModel>();
                List<ClsMailConfigByAssessmentModel> lstfinalmaildetails = new List<ClsMailConfigByAssessmentModel>();

                var mailtemplatedetails = MasterSvc.GetMailConfigDetailBaseOnAssessmentId(AssessmentId);
                lstinitialmaildetails = mailtemplatedetails.Item1;
                lstfinalmaildetails = mailtemplatedetails.Item2;


                return Ok(new {IsSucess = true, InitialMailTemplate = lstinitialmaildetails , FinalMailTemplate = lstfinalmaildetails});
            }
            catch(Exception ex)
            {
                throw;
            }
        }

        [HttpPost("GenerateLinkBaseUserSelection")]
        public IActionResult GenerateLinkBaseUserSelection(ClsLinkGenerationModel linkgenerationmodel)
        {
            try
            {
                string ConfigName = "EmailFlg_" + this.Request.Host.Value.ToString();

                string Url = MasterSvc.GetAsessmentUrlBaseOnDns(ConfigName);
                List<string> lstlinks = new List<string>();
               

                for (int i = 1;i<= linkgenerationmodel.LinkCount; i++)
                {
                    int TestId = LinkGenerationSvc.GenerateTestIdBaseonRequireDetails(linkgenerationmodel.AssessmentID, linkgenerationmodel.CompanyId,
                        linkgenerationmodel.HrId, linkgenerationmodel.InitialMailId, linkgenerationmodel.FinalMailId, linkgenerationmodel.IsReportSendToHr,
                        linkgenerationmodel.IsReportSendToCandidate);
                    string URL = Url + TestId;
                    lstlinks.Add(Url);
                }

                return Ok(new { IsSucess = true, Links = lstlinks });
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
