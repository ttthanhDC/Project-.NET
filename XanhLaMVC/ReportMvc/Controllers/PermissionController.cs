using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class PermissionController : Controller
    {
        //
        // GET: /Permission/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public Int32 addUserToGroupReturnId(String type, String data, String roleId, String UserId)
        {
            try
            {
                int result = Servies.PermissionServices.addUserToGroupReturnId(Convert.ToInt16(roleId), Convert.ToInt16(UserId));
                return result;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }

        }
        [HttpPost]
        public Int32 removeUserInGroup(String type, String data, String roleId, String UserId)
        {
            try
            {
                Servies.PermissionServices.removeUserInGroup(Convert.ToInt16(roleId), Convert.ToInt16(UserId));
                return 1;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }

        }
        [HttpPost]
        public JsonResult getUserInGroup(String type, String data, String roleId)
        {
            try
            {
                DataTable lst = Servies.PermissionServices.getUserInGroup(Convert.ToInt16(roleId));
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getAllFunction(String type, String data, String roleId)
        {
            try
            {
                DataTable lst = Servies.PermissionServices.getAllFunction(roleId);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public String UpdateFunctionPermision(String type, String data, String IsCreate, String IsEdit, String IsDelete, String IsView,String ID)
        {
            try
            {
                Servies.PermissionServices.UpdateFunctionPermision(Convert.ToInt16(IsCreate), Convert.ToInt16(IsEdit), Convert.ToInt16(IsDelete), Convert.ToInt16(IsView), Convert.ToInt16(ID));
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public String UpdateFunctionPermision(String type, String data, String IsCreate, String IsEdit, String IsDelete, String IsView, String ID)
        {
            try
            {
                Servies.PermissionServices.UpdateFunctionPermision(Convert.ToInt16(IsCreate), Convert.ToInt16(IsEdit), Convert.ToInt16(IsDelete), Convert.ToInt16(IsView), Convert.ToInt16(ID));
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public String addFuntionToGroupReturnId(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                Servies.PermissionServices.removeFuntionInGroup(Convert.ToInt16((String)dataDynamic[0].FUNC_ID), Convert.ToInt16((String)dataDynamic[0].ROLE_ID));
                for (int i = 0; i < dataDynamic.Count; i++)
                {
                    Servies.PermissionServices.addFuntionToGroupReturnId(Convert.ToInt16((String)dataDynamic[i].FUNC_ID), Convert.ToInt16((String)dataDynamic[i].ROLE_ID),
                        Convert.ToInt16((String)dataDynamic[i].IsCreate), Convert.ToInt16((String)dataDynamic[i].IsEdit), Convert.ToInt16((String)dataDynamic[i].IsDelete), Convert.ToInt16((String)dataDynamic[i].IsView));
                }
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public JsonResult getFuntionByGroupId(String type, String data, String ROLE_ID)
        {
            try
            {
                DataTable dt = Servies.PermissionServices.getFuntionByGroupId(Convert.ToInt16(ROLE_ID));
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getPermisionByScreen(String type, String data, String nameScreen, String userName)
        {
            try
            {
                DataTable lst = Servies.PermissionServices.getPermisionByScreen(nameScreen, userName);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public String removeFuntionInGroup(String type, String data, String FUNC_ID, String ROLE_ID)
        {
            try
            {
                Servies.PermissionServices.removeFuntionInGroup(Convert.ToInt16(FUNC_ID), Convert.ToInt16(ROLE_ID));
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public JsonResult getAllRole(String type, String data)
        {
            try
            {
                DataTable lst = Servies.PermissionServices.getAllRole();
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
    }
}
