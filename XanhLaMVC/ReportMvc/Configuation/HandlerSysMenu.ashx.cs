using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace XanhLaMVC.Configuation
{
    /// <summary>
    /// Summary description for HandlerSysMenu
    /// </summary>
    public class HandlerSysMenu : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.SysMenu obj = new JavaScriptSerializer().Deserialize<DataObject.SysMenu>(jsonData);
            if (type == "insert")
            {
                try
                {
                    String Code = context.Request.Form["Code"].ToString();
                    String ProductId = context.Request.Form["ProductId"].ToString();
                    int result = Servies.SysMenuServices.InsertData(Convert.ToInt16(Code), Convert.ToInt16(ProductId));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(result);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }

            }
            else if (type == "update")
            {
                try
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "delete")
            {
                try
                {
                    String Code = context.Request.Form["Code"].ToString();
                    String ProductId = context.Request.Form["ProductId"].ToString();
                    Servies.SysMenuServices.DeleteData(Convert.ToInt16(Code), Convert.ToInt16(ProductId));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getData")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    String Code = context.Request.Form["Code"].ToString();
                    DataTable lst = Servies.SysMenuServices.GetProductByIdCode(Convert.ToInt16(Code));
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getALLMenu")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    DataTable lst = Servies.SysMenuServices.GetAllMenu();
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getSessionUser")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    String UserName = HttpContext.Current.Session["UserName"].ToString();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(UserName);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Hello");
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