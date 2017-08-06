using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Excel;
//using log4net;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerInsertBill
    /// </summary>
    public class HandlerInsertBill : IHttpHandler
    {
       // private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

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
                    int isMasterTab = data.isMasterTab;
                    /********************************* 
                     * Check and Insert Khách hàng nếu không tồn tại
                     * Nếu tồn tại getId Khách hàng
                     * 
                     * *******************************/
                    int IdKhachHang = returnIdKH(soDienThoai,hoten,email,diaChi,maquan,ngaySinh);
                    /********************************* 
                    * Insert Hóa đơn
                    * 
                    * *******************************/
                    DataObject.HoaDon hoadon = new DataObject.HoaDon();
                    hoadon.IDKhachHang = IdKhachHang;
                    hoadon.IDNguon = Convert.ToInt32(sourceId);
                    hoadon.NgayTao =  DateTime.Now;
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

                            dynamic detailMaster = dataHD[k].detalMaster;
                            int idNgayHDLe = -1;
                            int idNgayHD = -1;
                            for (int j = 0; j < detailMaster.Count; j++)
                            {
                                if (dataHD[k].fLoaiHinhDonId == 1) {
                                    
                                    if (detailMaster[j].deliveryDate != "")
                                    {
                                        idNgayHD = InsertNgayHoaDonReturnId(detailMaster[j], idPackageHD);
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
                                        idNgayHDLe = InsertNgayHoaDonLeReturnId(detailMaster[j], idPackageHD, (String)dataHD[k].ngayGiaoHangLe);
                                        InsertKhachHangNgay(idNgayHD, dataHD[k]);
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
                        context.Response.ContentType = "text/plain";
                        context.Response.Write(hoadonId);
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
            else if (type == "getData")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String MaHD = context.Request.Form["MaHD"].ToString();
                    String TenKH = context.Request.Form["TenKH"].ToString();
                    String TenSP = context.Request.Form["TenSP"].ToString();
                    DataTable lst = Servies.HoaDonServices.getDataViewHoaDon(MaHD, TenKH, TenSP); 
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getvHoaDonStep1")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    String MaHD = context.Request.Form["MaHD"].ToString();
                    String tuNgay = context.Request.Form["tuNgay"].ToString();
                    String denNgay = context.Request.Form["denNgay"].ToString();
                    String trangThai = context.Request.Form["trangThai"].ToString();
                    String TenKH = context.Request.Form["TenKH"].ToString();
                    String SoDT = context.Request.Form["SoDT"].ToString();
                    DataTable lst = Servies.HoaDonServices.getvHoaDonStep1(MaHD, tuNgay, denNgay, trangThai, TenKH, SoDT);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getvHoaDonStep2")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    String ID = context.Request.Form["ID"].ToString();
                    DataTable lst = Servies.HoaDonServices.getvHoaDonStep2(ID);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "updateStatusVHoaDonStep1")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    for (int i = 0; i < data.Count; i++)
                    {
                        Servies.HoaDonServices.updateStatusVHoaDonStep1((int)data[i].idHoaDon, (String)data[i].statusBill);
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(JsonConvert.SerializeObject("1"));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(JsonConvert.SerializeObject("0"));
                }
            }
            else if (type == "updateStatusVHoaDonStep2")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    dynamic hoadon = data.HD;
                    dynamic lsthoadon = data.NHD;
                    DataObject.HoaDon dtoHoaDon = new DataObject.HoaDon();
                    int idHoadon = (int)hoadon.id;
                    String sotienthuduoc = (String) hoadon.sotienthu;
                    dtoHoaDon.TongTienThuDuoc = Convert.ToDecimal(sotienthuduoc != "" ? sotienthuduoc : "0");
                    String conNo = (String) hoadon.sotienconlai;
                    dtoHoaDon.TongTienConNo = Convert.ToDecimal(conNo != "" ? conNo : "0");
                    Servies.HoaDonServices.updateHoaDonStep2(idHoadon, dtoHoaDon);
                    for (int i = 0; i < lsthoadon.Count; i++)
                    {
                        DataObject.NgayHoaDon ngayhoadon = new DataObject.NgayHoaDon();
                        ngayhoadon.Ngay = Convert.ToDateTime((String)lsthoadon[i].date);
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
                    String ID = Convert.ToString(idHoadon);
                    DataTable lst = Servies.HoaDonServices.getvHoaDonStep2(ID);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(JsonConvert.SerializeObject("0"));
                }
            }
            else if (type == "getvHoaDonStep3")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    String ngayhdId = context.Request.Form["ngayhdId"].ToString();
                    DataTable lst = Servies.HoaDonServices.getvHoaDonStep3(ngayhdId);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getSoLanGiao")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    String ngayhdId = context.Request.Form["ngayhdId"].ToString();
                    int solan = Servies.HoaDonServices.getSoLanGiao(ngayhdId);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(solan);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getSoTienChuaXuLy")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    String ngayhdId = context.Request.Form["ngayhdId"].ToString();
                    Int32 sotien = Servies.HoaDonServices.getSoTienChuaXuLy(ngayhdId);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(sotien);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "updateStatusVHoaDonStep3")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    dynamic infoKH = data.infoKH;
                    dynamic infoGoi = data.infoGoi;
                    dynamic infoSP = data.infoSP;
                    dynamic infoIdDelete = data.infoDeleteIdSP;
                    /*** Update Khách hàng *****/
                    DataObject.SysCustomer sysCustomer = new DataObject.SysCustomer();
                    sysCustomer.Address = (String)infoKH.diaChi;
                    if (infoKH.ngaySinh != "")
                    {
                        sysCustomer.BirthDay = DateTime.Parse((String)infoKH.ngaySinh);
                    }
                    sysCustomer.CustomerName = (String)infoKH.hoTen;
                    sysCustomer.Email = (String)infoKH.email;
                    sysCustomer.ID = (int)infoKH.idKH;
                    sysCustomer.PhoneNumber = (String)infoKH.soDienThoai;
                    sysCustomer.MaQuan = (String)infoKH.maquan;
                    Servies.SysCustomerServices.UpdateData(sysCustomer);
                    /*** Update Gói *****/
                    Servies.HoaDonServices.updateGóiStepV3((String)infoGoi.idngayHD, (String)infoGoi.GhiChu, (String)infoGoi.tienTangGiam);
                    /** Update, Delete , Insert Sản phẩm ******/
                    if(infoIdDelete.Count > 0){
                        for(int i = 0; i < infoIdDelete.Count ; i++){
                            Servies.HoaDonServices.deleteHoaDonSP((String)infoIdDelete[i]);
                        }
                    }
                    
                    for(int k = 0; k < infoSP.Count ; k++){
                        if((String)infoSP[k].idhdSp == ""){
                            InsertDataStep3ReturnId(infoSP[k], Convert.ToInt32((String)infoSP[k].idngayHD));
                        }else{
                            UpdateHoaDonSP(infoSP[k], Convert.ToInt32((String)infoSP[k].idngayHD));
                        }
                    }

                    context.Response.ContentType = "text/plain";
                    context.Response.Write(JsonConvert.SerializeObject("1"));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(JsonConvert.SerializeObject("0"));
                }
            }
            else if (type == "getGoiHD")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)

                    DataTable dt = Servies.HoaDonServices.getGoiHD();
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "uploadFile")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getvHoaDonStep1(
                    //String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
                    HttpPostedFile file = context.Request.Files[0];

                    if (file.ContentLength > 0)
                    {
                        IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(file.InputStream);
                        DataSet result = excelReader.AsDataSet();
                        excelReader.IsFirstRowAsColumnNames = true;
                        DataTable dt = result.Tables[0];
                        /*
                        for (Int32 i = 1; i < dt.Rows.Count; i++)
                        {
                            String x = "1";
                        }*/
                        //do something
                        context.Response.ContentType = "application/json";
                        context.Response.Write(JsonConvert.SerializeObject(dt));
                    }
                    //DataTable dt = Servies.HoaDonServices.getGoiHD();
                    //context.Response.ContentType = "application/json";
                    //context.Response.Write(JsonConvert.SerializeObject(dt));
                    //context.Response.ContentType = "text/plain";
                   // context.Response.Write("Error");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }//tachbill
            else if (type == "tachbill")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String idHD = context.Request.Form["idHD"].ToString();
                    String IdCTHD = context.Request.Form["IdCTHD"].ToString();
                    String IdPCTHD = context.Request.Form["IdPCTHD"].ToString();
                    String IdNgayHD = context.Request.Form["IdNgayHD"].ToString();
                    String ThanhTien = context.Request.Form["ThanhTien"].ToString();
                    Int32 IdHDNew = Servies.HoaDonServices.getTachBill(idHD,IdCTHD,IdPCTHD,IdNgayHD,ThanhTien);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(IdHDNew);
                    //log.Info(maxId);
                }
                catch (Exception e)
                {
                    //log.Error("Error function getMaxIdHoaDon ",e);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getLv2HD")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String idHD = context.Request.Form["idHD"].ToString();
                  
                    DataTable dt = Servies.HoaDonServices.getLv2HD(idHD);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                    //log.Info(maxId);
                }
                catch (Exception e)
                {
                    //log.Error("Error function getMaxIdHoaDon ",e);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getLv3HD")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String idCTHD = context.Request.Form["idCTHD"].ToString();
                    DataTable dt = Servies.HoaDonServices.getLv3HD(idCTHD);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                    //log.Info(maxId);
                }
                catch (Exception e)
                {
                    //log.Error("Error function getMaxIdHoaDon ",e);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "insertNgayDonHang")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String idGoi = context.Request.Form["idGoi"].ToString();
                    String ngayDH = context.Request.Form["ngayDH"].ToString();
                    int idNgayHD = InsertNgayHoaDonStep2ReturnId(Convert.ToInt32(idGoi), ngayDH);
                    Servies.HoaDonServices.insertKhachHangNgayByGoiHD(Convert.ToInt32(idGoi), idNgayHD);
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    for (var i = 0; i < data.Count; i++)
                    {
                        InsertHoaDonSanPhamReturnId(data[i], idNgayHD);
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                    //log.Info(maxId);
                }
                catch (Exception e)
                {
                    //log.Error("Error function getMaxIdHoaDon ",e);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "loadInfoKHByHD")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                    String idHD = context.Request.Form["idHD"].ToString();
                    DataTable dt = Servies.HoaDonServices.loadInfoKHByHD(idHD);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                    //log.Info(maxId);
                }
                catch (Exception e)
                {
                    //log.Error("Error function getMaxIdHoaDon ",e);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getMaxIdHoaDon")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getDataViewHoaDon(String MaHD,String TenKH,String TenSP)
                   
                    Int32 maxId = Servies.HoaDonServices.getMaxIdHoaDon();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(maxId);
                    //log.Info(maxId);
                }
                catch (Exception e)
                {
                    //log.Error("Error function getMaxIdHoaDon ",e);
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

        public int returnIdKHNgay(string soDienThoai, string hoten, string email, string diaChi, string maquan, string ngaySinh,int NgayHoaDon)
        {
            DataObject.KhachHangNgay sysCustomer = new DataObject.KhachHangNgay();
            sysCustomer.PhoneNumber = soDienThoai;
            sysCustomer.CustomerName = hoten;
            sysCustomer.Email = email;
            sysCustomer.Address = diaChi;
            sysCustomer.MaQuan = maquan;
            if (ngaySinh != "")
            {
                sysCustomer.BirthDay = DateTime.Parse(ngaySinh);
            }
            int IdKhachHang = Servies.SysCustomerServices.InsertDataKHNgayReturnId(sysCustomer);
            return IdKhachHang;
        }

        public int InsertChiTietHoaDonReturnId(dynamic infoBill, int hoadonId, int IdKhachHang,bool isMaster)
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

        

        public int InsertPackageChiTietHoaDonReturnId(dynamic data,int hoaDonChiTietId)
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
            packageChiTietHD.IDGoi = Convert.ToInt32(data.IDGoi);
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

        public int InsertNgayHoaDonReturnId(dynamic data, int idPackageHD)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            ngayHoaDon.Ngay = Convert.ToDateTime(data.deliveryDate != "" ? data.deliveryDate : DateTime.Now);
            ngayHoaDon.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }
        public int InsertNgayHoaDonStep2ReturnId(int idPackageHD,String ngayHD)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            String createDate = String.Format("{0:dd/MM/yyyy}", ngayHD);
            ngayHoaDon.Ngay = DateTime.Parse(createDate);
            ngayHoaDon.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }
        public void InsertKhachHangNgay(int idNgayHoaDon,dynamic data)
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
        public int InsertNgayHoaDonLeReturnId(dynamic data, int idPackageHD,String ngayHoaDonLe)
        {
            DataObject.NgayHoaDon ngayHoaDon = new DataObject.NgayHoaDon();
            ngayHoaDon.IDPackageChitietHD = idPackageHD;
            ngayHoaDon.Ngay = Convert.ToDateTime(ngayHoaDonLe);
            ngayHoaDon.TrangThai = "Chưa xử lý";
            int IdChiTietHoaHD = Servies.HoaDonServices.InsertNgayHoaDonReturnId(ngayHoaDon);
            return IdChiTietHoaHD;
        }

        public int InsertHoaDonSanPhamReturnId(dynamic data, int idNgayHoaDon){
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
            if(data.GhiChu != null && data.GhiChu != ""){
                ngayHoaDon.GhiChu = data.GhiChu;
            }else{
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
            ngayHoaDon.Error = data.error;
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
            ngayHoaDon.ID = Convert.ToInt32(data.idhdSp);
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