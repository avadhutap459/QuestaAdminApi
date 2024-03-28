using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace QuestaAdminApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        public IActionResult Get()
        {
            return Ok("Code Review");
        }
    }
}
