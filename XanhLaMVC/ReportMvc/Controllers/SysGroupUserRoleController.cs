using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysGroupUserRoleController : Controller
    {
        //
        // GET: /SysGroupUserRole/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysGroupUserRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupUserRole>(data);
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
                DataObject.SysGroupUserRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupUserRole>(data);
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
                DataObject.SysGroupUserRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupUserRole>(data);
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
        public ContentResult getData(String type, String data)
        {
            try
            {
                DataObject.SysGroupUserRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysGroupUserRole>(data);
                List<DataObject.SysGroupUserRole> lst = GetData(obj.ID);
                var list = JsonConvert.SerializeObject(lst,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
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
