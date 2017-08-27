using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysOrgController : Controller
    {
        //
        // GET: /SysOrg/

        public ActionResult Index()
        {
            return View();
        }
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysOrg obj = new JavaScriptSerializer().Deserialize<DataObject.SysOrg>(data);
                obj.Create_Date = DateTime.Now;
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
                DataObject.SysOrg obj = new JavaScriptSerializer().Deserialize<DataObject.SysOrg>(data);
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
                DataObject.SysOrg obj = new JavaScriptSerializer().Deserialize<DataObject.SysOrg>(data);
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
                DataObject.SysOrg obj = new JavaScriptSerializer().Deserialize<DataObject.SysOrg>(data);
                List<DataObject.SysOrg> lst = GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        public void Insert(DataObject.SysOrg obj)
        {
            Servies.SysOrgServies.InsertData(obj);
        }
        public void Update(DataObject.SysOrg obj)
        {
            Servies.SysOrgServies.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysOrgServies.DeleteData(Id);
        }

        public List<DataObject.SysOrg> GetData(Int32 Id)
        {
            List<DataObject.SysOrg> lst = Servies.SysOrgServies.GetData(Id);
            return lst;
        }
    }
}
