using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using KVDemoApi.Core.Entities;
using KVDemoApi.Core.ViewModels;
using KVDemoApi.Infrastructure;
using KVDemoApi.Utility;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace KVDemoApi.Controllers
{
    [EnableCors(PolicyName = "CorsPolicy")]
    [ApiController]
    [Route("api/Account")]
    public class AccountController : Controller
    {
        IUnitOfWork uow;
        public AccountController(IUnitOfWork _uow)
        {
            uow = _uow;
        }
        [Route("Login")]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            try
            {
                var result = await uow.TblUser_Repository.
                    GetSingle(x => x.Username == model.UserName && x.Password == model.Password);
                if (result != null)
                {
                    return Ok(ApiResponse.SetResponse(ApiResponseStatus.Ok, "Success", ApiOpStatus.Success, result));
                }
                else
                {
                    return Ok(ApiResponse.SetResponse(ApiResponseStatus.Error, "Failed", ApiOpStatus.Failed, null));
                }
            }
            catch (Exception ex)
            {
                return Ok(ex.Message);
            }
        }
    }
}