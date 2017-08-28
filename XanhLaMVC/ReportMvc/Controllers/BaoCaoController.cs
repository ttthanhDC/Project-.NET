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
    public class BaoCaoController : Controller
    {
        //
        // GET: /BaoCao/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BC001_revenueReport()
        {
            return View();
        }
        public ActionResult BC002_ListBillCancel()
        {
            return View();
        }
        public ActionResult BC003_Debt()
        {
            return View();
        }
        public ActionResult BC004_RevenueFormSource()
        {
            return View();
        }
        public ActionResult BC005_StatisticalFormShiper()
        {
            return View();
        }
       
        [HttpPost]
        public ContentResult getvBaoCao01(String type, String data,String Ngay)
        {
            try
            {
                DataTable dt = Servies.BaocaoServices.getvBaoCao01(Ngay);
                var list = JsonConvert.SerializeObject(dt,
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
        public ContentResult getvBaoCao02(String type, String data, String Ngay)
        {
            try
            {
                DataTable dt = Servies.BaocaoServices.getvBaoCao02(Ngay);
                var list = JsonConvert.SerializeObject(dt,
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
        public ContentResult getvBaoCao03(String type, String data, String tuNgay, String denNgay, String LoaiDon)
        {
            try
            {
                Int16 ld = -1;
                if (LoaiDon != null && LoaiDon != "")
                {
                    ld = Convert.ToInt16(ld);
                }
                List<DataObject.BaoCao03> dt = Servies.BaocaoServices.getvBaoCao03(tuNgay, denNgay, ld);
                var list = JsonConvert.SerializeObject(dt,
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
        public ContentResult getvBaoCao04(String type, String data, String tuNgay, String denNgay)
        {
            try
            {
                List<DataObject.BaoCao04> dt = Servies.BaocaoServices.getvBaoCao04(tuNgay, denNgay);
                var list = JsonConvert.SerializeObject(dt,
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
        public ContentResult getvBaoCao05(String type, String data, String tuNgay, String denNgay)
        {
            try
            {
                List<DataObject.BaoCao04> dt = Servies.BaocaoServices.getvBaoCao04(tuNgay, denNgay);
                var list = JsonConvert.SerializeObject(dt,
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
        public ContentResult getvBaoCaoChotCa(String type, String data, String tuNgay, String shipperName)
        {
            try
            {
                List<DataObject.BaoCao05> dt = Servies.BaocaoServices.getvBaoCaoChotCa(shipperName, tuNgay);
                var list = JsonConvert.SerializeObject(dt,
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
