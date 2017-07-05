using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerSysCustomer
    /// </summary>
    public class HandlerSysCustomer : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(jsonData);
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
                    List<DataObject.SysCustomer> lst = GetData(obj.ID);

                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getDataByPhoneNumber")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetDataByPhoneNumber(obj.PhoneNumber);

                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getDataByEmail")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetDataByEmail(obj.Email);
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

        public void Insert(DataObject.SysCustomer obj)
        {
            Servies.SysCustomerServices.InsertData(obj);
        }
        public void Update(DataObject.SysCustomer obj)
        {
            Servies.SysCustomerServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysCustomerServices.DeleteData(Id);
        }

        public List<DataObject.SysCustomer> GetData(Int32 Id)
        {
            List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetData(Id);
            return lst;
        }
    }
}