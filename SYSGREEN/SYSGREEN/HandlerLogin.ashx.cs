using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SYSGREEN
{
    /// <summary>
    /// Summary description for HandlerLogin
    /// </summary>
    public class HandlerLogin : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String userName = context.Request.Form["userName"].ToString();
            String Password = context.Request.Form["Password"].ToString();
            if (userName == "thanhdc7" && Password == "123456")
            {
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