using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace SYSGREEN
{
    /// <summary>
    /// Summary description for HandlerLogin
    /// </summary>
    public class HandlerLogin : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String userName = context.Request.Form["userName"].ToString();
            String Password = context.Request.Form["Password"].ToString();
            DataTable dt = Servies.SysUserServies.CheckLogin(userName, Password);
            if (dt.Rows.Count > 0)
            {
                context.Session["UserName"] = userName;
                context.Response.ContentType = "text/plain";
                context.Response.Write("1");
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("0");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}