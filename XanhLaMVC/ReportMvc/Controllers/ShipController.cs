using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class ShipController : Controller
    {
        //
        // GET: /Ship/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
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

                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                dynamic inFoCustomer = dataDynamic.inFoCustomer;
                dynamic infoBill = dataDynamic.infoBill;
                hoten = inFoCustomer.hoTen;
                maKH = inFoCustomer.maKH;
                ngaySinh = inFoCustomer.ngaySinh;
                soDienThoai = inFoCustomer.soDienThoai;
                email = inFoCustomer.email;
                diaChi = inFoCustomer.diaChi;
                maquan = inFoCustomer.maquan;
                sourceName = dataDynamic.sourceName;
                sourceId = dataDynamic.sourceId;
                songayconlai = dataDynamic.songayconlai;
                tong = dataDynamic.tong;
                sotienthuduoc = dataDynamic.sotienthuduoc;
                chietkhau = dataDynamic.chietkhau;
                conNo = dataDynamic.conNo;
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
               
               return hoten;
            }
            catch (Exception e)
            {
                return "001";
            }

        }

        [HttpPost]
        public ContentResult getDataFilter(String type, String data, String MaReservation, String ngayHoaDon, String quan, String soShiper, String tenShiper, String trangThai)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getDataFilterViewHoaDon(MaReservation, ngayHoaDon, quan,
                         soShiper, tenShiper, trangThai);
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
        public ContentResult getALLData(String type, String data)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getAllDataViewHoaDon();
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
