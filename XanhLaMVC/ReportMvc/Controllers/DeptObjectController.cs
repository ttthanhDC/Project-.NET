using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class DeptObjectController : Controller
    {
        //
        // GET: /DeptObject/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            try
            {
                DataObject.DeptObject obj = new JavaScriptSerializer().Deserialize<DataObject.DeptObject>(data);
                obj.Create_Date = DateTime.Now;
                Insert(obj);
                return "insert data success";
            }
            catch (Exception e)
            {
                e.ToString();
                return "Error";
            }
        }
        [HttpPost]
        public String update(String type, String data)
        {
            try
            {
                DataObject.DeptObject obj = new JavaScriptSerializer().Deserialize<DataObject.DeptObject>(data);
                Update(obj);
                return "Update data success";
            }
            catch (Exception e)
            {
                e.ToString();
                return "Error";
            }
        }
        [HttpPost]
        public String delete(String type, String data)
        {
            try
            {
                DataObject.DeptObject obj = new JavaScriptSerializer().Deserialize<DataObject.DeptObject>(data);
                DeleteData(obj.ID);
                return "Delete data success";
            }
            catch (Exception e)
            {
                e.ToString();
                return "Error";
            }
        }
        [HttpPost]
        public ContentResult getData(String type, String data)
        {
            try
            {
                DataObject.DeptObject obj = new JavaScriptSerializer().Deserialize<DataObject.DeptObject>(data);
                List<DataObject.DeptObject> lst = GetData(obj.ID);
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


        public void Insert(DataObject.DeptObject obj)
        {
            Servies.DeptObjectServices.InsertData(obj);
        }
        public void Update(DataObject.DeptObject obj)
        {
            Servies.DeptObjectServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.DeptObjectServices.DeleteData(Id);
        }

        public List<DataObject.DeptObject> GetData(Int32 Id)
        {
            List<DataObject.DeptObject> lst = Servies.DeptObjectServices.GetData(Id);
            return lst;
        }

    }
}
