using Newtonsoft.Json;
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
        public ContentResult getData(String type, String data)
        {
            try
            {
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
                List<DataObject.SysCustomer> lst = GetData(obj.ID);
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
        [HttpPost]
        public ContentResult getDataByPhoneNumber(String type, String data)
        {
            try
            {
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
                List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetDataByPhoneNumber(obj.PhoneNumber);
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
        [HttpPost]
        public ContentResult getDataByEmail(String type, String data)
        {
            try
            {
                DataObject.SysCustomer obj = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(data);
                List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetDataByEmail(obj.Email);
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
        [HttpPost]
        public ContentResult getCustomerById(String type, String data, String makh)
        {
            try
            {
                List<DataObject.SysCustomer> lst = GetData(Convert.ToInt32(makh));
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
