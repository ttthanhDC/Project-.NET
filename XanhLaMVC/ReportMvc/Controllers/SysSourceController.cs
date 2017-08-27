using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace XanhLaMVC.Controllers
{
    public class SysSourceController : Controller
    {
        //
        // GET: /SysSource/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(data);
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
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(data);
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
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(data);
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
                DataObject.SysSource obj = new JavaScriptSerializer().Deserialize<DataObject.SysSource>(data);
                List<DataObject.SysSource> lst = GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        public void Insert(DataObject.SysSource obj)
        {
            Servies.SysSourceServices.InsertData(obj);
        }
        public void Update(DataObject.SysSource obj)
        {
            Servies.SysSourceServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysSourceServices.DeleteData(Id);
        }

        public List<DataObject.SysSource> GetData(Int32 Id)
        {
            List<DataObject.SysSource> lst = Servies.SysSourceServices.GetData(Id);
            return lst;
        }
    }
}
