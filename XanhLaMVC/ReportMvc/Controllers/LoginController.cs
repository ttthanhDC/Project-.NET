using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Login()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";
            return View();
        }
        //public JsonResult
        [HttpPost]
        public String LoginUser(String userName,String Password)
        {
            
            DataTable dt = Servies.SysUserServies.CheckLogin(userName, Password);
            if (dt.Rows.Count > 0)
            {
                this.Session["UserName"] = userName;
                return "1";
            }
            else
            {
                return "0";
            }
        }

    }
}
