using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysGroupFunctionRoleController : Controller
    {
        //
        // GET: /SysGroupFunctionRole/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysGroupFunctionRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupFunctionRole>(data);
                Insert(obj);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public String update(String type, String data)
        {
            try
            {
                DataObject.SysGroupFunctionRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupFunctionRole>(data);
                Update(obj);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public String delete(String type, String data)
        {
            try
            {
                DataObject.SysGroupFunctionRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupFunctionRole>(data);
                DeleteData(obj.ID);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public JsonResult getData(String type, String data)
        {
            try
            {
                DataObject.SysGroupFunctionRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupFunctionRole>(data);
                List<DataObject.SysGroupFunctionRole> lst = GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
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
