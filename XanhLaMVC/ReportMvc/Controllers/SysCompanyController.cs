using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysCompanyController : Controller
    {
        //
        // GET: /SysCompany/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysCompany obj = new JavaScriptSerializer().Deserialize<DataObject.SysCompany>(data);
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
                DataObject.SysCompany obj = new JavaScriptSerializer().Deserialize<DataObject.SysCompany>(data);
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
                DataObject.SysCompany obj = new JavaScriptSerializer().Deserialize<DataObject.SysCompany>(data);
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
                DataObject.SysCompany obj = new JavaScriptSerializer().Deserialize<DataObject.SysCompany>(data);
                List<DataObject.SysCompany> lst = GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }

        public void Insert(DataObject.SysCompany obj)
        {
            Servies.SysCompanyServices.InsertData(obj);
        }
        public void Update(DataObject.SysCompany obj)
        {
            Servies.SysCompanyServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysCompanyServices.DeleteData(Id);
        }

        public List<DataObject.SysCompany> GetData(Int32 Id)
        {
            List<DataObject.SysCompany> lst = Servies.SysCompanyServices.GetData(Id);
            return lst;
        }
    }
}
