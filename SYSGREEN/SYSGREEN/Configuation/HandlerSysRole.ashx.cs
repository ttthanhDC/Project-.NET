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
    /// Summary description for HandlerSysRole
    /// </summary>
    public class HandlerSysRole : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.SysRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysRole>(jsonData);
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
                    List<DataObject.SysRole> lst = GetData(obj.ID);

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

        public void Insert(DataObject.SysRole obj)
        {
            Servies.SysRoleServices.InsertData(obj);
        }
        public void Update(DataObject.SysRole obj)
        {
            Servies.SysRoleServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysRoleServices.DeleteData(Id);
        }

        public List<DataObject.SysRole> GetData(Int32 Id)
        {
            List<DataObject.SysRole> lst = Servies.SysRoleServices.GetData(Id);
            return lst;
        }
    }
}