using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysRoleController : Controller
    {
        //
        // GET: /SysRole/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysRole>(data);
                obj.Create_Date = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                obj.Create_User = this.Session["UserName"].ToString();
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
                DataObject.SysRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysRole>(data);
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
                DataObject.SysRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysRole>(data);
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
                DataObject.SysRole obj = new JavaScriptSerializer().Deserialize<DataObject.SysRole>(data);
                List<DataObject.SysRole> lst = GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
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
