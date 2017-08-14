using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace SYSGREEN
{
    /// <summary>
    /// Summary description for HandlerSysGroupUserRole
    /// </summary>
    public class HandlerSysGroupUserRole : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.SysGroupUserRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupUserRole>(jsonData);
            if (type == "insert")
            {
                try
                {
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
                    List<DataObject.SysGroupUserRole> lst = GetData(obj.ID);

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

        public void Insert(DataObject.SysGroupUserRole obj)
        {
            Servies.ServiesSysGroupUserRole.InsertData(obj);
        }
        public void Update(DataObject.SysGroupUserRole obj)
        {
            Servies.ServiesSysGroupUserRole.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.ServiesSysGroupUserRole.DeleteData(Id);
        }

        public List<DataObject.SysGroupUserRole> GetData(Int32 Id)
        {
            List<DataObject.SysGroupUserRole> lst = Servies.ServiesSysGroupUserRole.GetData(Id);
            return lst;
        }
    }
}