using Newtonsoft.Json;
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
        public ActionResult KD001_ListCustomer()
        {
            return View();
        }
        [HttpPost]
        public ContentResult getvKD001(String type, String data,String MaKH, String HoTen, String SoDT, String Quan, String Email)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataTable lst = Servies.KinhDoanhSV.getvKD001(MaKH, HoTen, SoDT, Email, Quan);
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
        [HttpPost]
        public ContentResult getvDetailKD001(String type, String data, String IdKH)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                List<DataTable> dt = Servies.KinhDoanhSV.getvDetailKD001(IdKH);
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
        public ContentResult getvDetailKD003(String type, String data, String Ngay)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataTable dt = Servies.KinhDoanhSV.getvDetailKD003(Ngay);
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
