using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace SYSGREEN.Configuation
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
                    obj.Create_Date = DateTime.Now;
                    Insert(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
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
                    Update(obj);
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
                    DeleteData(obj.ID);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
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
                    List<DataObject.SysMenu> lst = GetData(obj.ID);

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

        public void Insert(DataObject.SysMenu obj)
        {
            Servies.SysMenuServices.InsertData(obj);
        }
        public void Update(DataObject.SysMenu obj)
        {
            Servies.SysMenuServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysMenuServices.DeleteData(Id);
        }

        public List<DataObject.SysMenu> GetData(Int32 Id)
        {
            List<DataObject.SysMenu> lst = Servies.SysMenuServices.GetData(Id);
            return lst;
        }
    }
}