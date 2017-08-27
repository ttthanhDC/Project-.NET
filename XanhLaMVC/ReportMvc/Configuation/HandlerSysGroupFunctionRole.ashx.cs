﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace XanhLaMVC
{
    /// <summary>
    /// Summary description for HandlerSysGroupFunctionRole
    /// </summary>
    public class HandlerSysGroupFunctionRole : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.SysGroupFunctionRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupFunctionRole>(jsonData);
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
                    List<DataObject.SysGroupFunctionRole> lst = GetData(obj.ID);

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

        public void Insert(DataObject.SysGroupFunctionRole obj)
        {
            Servies.ServiesSysGroupFunctionRole.InsertData(obj);
        }
        public void Update(DataObject.SysGroupFunctionRole obj)
        {
            Servies.ServiesSysGroupFunctionRole.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysUserServies.DeleteData(Id);
        }

        public List<DataObject.SysGroupFunctionRole> GetData(Int32 Id)
        {
            List<DataObject.SysGroupFunctionRole> lst = Servies.ServiesSysGroupFunctionRole.GetData(Id);
            return lst;
        }
    }
}