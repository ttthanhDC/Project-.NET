using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace XanhLaMVC.Configuation
{
    /// <summary>
    /// Summary description for HandlerSysSource
    /// </summary>
    public class HandlerSysSource : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            
            if (type == "insert")
            {
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(jsonData);
                try
                {
                    obj.Create_Date = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    obj.Create_User = HttpContext.Current.Session["UserName"].ToString();
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
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(jsonData);
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
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(jsonData);
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
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(jsonData);
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    List<DataObject.SysSource> lst = GetData(obj.ID);

                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
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

        public void Insert(DataObject.SysSource obj)
        {
            Servies.SysSourceServices.InsertData(obj);
        }
        public void Update(DataObject.SysSource obj)
        {
            Servies.SysSourceServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysSourceServices.DeleteData(Id);
        }

        public List<DataObject.SysSource> GetData(Int32 Id)
        {
            List<DataObject.SysSource> lst = Servies.SysSourceServices.GetData(Id);
            return lst;
        }
    }
}