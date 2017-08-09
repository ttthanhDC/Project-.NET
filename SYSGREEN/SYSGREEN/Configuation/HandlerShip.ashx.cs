using CrystalDecisions.Shared;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerSysMenu
    /// </summary>
    public class HandlerShip : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            //DataObject.viewBillTemp obj = new JavaScriptSerializer().Deserialize<DataObject.viewBillTemp>(jsonData);
            if (type == "insert")
            {
                try
                {
                    String hoten = "";
                    String maKH = "";
                    String ngaySinh = "";
                    String soDienThoai = "";
                    String email = "";
                    String diaChi = "";
                    String maquan = "";
                    String sourceName = "";
                    String sourceId = "";
                    String songayconlai = "";
                    String tong = "";
                    String sotienthuduoc = "";
                    String chietkhau = "";
                    String conNo = "";

                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    dynamic inFoCustomer = data.inFoCustomer;
                    dynamic infoBill = data.infoBill;
                    hoten = inFoCustomer.hoTen;
                    maKH = inFoCustomer.maKH;
                    ngaySinh = inFoCustomer.ngaySinh;
                    soDienThoai = inFoCustomer.soDienThoai;
                    email = inFoCustomer.email;
                    diaChi = inFoCustomer.diaChi;
                    maquan = inFoCustomer.maquan;
                    sourceName = data.sourceName;
                    sourceId = data.sourceId;
                    songayconlai = data.songayconlai;
                    tong = data.tong;
                    sotienthuduoc = data.sotienthuduoc;
                    chietkhau = data.chietkhau;
                    conNo = data.conNo;
                    /********************************* 
                     * Check and Insert Khách hàng nếu không tồn tại
                     * Nếu tồn tại getId Khách hàng
                     * 
                     * *******************************/
                    int IdKhachHang = returnIdKH(soDienThoai, hoten, email, diaChi, maquan, ngaySinh);
                    /********************************* 
                    * Insert Hóa đơn
                    * 
                    * *******************************/
                    DataObject.HoaDon hoadon = new DataObject.HoaDon();
                    hoadon.IDKhachHang = IdKhachHang;
                    hoadon.IDNguon = Convert.ToInt32(sourceId);
                    hoadon.NgayTao = DateTime.Now;
                    hoadon.NguoiTao = "";
                    hoadon.TongSoNgay = Convert.ToInt32(songayconlai);
                    hoadon.TongTien = Convert.ToDecimal(tong != "" ? tong : "0");
                    hoadon.TongTienConNo = Convert.ToDecimal(conNo != "" ? conNo : "0");
                    hoadon.TongTienThuDuoc = Convert.ToDecimal(sotienthuduoc != "" ? sotienthuduoc : "0");
                    hoadon.TrangThai = "Chưa xử lý";
                    hoadon.ChietKhau = Convert.ToDecimal(sotienthuduoc != "" ? chietkhau : "0");
                    int hoadonId = Servies.HoaDonServices.InsertDataReturnId(hoadon);
                    /********************************* 
                    * Insert Chi tiết hóa đơn , hoa đơn package , hóa đơn ngày , sản phẩm
                    * 
                    * *******************************/
                    for (int i = 0; i < infoBill.Count; i++)
                    {
                        int IdChiTietHoaHD = InsertChiTietHoaDonReturnId(infoBill[i], hoadonId, IdKhachHang);
                        dynamic dataHD = infoBill[i].data;
                        for (int k = 0; k < dataHD.Count; k++)
                        {
                            int idPackageHD = InsertPackageChiTietHoaDonReturnId(dataHD[k], IdChiTietHoaHD);

                            dynamic detailMaster = dataHD[k].detalMaster;
                            int idNgayHDLe = -1;
                            for (int j = 0; j < detailMaster.Count; j++)
                            {
                                if (dataHD[k].fLoaiHinhDonId == 1)
                                {
                                    int idNgayHD = 0;
                                    if (detailMaster[j].deliveryDate != "")
                                    {
                                        idNgayHD = InsertNgayHoaDonReturnId(detailMaster[j], idPackageHD);
                                    }
                                    else
                                    {
                                        InsertHoaDonSanPhamReturnId(detailMaster[j], idNgayHD);
                                    }


                                }
                                else
                                {
                                    if (j == 0)
                                    {
                                        idNgayHDLe = InsertNgayHoaDonReturnId(detailMaster[j], idPackageHD);
                                        InsertHoaDonSanPhamReturnId(detailMaster[j], idNgayHDLe);
                                    }
                                    else
                                    {
                                        InsertHoaDonSanPhamReturnId(detailMaster[j], idNgayHDLe);
                                    }
                                }


                            }
                        }
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(hoten);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("001");
                }

            }
            else if (type == "update")
            {
                try
                {
                    //Update(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "delete")
            {
                try
                {
                    //DeleteData(obj.ID);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getDataFilter")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String maReservation = context.Request.Form["MaReservation"].ToString();
                    String ngayHoaDon = context.Request.Form["ngayHoaDon"].ToString();
                    String quan = context.Request.Form["quan"].ToString();
                    String soShiper = context.Request.Form["soShiper"].ToString();
                    String tenShiper = context.Request.Form["tenShiper"].ToString();
                    String trangThai = context.Request.Form["trangThai"].ToString();

                    DataTable lst = Servies.HoaDonServices.getDataFilterViewHoaDon(maReservation, ngayHoaDon, quan, 
                        soShiper, tenShiper, trangThai);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getALLData")
            {
                try
                {
                   
                    DataTable lst = Servies.HoaDonServices.getAllDataViewHoaDon();
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Hello");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void Insert(DataObject.DeptObject obj)
        {
            Servies.DeptObjectServices.InsertData(obj);
        }
        public void Update(DataObject.DeptObject obj)
        {
            Servies.DeptObjectServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.DeptObjectServices.DeleteData(Id);
        }

        public List<DataObject.DeptObject> GetData(Int32 Id)
        {
            List<DataObject.DeptObject> lst = Servies.DeptObjectServices.GetData(Id);
            return lst;
        }

        public int returnIdKH(string soDienThoai, string hoten, string email, string diaChi, string maquan, string ngaySinh)
        {
            List<DataObject.SysCustomer> lstCustomer = Servies.SysCustomerServices.GetDataByPhoneNumber(soDienThoai);
            int IdKhachHang = -1;
            if (lstCustomer.Count > 0)
            {
                DataObject.SysCustomer sysCustomer = lstCustomer[0];
                IdKhachHang = sysCustomer.ID;
            }
            else
            {
                DataObject.SysCustomer sysCustomer = new DataObject.SysCustomer();
                sysCustomer.PhoneNumber = soDienThoai;
                sysCustomer.CustomerName = hoten;
                sysCustomer.Email = email;
                sysCustomer.Address = diaChi;
                sysCustomer.MaQuan = maquan;
                if (ngaySinh != "")
                {
                    sysCustomer.BirthDay = DateTime.Parse(ngaySinh);
                }
                IdKhachHang = Servies.SysCustomerServices.InsertDataReturnId(sysCustomer);
            }
            return IdKhachHang;
        }

        public int InsertChiTietHoaDonReturnId(dynamic infoBill, int hoadonId, int IdKhachHang)
        {
            DataObject.ChiTietHoaDon chitietHD = new DataObject.ChiTietHoaDon();
            chitietHD.IDHoaDon = hoadonId;
            chitietHD.IsMaster = infoBill.isMaster;
            if (infoBill.isMaster == 1)
            {
                chitietHD.IdKhachHang = IdKhachHang;
            }
            else
            {
                String hoten1 = infoBill.infoKH.hoTen;
                String maKH1 = infoBill.infoKH.maKH;
                String ngaySinh1 = infoBill.infoKH.ngaySinh;
                String soDienThoai1 = infoBill.infoKH.soDienThoai;
                String email1 = infoBill.infoKH.email;
                String diaChi1 = infoBill.infoKH.diaChi;
                String maquan1 = infoBill.infoKH.maquan;
                chitietHD.IdKhachHang = returnIdKH(soDienThoai1, hoten1, email1, diaChi1, maquan1, ngaySinh1);
            }
            chitietHD.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertChiTietHoaDonReturnId(chitietHD);
            return IdChiTietHoaHD;
        }

        public int InsertPackageChiTietHoaDonReturnId(dynamic data, int hoaDonChiTietId)
        {
            DataObject.PackageChiTietHoaDon packageChiTietHD = new DataObject.PackageChiTietHoaDon();
            packageChiTietHD.IDChiTietHD = hoaDonChiTietId;
            packageChiTietHD.Loai = data.fLoaiHinhDonId;
            packageChiTietHD.Ship = data.fPhiShip;
            packageChiTietHD.SoNgay = data.fLoaiGoiId;
            packageChiTietHD.HinhThucThanhToan = data.fLoaiThanhToanId;
            packageChiTietHD.HinhThucGiaoHang = "";
            packageChiTietHD.ThanhTien = Convert.ToDecimal(data.fThanhTien != "" ? data.fThanhTien : "0");
            packageChiTietHD.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertPackageChiTietHoaDonReturnId(packageChiTietHD);
            return IdChiTietHoaHD;
        }

        public int InsertNgayHoaDonReturnId(dynamic data, int idPackageHD)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            ngayHoaDon.Ngay = Convert.ToDateTime(data.deliveryDate != "" ? data.deliveryDate : DateTime.Now);
            ngayHoaDon.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }

        public int InsertHoaDonSanPhamReturnId(dynamic data, int idNgayHoaDon)
        {
            DataObject.HoaDonSanPham ngayHoaDon = new DataObject.HoaDonSanPham();
            ngayHoaDon.IDNgayHoaDon = idNgayHoaDon;
            ngayHoaDon.money = data.money;
            ngayHoaDon.product = data.product;
            ngayHoaDon.sugar = data.sugar;
            ngayHoaDon.quantity = data.quantity;
            ngayHoaDon.price = data.price;
            ngayHoaDon.promotionCode = data.promotionCode;
            ngayHoaDon.total = data.total;
            if (data.GhiChu != null && data.GhiChu != "")
            {
                ngayHoaDon.GhiChu = data.GhiChu;
            }
            else
            {
                ngayHoaDon.GhiChu = "";
            }
            int IdChiTietHoaHD = Servies.HoaDonSanPhamServices.InsertDataReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }
    }
}