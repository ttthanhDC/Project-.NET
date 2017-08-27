using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace XanhLaMVC.Configuation
{
    /// <summary>
    /// Summary description for HandlerQuanHuyen
    /// </summary>
    public class HandlerQuanHuyen : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            
             String type = context.Request.Form["type"].ToString();

             if (type == "getData")
             {
                 try
                 {
                     // Case ID > 0 -> Result = 1 record
                     // Case ID = 0; -> Result = All Record
                     List<DataObject.QuanHuyen> lst = Servies.SysCustomerServices.getAllDataQH();
                     context.Response.ContentType = "application/json";
                     context.Response.Write(JsonConvert.SerializeObject(lst));
                 }
                 catch (Exception e)
                 {
                     context.Response.ContentType = "text/plain";
                     context.Response.Write("Error");
                 }
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