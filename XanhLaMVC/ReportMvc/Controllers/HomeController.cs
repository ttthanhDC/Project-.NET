using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ReportPartial()
        {
            return PartialView();
        }

        [HttpPost]
        public String getSessionUser(String type, String data)
        {
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record
                String UserName = this.Session["UserName"].ToString();
                return UserName;
            }
            catch (Exception e)
            {
                return "";
            }
        }

        [HttpPost]
        public String delete(String type, String data)
        {
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
            try
            {
                try
                {
                    DeleteData(obj.ID);

                    return "Xóa người dùng thành công";
                }
                catch (Exception e)
                {

                    return "Error";
                }
            }
            catch (Exception e)
            {
                return e.ToString();
            }
        }

        [HttpPost]
        public ContentResult getData(String type, String data)
        {
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record
                List<DataObject.ViewSysUser> lst = Servies.SysUserServies.GetData(obj.ID);
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
                return null;
            }
        }

        public void Insert(DataObject.SysUser obj)
        {
            Servies.SysUserServies.InsertData(obj);
        }
        public void Update(DataObject.SysUser obj)
        {
            Servies.SysUserServies.UpdateData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysUserServies.DeleteData(Id);
        }
    }
}
