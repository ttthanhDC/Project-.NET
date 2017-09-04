using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysProductController : Controller
    {
        //
        // GET: /SysProduct/

        public ActionResult Index()
        {
            return View();
        }
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysProduct obj = new JavaScriptSerializer().Deserialize<DataObject.SysProduct>(data);
                obj.Create_Date = DateTime.Now;
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
                DataObject.SysProduct obj = new JavaScriptSerializer().Deserialize<DataObject.SysProduct>(data);
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
                DataObject.SysProduct obj = new JavaScriptSerializer().Deserialize<DataObject.SysProduct>(data);
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
                DataObject.SysProduct obj = new JavaScriptSerializer().Deserialize<DataObject.SysProduct>(data);
                DataTable lst = Servies.SysProductServices.GetData(obj.ID);
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
        public ContentResult getDataByProductCode(String type, String data)
        {
            try
            {
                DataObject.SysProduct obj = new JavaScriptSerializer().Deserialize<DataObject.SysProduct>(data);
                List<DataObject.SysProduct> lst = Servies.SysProductServices.GetDataByProduct(obj.Product_Code);
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
        public void Insert(DataObject.SysProduct obj)
        {
            Servies.SysProductServices.InsertData(obj);
        }
        public void Update(DataObject.SysProduct obj)
        {
            Servies.SysProductServices.UpdateData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysProductServices.DeleteData(Id);
        }

    }
}
