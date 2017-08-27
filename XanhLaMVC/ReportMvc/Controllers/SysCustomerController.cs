using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysCustomerController : Controller
    {
        //
        // GET: /SysCustomer/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
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
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
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
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
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
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
                List<DataObject.SysCustomer> lst = GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getDataByPhoneNumber(String type, String data)
        {
            try
            {
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
                List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetDataByPhoneNumber(obj.PhoneNumber);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getDataByEmail(String type, String data)
        {
            try
            {
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
                List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetDataByEmail(obj.Email);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getCustomerById(String type, String data, String makh)
        {
            try
            {
                List<DataObject.SysCustomer> lst = GetData(Convert.ToInt32(makh));
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }

        public void Insert(DataObject.SysCustomer obj)
        {
            Servies.SysCustomerServices.InsertData(obj);
        }
        public void Update(DataObject.SysCustomer obj)
        {
            Servies.SysCustomerServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysCustomerServices.DeleteData(Id);
        }

        public List<DataObject.SysCustomer> GetData(Int32 Id)
        {
            List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetData(Id);
            return lst;
        }

    }
}
