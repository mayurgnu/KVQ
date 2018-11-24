using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using KVDemoApi.Core.Entities;
using KVDemoApi.Infrastructure;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace KVDemoApi.Controllers
{
    [EnableCors(PolicyName = "MAYUR")]
    [ApiController]
    [Route("api/User")]
    public class UserController : Controller
    {
        IUnitOfWork uow;
        private IHostingEnvironment _hostingEnvironment;
        public UserController(IUnitOfWork _uow, IHostingEnvironment hostingEnvironment)
        {
            uow = _uow;
            _hostingEnvironment = hostingEnvironment;
        }
       [Route("GetAllUser")]
        public IActionResult GetAllUser()
        {
            var lst = uow.TblUser_Repository.GetAll();
            return this.Ok(lst);

        }
        [HttpPost]
        [Route("SaveUser")]
        public IActionResult SaveUser(TblUser obj)
        {
            try
            {
                uow.TblUser_Repository.Add(obj);
                uow.TblUser_Repository.Save();
                return Ok(obj);
            }
            catch (Exception ex)
            {
                return Ok(ex.Message);   
            }

        }
        [HttpPost, DisableRequestSizeLimit]
        public JsonResult UploadFile()
        {
            try
            {
                var file = Request.Form.Files[0];
                string folderName = "Upload";
                string webRootPath = _hostingEnvironment.WebRootPath;
                string newPath = Path.Combine(webRootPath, folderName);
                if (!Directory.Exists(newPath))
                {
                    Directory.CreateDirectory(newPath);
                }
                if (file.Length > 0)
                {
                    string fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    string fullPath = Path.Combine(newPath, fileName);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                }
                return new JsonResult(null);
            }
            catch (System.Exception ex)
            {
                return new JsonResult("Exception:- " + ex.Message);

            }

        }
    }
}