using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class KinhDoanhController : Controller
    {
        //
        // GET: /KinhDoanh/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult getvKD001(String type, String data,String MaKH, String HoTen, String SoDT, String Quan, String Email)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataTable lst = Servies.KinhDoanhSV.getvKD001(MaKH, HoTen, SoDT, Email, Quan);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getvDetailKD001(String type, String data, String IdKH)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                List<DataTable> dt = Servies.KinhDoanhSV.getvDetailKD001(IdKH);
                return Json(dt);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getvDetailKD003(String type, String data, String Ngay)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataTable dt = Servies.KinhDoanhSV.getvDetailKD003(Ngay);
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
