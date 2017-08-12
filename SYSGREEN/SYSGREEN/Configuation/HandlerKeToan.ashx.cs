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
                if (type == "InsertKeToanReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    int Id = Servies.KeToanServices.InsertKeToanReturnId(Convert.ToDateTime(Ngay != "" ? Ngay : DateTime.Now.ToShortDateString()));
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
                    ctt.MaNganHang = Convert.ToInt32(MaNganHang);
                    ctt.GhiChu = GhiChu;
                    ctt.NgayTao = DateTime.Now;
                    ctt.NguoiTao = "";
                    ctt.IdKeToan = Convert.ToInt32(IdKeToan);
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
                    int Id = Servies.KeToanServices.InsertLuuChuyenDongTienReturnId(ctt);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(Id);
                }
                if (type == "InsertLoTrinhShipperReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                    String MaLoTrinh = DateTime.Now.ToString("ddMMyy") + DateTime.Now.ToString("tt") + DateTime.Now.ToString("hh") + DateTime.Now.ToString("mm") + DateTime.Now.ToString("ss");
                    obj.MaLoTrinh = MaLoTrinh;
                    obj.NguoiTao = "";
                    obj.NgayTao = DateTime.Now;
                    obj.TrangThai = "Chưa xử lý";
                    int idLotrinh = Servies.ShipperServices.InsertLoTrinhShipperReturnId(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(idLotrinh + "," + MaLoTrinh);

                }
                else if (type == "UpdateLoTrinhShipper")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    dynamic listIdLoTrinh = data.listIdLoTrinh;
                    dynamic listStatus = data.listStatus;
                    int check = -1;
                    if (listIdLoTrinh.Count > 0)
                    {
                        for (int i = 0; i < listIdLoTrinh.Count; i++)
                        {
                            DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                            String ID = (String)listIdLoTrinh[i];
                            obj.ID = Convert.ToInt32(ID);
                            String TrangThai = (String)listStatus[i];
                            obj.TrangThai = TrangThai;
                            check = Servies.ShipperServices.UpdateLoTrinhShipper(obj);
                        }
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(check);
                    }
                    else
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(-1);
                    }

                }
                else if (type == "DeleteTrinhShipper")
                {
                    String IdLotrinh = context.Request.Form["IdLotrinh"].ToString();
                    DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                    obj.ID = Convert.ToInt32(IdLotrinh);
                    Servies.ShipperServices.DeleteTrinhShipper(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                }
                else if (type == "ViewLoTrinhShipper")
                {

                    String jsonData = context.Request.Form["data"].ToString();
                    String NgayLotrinh = context.Request.Form["NgayLotrinh"].ToString();
                    String MaLoTrinh = context.Request.Form["MaLoTrinh"].ToString();
                    String ShipName = context.Request.Form["ShipName"].ToString();
                    String ShipNumber = context.Request.Form["ShipNumber"].ToString();
                    String TrangThai = context.Request.Form["TrangThai"].ToString();
                    DataTable lst = Servies.ShipperServices.ViewLoTrinhShipper(NgayLotrinh, MaLoTrinh, ShipName, ShipNumber, TrangThai);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                else if (type == "InLoTrinh")
                {
                    DataTable table = new DataTable();
                    SqlConnection conn = Common.Connection.SqlConnect();
                    conn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter("PGetStepV3", conn);
                    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sda.SelectCommand.Parameters.AddWithValue("@NgayHD", "04/08/2017");
                    DataSet ds = new DataSet();
                    sda.Fill(ds, "vHoaDonStep3");
                    conn.Close();
                    CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
                    rpt.Load(System.Web.HttpContext.Current.Server.MapPath("~/hoaDon.rpt"));
                    rpt.SetDataSource(ds);
                    S001_ListShiper s = new S001_ListShiper();
                    CrystalReportViewer crv = (CrystalReportViewer)s.Page.FindControl("CrystalReportViewer1");

                    crv.ReportSource = rpt;
                    crv.Visible = true;
                    crv.RefreshReport();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("0");
                }
                else if (type == "InsertShipperReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String DiaChi = context.Request.Form["DiaChi"].ToString();
                    String SoDienThoai = context.Request.Form["SoDienThoai"].ToString();
                    String NAME = context.Request.Form["NAME"].ToString();
                    String DESCRIPTION = context.Request.Form["DESCRIPTION"].ToString();
                    DataObject.Shiper s = new DataObject.Shiper();
                    s.NAME = NAME;
                    s.DiaChi = DiaChi;
                    s.SoDienThoai = SoDienThoai;
                    s.NguoiTao = "";
                    s.NgayTao = DateTime.Now;
                    s.DESCRIPTION = DESCRIPTION;
                    int idShipper = Servies.ShipperServices.InsertShipperReturnId(s);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(idShipper);
                }
                else if (type == "UpdateShipperReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String DiaChi = context.Request.Form["DiaChi"].ToString();
                    String SoDienThoai = context.Request.Form["SoDienThoai"].ToString();
                    String NAME = context.Request.Form["NAME"].ToString();
                    String Shipe_ID = context.Request.Form["Shipe_ID"].ToString();
                    String DESCRIPTION = context.Request.Form["DESCRIPTION"].ToString();
                    DataObject.Shiper s = new DataObject.Shiper();
                    s.NAME = NAME;
                    s.DiaChi = DiaChi;
                    s.SoDienThoai = SoDienThoai;
                    s.DESCRIPTION = DESCRIPTION;
                    s.SHIPER_ID = Convert.ToInt16(Shipe_ID);
                    Servies.ShipperServices.UpdateShipperReturnId(s);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                }
                else if (type == "getDataShipper")
                {
                    DataTable table = new DataTable();
                    String NAME = context.Request.Form["NAME"].ToString();
                    String Shipe_ID = context.Request.Form["Shipe_ID"].ToString();
                    DataObject.Shiper s = new DataObject.Shiper();
                    s.NAME = NAME;
                    s.SHIPER_ID = Convert.ToInt16(Shipe_ID);
                    table = Servies.ShipperServices.getDataShipper(s);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(table));
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