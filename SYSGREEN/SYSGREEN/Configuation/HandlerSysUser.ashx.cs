using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SYSGREEN
{
    /// <summary>
    /// Summary description for HandlerSysUser
    /// </summary>
    public class HandlerSysUser : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(jsonData);
            if (type == "insert")
            {
                try
                {
                    obj.Create_Date = DateTime.Now;
                    List<DataObject.SysUser> lst = Servies.SysUserServies.GetDataByUserName(obj.UserName);
                    if (lst.Count > 0)
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Thêm mới không thành công! Tên người dùng đã tồn tại trong hệ thống");
                    }
                    List<DataObject.SysUser> lstEmail = Servies.SysUserServies.GetDataEmail(obj.Email);
                    if (lstEmail.Count > 0)
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Thêm mới không thành công! Địa chỉ Email đã tồn tại trong hệ thống");
                    }
                    else
                    {
                        Insert(obj);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("insert data success");
                    }
                    
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
                    List<DataObject.SysUser> lstEmail = Servies.SysUserServies.GetDataEmail(obj.Email);
                    if (lstEmail.Count > 0)
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Cập nhật thông tin không thành công! Địa chỉ Email đã tồn tại trong hệ thống");
                    }
                    else
                    {
                        Update(obj);
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("Cập nhật thông tin người dùng thành công");
                    }
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
                    context.Response.Write("Xóa người dùng thành công");
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
                    List<DataObject.SysUser> lst = GetData(obj.ID);

                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getDataDept")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    List<DataObject.DeptObject> lst = Servies.DeptObjectServices.GetData(0);

                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getDataOrg")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    List<DataObject.SysOrg> lst = Servies.SysOrgServies.GetData(0);
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
        public void Insert(DataObject.SysUser obj)
        {
            Servies.SysUserServies.InsertData(obj);
        }
        public void Update(DataObject.SysUser obj)
        {
            Servies.SysUserServies.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysUserServies.DeleteData(Id);
        }

        public List<DataObject.SysUser> GetData(Int32 Id)
        {
            List<DataObject.SysUser> lst = Servies.SysUserServies.GetData(Id);
            return lst;
        }
    }
}