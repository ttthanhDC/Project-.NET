using ExcelDataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Excel;
using Newtonsoft.Json;

namespace ReportMvc.Controllers
{
    public class InsertBillController : Controller
    {
        //
        // GET: /InsertBill/

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
                int isMasterTab = dataDynamic.isMasterTab;
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
                hoadon.NgayTao = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
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
                    bool checkMasterTab = false;
                    if (isMasterTab == i)
                    {
                        checkMasterTab = true;
                    }
                    int IdChiTietHoaHD = InsertChiTietHoaDonReturnId(infoBill[i], hoadonId, IdKhachHang, checkMasterTab);
                    dynamic dataHD = infoBill[i].data;
                    for (int k = 0; k < dataHD.Count; k++)
                    {
                        int idPackageHD = InsertPackageChiTietHoaDonReturnId(dataHD[k], IdChiTietHoaHD);
                        String hinhthucthanhtoan = (String)dataHD[k].fLoaiThanhToanId;
                        dynamic detailMaster = dataHD[k].detalMaster;
                        int idNgayHDLe = -1;
                        int idNgayHD = -1;
                        for (int j = 0; j < detailMaster.Count; j++)
                        {
                            if (dataHD[k].fLoaiHinhDonId == 1)
                            {

                                if (detailMaster[j].deliveryDate != "")
                                {
                                    idNgayHD = InsertNgayHoaDonReturnId(detailMaster[j], idPackageHD, hinhthucthanhtoan);
                                    InsertKhachHangNgay(idNgayHD, dataHD[k]);
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
                                    idNgayHDLe = InsertNgayHoaDonLeReturnId(detailMaster[j], idPackageHD, (String)dataHD[k].ngayGiaoHangLe, hinhthucthanhtoan);
                                    InsertKhachHangNgay(idNgayHDLe, dataHD[k]);
                                    InsertHoaDonSanPhamReturnId(detailMaster[j], idNgayHDLe);
                                    //InsertNgayHoaDonLeReturnId(detailMaster[j], idPackageHD, dataHD[k].ngayGiaoHangLe);
                                }
                                else
                                {
                                    InsertHoaDonSanPhamReturnId(detailMaster[j], idNgayHDLe);
                                }
                            }


                        }
                    }
                }
                return hoadonId.ToString();
            }
            catch (Exception e)
            {
                return "001";
            }
        }

        [HttpPost]
        public ContentResult getData(String type, String data, String MaHD, String TenKH, String TenSP)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getDataViewHoaDon(MaHD, TenKH, TenSP);
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
        public ContentResult getvHoaDonStep1(String type, String data, String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getvHoaDonStep1(MaHD, tuNgay, denNgay, trangThai, TenKH, SoDT);
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
        public ContentResult getvHoaDonStep2(String type, String data, String ID)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getvHoaDonStep2(ID);
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
        public String updateStatusVHoaDonStep1(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                for (int i = 0; i < dataDynamic.Count; i++)
                {
                    Servies.HoaDonServices.updateStatusVHoaDonStep1((int)dataDynamic[i].idHoaDon, (String)dataDynamic[i].statusBill);
                }
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }
        }

        [HttpPost]
        public ContentResult updateStatusVHoaDonStep2(String type, String data, String ID)
        {
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                dynamic hoadon = dataDynamic.HD;
                dynamic lsthoadon = dataDynamic.NHD;
                DataObject.HoaDon dtoHoaDon = new DataObject.HoaDon();
                int idHoadon = (int)hoadon.id;
                String sotienthuduoc = (String)hoadon.sotienthu;
                dtoHoaDon.TongTienThuDuoc = Convert.ToDecimal(sotienthuduoc != "" ? sotienthuduoc : "0");
                String conNo = (String)hoadon.sotienconlai;
                dtoHoaDon.TongTienConNo = Convert.ToDecimal(conNo != "" ? conNo : "0");
                Servies.HoaDonServices.updateHoaDonStep2(idHoadon, dtoHoaDon);
                for (int i = 0; i < lsthoadon.Count; i++)
                {
                    DataObject.NgayHoaDon ngayhoadon = new DataObject.NgayHoaDon();
                    //ngayhoadon.Ngay = Convert.ToDateTime((String)lsthoadon[i].date);
                    if ((String)lsthoadon[i].date != "")
                    {
                        ngayhoadon.Ngay = DateTime.ParseExact((String)lsthoadon[i].date, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }
                    
                    var ghichu = (String)lsthoadon[i].ghichu;
                    ngayhoadon.GhiChu = ghichu != null ? ghichu : "";
                    ngayhoadon.TrangThai = (String)lsthoadon[i].status;
                    String tong = (String)lsthoadon[i].money;
                    String sotiendathu = (String)lsthoadon[i].sotiendathu;
                    String sotienconlai = (String)lsthoadon[i].sotienconlai;
                    ngayhoadon.TongTien = Convert.ToDecimal(tong != "" ? tong : "0");
                    ngayhoadon.SoTienThu = Convert.ToDecimal(sotiendathu != "" ? sotiendathu : "0");
                    ngayhoadon.SoTienConLai = Convert.ToDecimal(sotienconlai != "" ? sotienconlai : "0");
                    Servies.HoaDonServices.updateNgayHoaDonStep2((int)lsthoadon[i].IdNgayHD, ngayhoadon);
                }
                String IDHD = Convert.ToString(idHoadon);
                DataTable lst = Servies.HoaDonServices.getvHoaDonStep2(IDHD);
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
        public ContentResult getvHoaDonStep3(String type, String data, String ngayhdId)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getvHoaDonStep3(ngayhdId);
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
        public int getSoLanGiao(String type, String data, String ngayhdId)
        {
            try
            {
                int solan = Servies.HoaDonServices.getSoLanGiao(ngayhdId);
                return solan;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }
        }
        [HttpPost]
        public Int32 getSoTienChuaXuLy(String type, String data, String ngayhdId)
        {
            try
            {
                Int32 sotien = Servies.HoaDonServices.getSoTienChuaXuLy(ngayhdId);
                return sotien;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }
        }

        [HttpPost]
        public String updateStatusVHoaDonStep3(String type, String data)
        {
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                dynamic infoKH = dataDynamic.infoKH;
                dynamic infoGoi = dataDynamic.infoGoi;
                dynamic infoSP = dataDynamic.infoSP;
                dynamic infoIdDelete = dataDynamic.infoDeleteIdSP;
                /*** Update Khách hàng *****/
                DataObject.SysCustomer sysCustomer = new DataObject.SysCustomer();
                sysCustomer.Address = (String)infoKH.diaChi;
                if (infoKH.ngaySinh != "")
                {
                    sysCustomer.BirthDay = DateTime.ParseExact((String)infoKH.ngaySinh, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                }
                sysCustomer.CustomerName = (String)infoKH.hoTen;
                sysCustomer.Email = (String)infoKH.email;
                sysCustomer.ID = (int)infoKH.idKH;
                sysCustomer.PhoneNumber = (String)infoKH.soDienThoai;
                sysCustomer.MaQuan = (String)infoKH.maquan;
                Servies.SysCustomerServices.UpdateDataTableKH(sysCustomer);
                /*** Update Gói *****/
                Servies.HoaDonServices.updateGóiStepV3((String)infoGoi.idngayHD, (String)infoGoi.GhiChu, (String)infoGoi.tienTangGiam);
                /** Update, Delete , Insert Sản phẩm ******/
                if (infoIdDelete.Count > 0)
                {
                    for (int i = 0; i < infoIdDelete.Count; i++)
                    {
                        Servies.HoaDonServices.deleteHoaDonSP((String)infoIdDelete[i]);
                    }
                }

                for (int k = 0; k < infoSP.Count; k++)
                {
                    if ((String)infoSP[k].idhdSp == "")
                    {
                        InsertDataStep3ReturnId(infoSP[k], Convert.ToInt32((String)infoSP[k].idngayHD));
                    }
                    else
                    {
                        UpdateHoaDonSP(infoSP[k], Convert.ToInt32((String)infoSP[k].idngayHD));
                    }
                }

                return "1";
            }
            catch (Exception e)
            {
                return "0";
            }
        }

        [HttpPost]
        public ContentResult getGoiHD(String type, String data)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = Servies.HoaDonServices.getGoiHD();
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
        public ContentResult uploadFile(String type, String data)
        {
            try
            {
                DataTable dt = new DataTable();
                HttpPostedFileBase file = Request.Files[0];
                if (file.ContentLength > 0)
                {
                    Excel.IExcelDataReader excelReader = Excel.ExcelReaderFactory.CreateOpenXmlReader(file.InputStream);
                    DataSet result = excelReader.AsDataSet();
                    excelReader.IsFirstRowAsColumnNames = true;
                    dt = result.Tables[0];                    
                }
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
        public String tachbill(String type, String data, String idHD, String IdCTHD, String IdPCTHD, String IdNgayHD, String ThanhTien)
        {
            try
            {
                Int32 IdHDNew = Servies.HoaDonServices.getTachBill(idHD, IdCTHD, IdPCTHD, IdNgayHD, ThanhTien);
                return IdHDNew.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }
        }
        
        [HttpPost]
        public ContentResult getLv2HD(String type, String data, String idHD)
        {
            try
            {
                DataTable dt = Servies.HoaDonServices.getLv2HD(idHD);
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
        public ContentResult getLv3HD(String type, String data, String idCTHD)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = Servies.HoaDonServices.getLv3HD(idCTHD);
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
                var list = JsonConvert.SerializeObject(dt,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
        }

        [HttpPost]
        public String insertNgayDonHang(String type, String data, String idGoi, String ngayDH)
        {
            DataTable dt = new DataTable();
            try
            {
                int idNgayHD = InsertNgayHoaDonStep2ReturnId(Convert.ToInt32(idGoi), ngayDH);
                Servies.HoaDonServices.insertKhachHangNgayByGoiHD(Convert.ToInt32(idGoi), idNgayHD);
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                for (var i = 0; i < dataDynamic.Count; i++)
                {
                    InsertHoaDonSanPhamReturnId(dataDynamic[i], idNgayHD);
                }
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }
        }
        [HttpPost]
        public ContentResult loadInfoKHByHD(String type, String data, String idHD)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = Servies.HoaDonServices.loadInfoKHByHD(idHD);
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
                var list = JsonConvert.SerializeObject(dt,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
        }
        [HttpPost]
        public String insertGoiStepv2(String type, String data, String idHD)
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
                String tong = "";
                String IdChiTietHoaHD = "";

                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                dynamic inFoCustomer = dataDynamic.infoKH;
                dynamic infoBill = dataDynamic.infoBill;
                hoten = (String)inFoCustomer.hoTen;
                maKH = (String)inFoCustomer.maKH;
                ngaySinh = (String)inFoCustomer.ngaySinh;
                soDienThoai = (String)inFoCustomer.soDienThoai;
                email = (String)inFoCustomer.email;
                diaChi = (String)inFoCustomer.diaChi;
                maquan = (String)inFoCustomer.maquan;
                tong = (String)dataDynamic.fThanhTien;
                IdChiTietHoaHD = (String)dataDynamic.idCTHD;
                dynamic dataHD = dataDynamic.Data;
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

                /********************************* 
                * Insert Chi tiết hóa đơn , hoa đơn package , hóa đơn ngày , sản phẩm
                * 
                * *******************************/
                int idPackageHD = InsertPackageChiTietHoaDonReturnId(data, Convert.ToInt32(IdChiTietHoaHD));
                Servies.HoaDonServices.updateTienHD(IdChiTietHoaHD, idPackageHD);
                if ((String)dataDynamic.NgayHD != "")
                {
                    int idNgayHDLe = InsertNgayHoaDonLeReturnId(data, idPackageHD, (String)dataDynamic.NgayHD, (String)dataDynamic.fLoaiThanhToanId);
                    InsertKhachHangNgay(idNgayHDLe, data);
                    for (int j = 0; j < dataHD.Count; j++)
                    {
                        InsertHoaDonSanPhamReturnId(dataHD[j], idNgayHDLe);
                    }
                }
                else
                {
                    for (int j = 0; j < dataHD.Count; j++)
                    {
                        int idNgayHD = -1;
                        if (dataHD[j].deliveryDate != "")
                        {
                            idNgayHD = InsertNgayHoaDonReturnId(dataHD[j], idPackageHD, (String)dataDynamic.fLoaiThanhToanId);
                            InsertKhachHangNgay(idNgayHD, dataDynamic);
                        }
                        else
                        {
                            InsertHoaDonSanPhamReturnId(dataHD[j], idNgayHD);
                        }
                    }
                }
                return "1";
            }
            catch (Exception e)
            {
                //log.Error("Error function getMaxIdHoaDon ",e);
                return "0";
            }
        }

        [HttpPost]
        public Int32 getMaxIdHoaDon(String type, String data)
        {
            try
            {
                Int32 maxId = Servies.HoaDonServices.getMaxIdHoaDon();
                return maxId;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }
        }

        [HttpPost]
        public String UpdateTrangThaiNgayHoaDon(String type, String data, String IdPCTHD, String idHD)
        {
            try
            {
                String TrangThai = "Hủy Đơn";
                Servies.HoaDonServices.UpdateTrangThaiNgayHoaDon(IdPCTHD, TrangThai, idHD);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
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
                    sysCustomer.BirthDay = DateTime.ParseExact(ngaySinh, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                }

                IdKhachHang = Servies.SysCustomerServices.InsertDataReturnId(sysCustomer);
            }
            return IdKhachHang;
        }

        public int returnIdKHNgay(string soDienThoai, string hoten, string email, string diaChi, string maquan, string ngaySinh, int NgayHoaDon)
        {
            DataObject.KhachHangNgay sysCustomer = new DataObject.KhachHangNgay();
            sysCustomer.PhoneNumber = soDienThoai;
            sysCustomer.CustomerName = hoten;
            sysCustomer.Email = email;
            sysCustomer.Address = diaChi;
            sysCustomer.MaQuan = maquan;
            if (ngaySinh != "")
            {
                sysCustomer.BirthDay = DateTime.ParseExact(ngaySinh, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            sysCustomer.NgayHoaDonId = NgayHoaDon;
            int IdKhachHang = Servies.SysCustomerServices.InsertDataKHNgayReturnId(sysCustomer);
            return IdKhachHang;
        }

        public int InsertChiTietHoaDonReturnId(dynamic infoBill, int hoadonId, int IdKhachHang, bool isMaster)
        {
            DataObject.ChiTietHoaDon chitietHD = new DataObject.ChiTietHoaDon();
            chitietHD.IDHoaDon = hoadonId;
            chitietHD.IsMaster = isMaster ? 1 : 0;
            chitietHD.tabIndex = ((int)infoBill.tabIndex) + 1;
            if (chitietHD.IsMaster == 1)
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
            packageChiTietHD.HinhThucGiaoHang = data.fHinhThucShip;
            String thanhtien = (String)data.fThanhTien;
            packageChiTietHD.ThanhTien = Convert.ToDecimal(thanhtien != "" ? thanhtien.Replace(".", "") : "0");
            packageChiTietHD.TrangThai = "Chưa xử lý";
            packageChiTietHD.IDGoi = (int)(data.IDGoi);
            String hoten1 = data.infoKH.hoTen;
            String maKH1 = data.infoKH.maKH;
            String ngaySinh1 = data.infoKH.ngaySinh;
            String soDienThoai1 = data.infoKH.soDienThoai;
            String email1 = data.infoKH.email;
            String diaChi1 = data.infoKH.diaChi;
            String maquan1 = data.infoKH.maquan;
            packageChiTietHD.IDKhachHang = returnIdKH(soDienThoai1, hoten1, email1, diaChi1, maquan1, ngaySinh1);
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertPackageChiTietHoaDonReturnId(packageChiTietHD);
            return IdChiTietHoaHD;
        }

        public int InsertNgayHoaDonReturnId(dynamic data, int idPackageHD, String hinhthucthanhtoan)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            String deliveryDate = (String)data.deliveryDate;
            if (deliveryDate != "")
            {
                // deliveryDate = deliveryDate.Split('/')[1] + "/" + deliveryDate.Split('/')[0] + "/" + deliveryDate.Split('/')[2];
                ngayHoaDon.Ngay = DateTime.ParseExact(deliveryDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            else
            {
                ngayHoaDon.Ngay = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            ngayHoaDon.TrangThai = "Chưa xử lý";
            ngayHoaDon.HinhThucThanhToan = hinhthucthanhtoan;
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }
        public int InsertNgayHoaDonStep2ReturnId(int idPackageHD, String ngayHD)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            //String createDate = String.Format("{0:dd/MM/yyyy}", ngayHD);
            if (ngayHD != "")
            {
                ngayHoaDon.Ngay = DateTime.ParseExact(ngayHD, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            
            ngayHoaDon.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }
        public void InsertKhachHangNgay(int idNgayHoaDon, dynamic data)
        {
            String hoten1 = data.infoKH.hoTen;
            String maKH1 = data.infoKH.maKH;
            String ngaySinh1 = data.infoKH.ngaySinh;
            String soDienThoai1 = data.infoKH.soDienThoai;
            String email1 = data.infoKH.email;
            String diaChi1 = data.infoKH.diaChi;
            String maquan1 = data.infoKH.maquan;
            returnIdKHNgay(soDienThoai1, hoten1, email1, diaChi1, maquan1, ngaySinh1, idNgayHoaDon);
        }
        public int InsertNgayHoaDonLeReturnId(dynamic data, int idPackageHD, String ngayHoaDonLe, String hinhthucthanhtoan)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            //ngayHoaDonLe = ngayHoaDonLe.Split('/')[1] + "/" + ngayHoaDonLe.Split('/')[0] + "/" + ngayHoaDonLe.Split('/')[2];
            //ngayHoaDon.Ngay = Convert.ToDateTime(ngayHoaDonLe);
            if (ngayHoaDonLe != "")
            {
                ngayHoaDon.Ngay = DateTime.ParseExact(ngayHoaDonLe, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            
            ngayHoaDon.TrangThai = "Chưa xử lý";
            ngayHoaDon.HinhThucThanhToan = hinhthucthanhtoan;
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }

        public int InsertHoaDonSanPhamReturnId(dynamic data, int idNgayHoaDon)
        {
            DataObject.HoaDonSanPham ngayHoaDon = new DataObject.HoaDonSanPham();
            ngayHoaDon.IDNgayHoaDon = idNgayHoaDon;
            String money = (String)data.money;
            if (money == "")
            {
                money = "0";
            }
            ngayHoaDon.money = Convert.ToDecimal(money.Replace(".", ""));
            ngayHoaDon.product = data.product;
            ngayHoaDon.sugar = (Boolean)data.sugar ? 1 : 0;
            ngayHoaDon.quantity = data.quantity;
            String price = (String)data.price;
            if (price == "")
            {
                price = "0";
            }
            ngayHoaDon.price = Convert.ToDecimal(price.Replace(".", ""));
            ngayHoaDon.promotionCode = data.promotionCode;
            String total = (String)data.total;
            if (total == "")
            {
                total = "0";
            }
            ngayHoaDon.total = Convert.ToDecimal(total.Replace(".", ""));
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
        public int InsertDataStep3ReturnId(dynamic data, int idNgayHoaDon)
        {
            DataObject.HoaDonSanPham ngayHoaDon = new DataObject.HoaDonSanPham();
            ngayHoaDon.IDNgayHoaDon = idNgayHoaDon;
            String money = (String)data.money;
            if (money == "")
            {
                money = "0";
            }
            ngayHoaDon.money = Convert.ToDecimal(money.Replace(".", ""));
            ngayHoaDon.product = data.product;
            ngayHoaDon.sugar = data.sugar;
            ngayHoaDon.Error = data.Error;
            ngayHoaDon.quantity = data.quantity;
            String price = (String)data.price;
            if (price == "")
            {
                price = "0";
            }
            ngayHoaDon.price = Convert.ToDecimal(price.Replace(".", ""));
            ngayHoaDon.promotionCode = data.promotionCode;
            String total = (String)data.total;
            if (total == "")
            {
                total = "0";
            }
            ngayHoaDon.total = Convert.ToDecimal(total.Replace(".", ""));
            if (data.GhiChu != null && data.GhiChu != "")
            {
                ngayHoaDon.GhiChu = data.GhiChu;
            }
            else
            {
                ngayHoaDon.GhiChu = "";
            }
            Servies.HoaDonSanPhamServices.InsertDataStep3ReturnId(ngayHoaDon);
            return 1;
        }
        public int UpdateHoaDonSP(dynamic data, int idNgayHoaDon)
        {
            DataObject.HoaDonSanPham ngayHoaDon = new DataObject.HoaDonSanPham();
            ngayHoaDon.IDNgayHoaDon = idNgayHoaDon;
            String money = (String)data.money;
            if (money == "")
            {
                money = "0";
            }
            ngayHoaDon.money = Convert.ToDecimal(money.Replace(".", ""));
            ngayHoaDon.product = data.product;
            ngayHoaDon.sugar = data.sugar;
            ngayHoaDon.Error = data.Error;
            ngayHoaDon.quantity = data.quantity;
            ngayHoaDon.ID = (Int32)data.idhdSp;
            String price = (String)data.price;
            if (price == "")
            {
                price = "0";
            }
            ngayHoaDon.price = Convert.ToDecimal(price.Replace(".", ""));
            ngayHoaDon.promotionCode = data.promotionCode;
            String total = (String)data.total;
            if (total == "")
            {
                total = "0";
            }
            ngayHoaDon.total = Convert.ToDecimal(total.Replace(".", ""));
            if (data.GhiChu != null && data.GhiChu != "")
            {
                ngayHoaDon.GhiChu = data.GhiChu;
            }
            else
            {
                ngayHoaDon.GhiChu = "";
            }
            Servies.HoaDonSanPhamServices.UpdateDataHoaDonSP(ngayHoaDon);
            return 1;
        }

    }
}
