using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class ReportController : Controller
    {
        //
        // GET: /Report/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ReportVanChuyen(String IdNgayHD)
        {
            ViewData["DataSource"] = Servies.ReportServices.getRPVanChuyen(IdNgayHD);
            return View();
        }

        public ActionResult ReportLoTrinh(String MaLoTrinh)
        {
            ViewData["DataSource"] = Servies.ReportServices.getRPLoTrinh(MaLoTrinh);
            return View();
        }

        public ActionResult ReportBaoCao01(String NgayTao)
        {
            ViewData["DataSource"] = Servies.ReportServices.getRPBaoCao01(NgayTao);
            return View();
        }

        public ActionResult ReportBaoCao02(String NgayTao)
        {
            ViewData["DataSource"] = Servies.ReportServices.getRPBaoCao02(NgayTao);
            return View();
        }

        public ActionResult ReportBaoCao04(String tuNgay, String denNgay)
        {
            ViewData["DataSource"] = Servies.ReportServices.getvBaoCao04(tuNgay, denNgay);
            return View();
        }

        public ActionResult ReportBaoCao05(String shipperName, String tuNgay, String denNgay)
        {
            ViewData["DataSource"] = Servies.ReportServices.getvBaoCao05(shipperName,tuNgay, denNgay);
            return View();
        }

        public ActionResult ReportGopDon(String data)
        {
            dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
            dynamic lstId = dataDynamic.lstId;
            String Ids = String.Join(",", (List<string>)lstId);
            ViewData["DataSource"] = Servies.ReportServices.getRPGopDon(Ids);
            return View();
        }



    }
}
