using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class ChotCaController : Controller
    {
        //
        // GET: /ChotCa/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public String InsertChotCaReturnId(String type, String data, String TienThuDuoc)
        {
            try
            {
                DataObject.ChotCa chotca = new DataObject.ChotCa();
                chotca.TienThuDuoc = TienThuDuoc != "" ? Convert.ToDecimal(TienThuDuoc) : 0;
                chotca.NgayChot = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                chotca.NguoiChot = this.Session["UserName"].ToString();
                chotca.GioChot = DateTime.Now.Hour + ":" + DateTime.Now.Minute + ":" + DateTime.Now.Second;
                int result = Servies.ChotCaServices.InsertChotCaReturnId(chotca, DateTime.Now.ToString("dd/MM/yyyy"));
                return result.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }
        }

        [HttpPost]
        public JsonResult ViewChotCa(String type, String data, String NguoiChot, String NgayChot)
        {
            try
            {
                DataTable dt = Servies.ChotCaServices.ViewChotCa(NguoiChot, NgayChot);
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
