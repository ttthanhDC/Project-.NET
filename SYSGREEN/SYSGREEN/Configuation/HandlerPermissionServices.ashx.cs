using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerPermissionServices
    /// </summary>
    public class HandlerPermissionServices : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            //String jsonData = context.Request.Form["data"].ToString();
            if (type == "addUserToGroupReturnId")
            {
                try
                {
                    String roleId = context.Request.Form["roleId"].ToString();
                    String UserId = context.Request.Form["UserId"].ToString();
                    int result = Servies.PermissionServices.addUserToGroupReturnId(Convert.ToInt16(roleId), Convert.ToInt16(UserId));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(result);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "removeUserInGroup")
            {
                try
                {
                    String roleId = context.Request.Form["roleId"].ToString();
                    String UserId = context.Request.Form["UserId"].ToString();
                    Servies.PermissionServices.removeUserInGroup(Convert.ToInt16(roleId), Convert.ToInt16(UserId));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getUserInGroup")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getUserInGroup(String MaHD,String TenKH,String TenSP)
                    String roleId = context.Request.Form["roleId"].ToString();
                    DataTable lst = Servies.PermissionServices.getUserInGroup(Convert.ToInt16(roleId));
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getAllFunction")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getUserInGroup(String MaHD,String TenKH,String TenSP)
                    DataTable lst = Servies.PermissionServices.getAllFunction();
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "UpdateFunctionPermision")
            {
                try
                {

                    String IsCreate = context.Request.Form["IsCreate"].ToString();
                    String IsEdit = context.Request.Form["IsEdit"].ToString();
                    String IsDelete = context.Request.Form["IsDelete"].ToString();
                    String IsView = context.Request.Form["IsView"].ToString();
                    String ID = context.Request.Form["ID"].ToString();
                    Servies.PermissionServices.UpdateFunctionPermision(Convert.ToInt16(IsCreate), Convert.ToInt16(IsEdit), Convert.ToInt16(IsDelete), Convert.ToInt16(IsView), Convert.ToInt16(ID));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }

            else if (type == "addFuntionToGroupReturnId")
            {
                try
                {
                    String FUNC_ID = context.Request.Form["FUNC_ID"].ToString();
                    String ROLE_ID = context.Request.Form["ROLE_ID"].ToString();
                    int result = Servies.PermissionServices.addFuntionToGroupReturnId(Convert.ToInt16(FUNC_ID), Convert.ToInt16(ROLE_ID));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(result);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getFuntionByGroupId")
            {
                try
                {
                    String ROLE_ID = context.Request.Form["ROLE_ID"].ToString();
                    DataTable dt = Servies.PermissionServices.getFuntionByGroupId(Convert.ToInt16(ROLE_ID));
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getPermisionByScreen")
            {
                try
                {
                    //(String nameScreen,String userName)

                    String nameScreen = context.Request.Form["nameScreen"].ToString();
                    String userName = context.Request.Form["userName"].ToString();
                    DataTable lst = Servies.PermissionServices.getPermisionByScreen(nameScreen, userName);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }//removeFuntionInGroup
            else if (type == "removeFuntionInGroup")
            {
                try
                {
                    String FUNC_ID = context.Request.Form["FUNC_ID"].ToString();
                    String ROLE_ID = context.Request.Form["ROLE_ID"].ToString();
                    Servies.PermissionServices.removeFuntionInGroup(Convert.ToInt16(FUNC_ID), Convert.ToInt16(ROLE_ID));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
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
                context.Response.Write("1");
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