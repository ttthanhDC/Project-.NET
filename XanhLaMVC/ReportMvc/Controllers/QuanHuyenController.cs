using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class QuanHuyenController : Controller
    {
        //
        // GET: /QuanHuyen/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ContentResult getData(String type, String data)
        {
            try
            {
                List<DataObject.QuanHuyen> lst = Servies.SysCustomerServices.getAllDataQH();
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

    }
}
