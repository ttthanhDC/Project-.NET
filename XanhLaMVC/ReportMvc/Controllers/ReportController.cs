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

    }
}
