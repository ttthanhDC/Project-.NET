using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SYSGREEN.Receptionist
{
    /// <summary>
    /// Summary description for HandlerReceptionist
    /// </summary>
    public class HandlerReceptionist : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
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