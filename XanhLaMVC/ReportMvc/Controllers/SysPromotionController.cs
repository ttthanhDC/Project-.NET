using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysPromotionController : Controller
    {
        //
        // GET: /SysPromotion/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.SysPromotion obj = new JavaScriptSerializer().Deserialize<DataObject.SysPromotion>(data);
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
                DataObject.SysPromotion obj = new JavaScriptSerializer().Deserialize<DataObject.SysPromotion>(data);
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
                DataObject.SysPromotion obj = new JavaScriptSerializer().Deserialize<DataObject.SysPromotion>(data);
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
                DataObject.SysPromotion obj = new JavaScriptSerializer().Deserialize<DataObject.SysPromotion>(data);
                List<DataObject.SysPromotion> lst = GetData(obj.ID);
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
        public ContentResult getDataByPromotionCode(String type, String data)
        {
            try
            {
                DataObject.SysPromotion obj = new JavaScriptSerializer().Deserialize<DataObject.SysPromotion>(data);
                List<DataObject.SysPromotion> lst = Servies.SysPromotionServices.GetDataByPromotionCode(obj.Code);
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
        public void Insert(DataObject.SysPromotion obj)
        {
            Servies.SysPromotionServices.InsertData(obj);
        }
        public void Update(DataObject.SysPromotion obj)
        {
            Servies.SysPromotionServices.UpdateData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysPromotionServices.DeleteData(Id);
        }

        public List<DataObject.SysPromotion> GetData(Int32 Id)
        {
            List<DataObject.SysPromotion> lst = Servies.SysPromotionServices.GetData(Id);
            return lst;
        }
    }
}
