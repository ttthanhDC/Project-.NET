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
        public JsonResult getData(String type, String data)
        {
            try
            {
                List<DataObject.QuanHuyen> lst = Servies.SysCustomerServices.getAllDataQH();
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }

    }
}
