using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class KeToanController : Controller
    {
        //
        // GET: /KeToan/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ContentResult viewManHinhThuCK(String type, String data, String Ngay)
        {
            try
            {
                DataTable dt = Servies.KeToanServices.viewManHinhThuCK(Ngay);
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
        public ContentResult viewManHinhThuTM(String type, String data, String Ngay)
        {
            try
            {
                DataTable dt = Servies.KeToanServices.viewManHinhThuTM(Ngay);
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
        public ContentResult viewManHinhChi(String type, String data, String Ngay)
        {
            try
            {
                DataTable dt = Servies.KeToanServices.viewManHinhChi(Ngay);
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
        public ContentResult viewManHinhLuuChuyenDongTien(String type, String data, String Ngay)
        {
            try
            {
                DataTable dt = Servies.KeToanServices.viewManHinhLuuChuyenDongTien(Ngay);
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
        public String InsertKeToanReturnId(String type, String data, String Ngay)
        {
            try
            {
                int Id = Servies.KeToanServices.InsertKeToanReturnId(Ngay);
                return Id.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }
        }
        [HttpPost]
        public String InsertChiTietThuReturnId(String type, String data, String Ngay, String IdNgayHD, String SoTien, String MaNganHang, String MaGiaoDich, String TinhTrang, String LoaiThu, String GhiChu, String IdKeToan)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan
                
                DataObject.ChiTietThu ctt = new DataObject.ChiTietThu();
                ctt.Ngay = Convert.ToDateTime(Ngay != "" ? Ngay : DateTime.Now.ToShortDateString());
                ctt.IdNgayHD = Convert.ToInt32(IdNgayHD);
                if (SoTien != null && SoTien != "")
                {
                    ctt.SoTien = Convert.ToDecimal(SoTien);
                }
                else
                {
                    ctt.SoTien = Convert.ToDecimal("0");
                }
                ctt.MaNganHang = Convert.ToInt32(MaNganHang);
                ctt.MaGiaoDich = MaGiaoDich;
                ctt.TinhTrang = Convert.ToInt32(TinhTrang);
                ctt.LoaiThu = Convert.ToInt32(LoaiThu);
                ctt.GhiChu = GhiChu;
                ctt.NgayTao = DateTime.Now;
                ctt.NguoiTao = "";
                ctt.IdKeToan = Convert.ToInt32(IdKeToan);
                int Id = Servies.KeToanServices.InsertChiTietThuReturnId(ctt);
                return Id.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }

        }
        [HttpPost]
        public String InsertChiTietThuTMReturnId(String type, String data, String Ngay, String IdNgayHD,String ID ,String SoTien, String MaNganHang, String MaGiaoDich, String TinhTrang, String LoaiThu, String GhiChu, String IdKeToan)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataObject.ChiTietThu ctt = new DataObject.ChiTietThu();
                ctt.Ngay = Convert.ToDateTime(Ngay != "" ? Ngay : DateTime.Now.ToShortDateString());
                ctt.IdNgayHD = Convert.ToInt32(IdNgayHD);
                ctt.ID = Convert.ToInt32(ID);
                if (SoTien != null && SoTien != "")
                {
                    ctt.SoTien = Convert.ToDecimal(SoTien);
                }
                else
                {
                    ctt.SoTien = Convert.ToDecimal("0");
                }
                ctt.MaNganHang = Convert.ToInt32(MaNganHang);
                ctt.MaGiaoDich = MaGiaoDich;
                ctt.TinhTrang = Convert.ToInt32(TinhTrang);
                ctt.LoaiThu = Convert.ToInt32(LoaiThu);
                ctt.GhiChu = GhiChu;
                ctt.NgayTao = DateTime.Now;
                ctt.NguoiTao = "";
                ctt.IdKeToan = Convert.ToInt32(IdKeToan);
                int Id = Servies.KeToanServices.InsertChiTietThuTMReturnId(ctt);
                return Id.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }

        }
        [HttpPost]
        public String InsertChiTietChiReturnId(String type, String data, String Ngay, String NoiDungChi, String SoTien, String MaNganHang, String GhiChu, String IdKeToan)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataObject.ChiTietChi ctt = new DataObject.ChiTietChi();
                ctt.Ngay = Convert.ToDateTime(Ngay != "" ? Ngay : DateTime.Now.ToShortDateString());
                if (SoTien != null && SoTien != "")
                {
                    ctt.SoTien = Convert.ToDecimal(SoTien);
                }
                else
                {
                    ctt.SoTien = Convert.ToDecimal("0");
                }
                ctt.NoiDungChi = NoiDungChi;
                ctt.MaNganHang = Convert.ToInt32(MaNganHang);
                ctt.GhiChu = GhiChu;
                ctt.NgayTao = DateTime.Now;
                ctt.NguoiTao = "";
                ctt.IdKeToan = Convert.ToInt32(IdKeToan);
                ctt.ID = Convert.ToInt32(IdKeToan);
                int Id = Servies.KeToanServices.InsertChiTietChiReturnId(ctt);
                return Id.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }

        }
        [HttpPost]
        public String InsertLuuChuyenDongTienReturnId(String type, String data, String Ngay, String SoTien, String MaNganHangThu, String MaNganHangChi, String GhiChu, String IdKeToan)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                DataObject.LuuChuyenDongTien ctt = new DataObject.LuuChuyenDongTien();
                ctt.Ngay = Convert.ToDateTime(Ngay != "" ? Ngay : DateTime.Now.ToShortDateString());
                if (SoTien != null && SoTien != "")
                {
                    ctt.SoTien = Convert.ToDecimal(SoTien);
                }
                else
                {
                    ctt.SoTien = Convert.ToDecimal("0");
                }
                ctt.MaNganHangThu = Convert.ToInt32(MaNganHangThu);
                ctt.MaNganHangChi = Convert.ToInt32(MaNganHangChi);
                ctt.GhiChu = GhiChu;
                ctt.NgayTao = DateTime.Now;
                ctt.NguoiTao = "";
                ctt.IdKeToan = Convert.ToInt32(IdKeToan);
                ctt.ID = Convert.ToInt32(IdKeToan);
                int Id = Servies.KeToanServices.InsertLuuChuyenDongTienReturnId(ctt);
                return Id.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }

        }
        [HttpPost]
        public ContentResult viewKeToanTongHopKy(String type, String data, String flag)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                List<DataObject.KeToanTongHop> viewKeToanTongHopKy = Servies.KeToanServices.viewKeToanTongHopKy(Convert.ToInt16(flag));
                var list = JsonConvert.SerializeObject(viewKeToanTongHopKy,
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
