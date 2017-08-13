using CrystalDecisions.Web;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerKeToan
    /// </summary>
    public class HandlerKeToan : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                String type = context.Request.Form["type"].ToString();

                if (type == "viewManHinhThuCK")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.KeToanServices.viewManHinhThuCK(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "viewManHinhThuTM")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.KeToanServices.viewManHinhThuTM(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "viewManHinhChi")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.KeToanServices.viewManHinhChi(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "viewManHinhLuuChuyenDongTien")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.KeToanServices.viewManHinhLuuChuyenDongTien(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "InsertKeToanReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    int Id = Servies.KeToanServices.InsertKeToanReturnId(Ngay);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(Id);
                }
                if (type == "InsertChiTietThuReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    String IdNgayHD = context.Request.Form["IdNgayHD"].ToString();
                    String SoTien = context.Request.Form["SoTien"].ToString();
                    String MaNganHang = context.Request.Form["MaNganHang"].ToString();
                    String MaGiaoDich = context.Request.Form["MaGiaoDich"].ToString();
                    String TinhTrang = context.Request.Form["TinhTrang"].ToString();
                    String LoaiThu = context.Request.Form["LoaiThu"].ToString();
                    String GhiChu = context.Request.Form["GhiChu"].ToString();
                    String IdKeToan = context.Request.Form["IdKeToan"].ToString();
                    DataObject.ChiTietThu ctt = new DataObject.ChiTietThu();
                    ctt.Ngay = Convert.ToDateTime(Ngay != "" ? Ngay : DateTime.Now.ToShortDateString());
                    ctt.IdNgayHD = Convert.ToInt32(IdNgayHD);
                    if(SoTien != null && SoTien != ""){
                        ctt.SoTien = Convert.ToDecimal(SoTien);
                    }else {
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
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(Id);
                }
                if (type == "InsertChiTietChiReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    //Ngay,NoiDungChi,SoTien,MaNganHang,GhiChu,NguoiTao,NgayTao,IdKeToan
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    String NoiDungChi = context.Request.Form["NoiDungChi"].ToString();
                    String SoTien = context.Request.Form["SoTien"].ToString();
                    String MaNganHang = context.Request.Form["MaNganHang"].ToString();
                    String GhiChu = context.Request.Form["GhiChu"].ToString();
                    String IdKeToan = context.Request.Form["IdKeToan"].ToString();
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
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(Id);
                }
                if (type == "InsertLuuChuyenDongTienReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    //Ngay,SoTien,MaNganHangChi,MaNganHangThu,GhiChu,NguoiTao,NgayTao,IdKeToan
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    String SoTien = context.Request.Form["SoTien"].ToString();
                    String MaNganHangThu = context.Request.Form["MaNganHangThu"].ToString();
                    String MaNganHangChi = context.Request.Form["MaNganHangChi"].ToString();
                    String GhiChu = context.Request.Form["GhiChu"].ToString();
                    String IdKeToan = context.Request.Form["IdKeToan"].ToString();
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
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(Id);
                }

                if (type == "viewKeToanTongHopKy")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    //Ngay,SoTien,MaNganHangChi,MaNganHangThu,GhiChu,NguoiTao,NgayTao,IdKeToan
                    String flag = context.Request.Form["flag"].ToString();
                    List<DataObject.KeToanTongHop> viewKeToanTongHopKy = Servies.KeToanServices.viewKeToanTongHopKy(Convert.ToInt16(flag));
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(viewKeToanTongHopKy));
                }
            }
            catch (Exception e)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("0");
            }


        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}