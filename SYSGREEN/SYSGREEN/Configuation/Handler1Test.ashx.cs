using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for Handler1Test
    /// </summary>
    public class Handler1Test : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            if (type == "getALLData")
            {
                try
                {
                   
                    DataTable lst = Servies.HoaDonServices.getAllDataViewHoaDon();
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