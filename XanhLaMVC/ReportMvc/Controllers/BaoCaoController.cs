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


        [HttpPost]
        public JsonResult getvBaoCao01(String type, String data,String Ngay)
        {
            try
            {
                DataTable dt = Servies.BaocaoServices.getvBaoCao01(Ngay);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }
        }
        [HttpPost]
        public JsonResult getvBaoCao02(String type, String data, String Ngay)
        {
            try
            {
                DataTable dt = Servies.BaocaoServices.getvBaoCao02(Ngay);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }
        }
        [HttpPost]
        public JsonResult getvBaoCao03(String type, String data, String tuNgay, String denNgay, String LoaiDon)
        {
            try
            {
                Int16 ld = -1;
                if (LoaiDon != null && LoaiDon != "")
                {
                    ld = Convert.ToInt16(ld);
                }
                List<DataObject.BaoCao03> dt = Servies.BaocaoServices.getvBaoCao03(tuNgay, denNgay, ld);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }
        }
        [HttpPost]
        public JsonResult getvBaoCao04(String type, String data, String tuNgay, String denNgay)
        {
            try
            {
                List<DataObject.BaoCao04> dt = Servies.BaocaoServices.getvBaoCao04(tuNgay, denNgay);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }
        }
        [HttpPost]
        public JsonResult getvBaoCao05(String type, String data, String tuNgay, String denNgay)
        {
            try
            {
                List<DataObject.BaoCao04> dt = Servies.BaocaoServices.getvBaoCao04(tuNgay, denNgay);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }
        }
        [HttpPost]
        public JsonResult getvBaoCaoChotCa(String type, String data, String tuNgay, String shipperName)
        {
            try
            {
                List<DataObject.BaoCao05> dt = Servies.BaocaoServices.getvBaoCaoChotCa(shipperName, tuNgay);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }
        }
    }
}
