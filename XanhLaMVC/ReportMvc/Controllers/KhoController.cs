using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class KhoController : Controller
    {
        //
        // GET: /Kho/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ContentResult viewK001P1(String type, String data, String Ngay, String thu)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                List<DataObject.Kho001> result = Servies.KhoServices.viewK001P1(Ngay, thu);
                var list = JsonConvert.SerializeObject(result,
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
        public ContentResult viewSPCL(String type, String data, String Ngay, String thu)
        {
            try
            {
                //Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan

                List<DataObject.Kho001> result = Servies.KhoServices.viewSPCL(Ngay, thu);
                var list = JsonConvert.SerializeObject(result,
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
        public String insertOrUpdateViewK001(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                for (int i = 0; i < dataDynamic.Count; i++)
                {
                    String Ngay = dataDynamic[i].Ngay;
                    String ID = dataDynamic[i].ID;
                    String productName = dataDynamic[i].productName;
                    String ProductId = dataDynamic[i].ProductId;
                    String productUnit = dataDynamic[i].productUnit;
                    String productUnit_DK = dataDynamic[i].productUnit_DK;
                    String productUnit_CL = dataDynamic[i].productUnit_CL;
                    Servies.KhoServices.insertOrUpdateViewK001(Ngay, ID, productName, ProductId, productUnit, productUnit_DK, productUnit_CL);
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
        public ContentResult viewK001P2(String type, String data,String Ngay)
        {
            try
            {
                DataTable lst = Servies.KhoServices.viewK001P2(Ngay);
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
        public ContentResult viewK002(String type, String data, String TuNgay, String DenNgay)
        {
            try
            {
                List<DataObject.Kho002> lst = Servies.KhoServices.viewK002(TuNgay, DenNgay);
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
        public String InsertKho003ReturnID(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                DataObject.Kho003 obj = new DataObject.Kho003();
                dynamic dataPX = dataDynamic.PX;
                obj.ID = Convert.ToInt16(dataPX.ID);
                obj.NhaCungCap = (String)dataPX.NhaCungCap;
                obj.Ten = (String)dataPX.Ten;
                obj.SoDT = (String)dataPX.SoDT;
                obj.DiaChi = (String)dataPX.DiaChi;
                obj.Ngay = DateTime.ParseExact((String)dataPX.Ngay, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                obj.Kho = Convert.ToInt16(dataPX.Kho);
                obj.GhiChu = (String)dataPX.GhiChu;
                obj.NgayTao = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                obj.NguoiTao = this.Session["UserName"].ToString();
                obj.MaPhieuNhap = "PN-" + DateTime.Now.ToString("ddMMyy") + DateTime.Now.ToString("tt") + DateTime.Now.ToString("hh");
                obj.MaPhieuXuat = "PX-" + DateTime.Now.ToString("ddMMyy") + DateTime.Now.ToString("tt") + DateTime.Now.ToString("hh");
                obj.Type = Convert.ToInt16(dataPX.Type);
                int result = Servies.KhoServices.InsertKho003ReturnID(obj);
                dynamic dataDetail = dataDynamic.Detail;
                for (int i = 0; i < dataDetail.Count; i++)
                {
                    DataObject.KhoNhapXuatDetail detail = new DataObject.KhoNhapXuatDetail();
                    detail.Type = Convert.ToInt16(dataDetail[i].Type);
                    detail.ID = Convert.ToInt16(dataDetail[i].ID);
                    if (detail.Type == 0)
                    {
                        detail.NhapKhoId = result;
                    }
                    else if (detail.Type == 1)
                    {
                        detail.XuatKhoId = result;
                    }
                    else if (detail.Type == 2)
                    {
                        detail.NhapKhoId = result;
                    }
                    detail.Product_Code = (String)dataDetail[i].Product_Code;
                    detail.Product_Name = (String)dataDetail[i].Product_Name;
                    detail.SoLuong = Convert.ToInt16(dataDetail[i].SoLuong);
                    detail.DonVi = (String)dataDetail[i].DonVi;
                    detail.HanSuDung = DateTime.ParseExact((String)dataDetail[i].HanSuDung, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    detail.Gia = (String)dataDetail[i].Gia;
                    detail.Kho = Convert.ToInt16(dataDetail[i].Kho);
                    Servies.KhoServices.InsertKhoNhapXuatDetailReturnID(detail);
                }
                if (obj.Type == 0)
                {
                    return obj.MaPhieuNhap.ToString();
                }
                else if (obj.Type == 1)
                {
                    return obj.MaPhieuXuat.ToString();
                }
                else if (obj.Type == 2)
                {
                    return obj.MaPhieuNhap.ToString();
                }
                return "" ;
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }

        }
        [HttpPost]
        public ContentResult viewDetailNhapXuatKho(String type, String data, String TypeXNK, String IdNhapXuat)
        {
            try
            {
                List<DataTable> lst = Servies.KhoServices.viewDetailNhapXuatKho(Convert.ToInt16(TypeXNK), Convert.ToInt16(IdNhapXuat));
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
        public ContentResult viewNhapXuatKho(String type, String data, String TypeXNK, String Ma, String KhoId, String Ngay)
        {
            try
            {
                DataTable lst = Servies.KhoServices.viewNhapXuatKho(Convert.ToInt16(TypeXNK), Ma, Convert.ToInt16(KhoId), Ngay);
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
        public String insertOrUpdateNhaCungCap(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                DataObject.NhaCungCap obj = new DataObject.NhaCungCap();
                obj.ID = Convert.ToInt16(dataDynamic.ID);
                obj.MaNCC = (String)dataDynamic.MaNCC;
                obj.TenNCC = (String)dataDynamic.TenNCC;
                obj.SoDT = (String)dataDynamic.SoDT;
                obj.Tinh = (String)dataDynamic.Tinh;
                obj.DiaChi = (String)dataDynamic.DiaChi;
                obj.LoaiDichVu = (String)dataDynamic.LoaiDichVu;
                obj.GhiChu = (String)dataDynamic.GhiChu;
                obj.NgayTao = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                obj.NguoiTao = this.Session["UserName"].ToString();
                int kq = Servies.KhoServices.insertOrUpdateNhaCungCap(obj);
                return kq.ToString();
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public String DeleteNhaCungCap(String type, String data, String ID)
        {
            try
            {
                int Ids = Convert.ToInt16(ID);
                Servies.KhoServices.DeleteNhaCungCap(Ids);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public ContentResult viewNhaCungCap(String type, String data, String MaNCC, String TenNCC, String SoDT, String Tinh, String LoaiDichVu)
        {
            try
            {
                DataTable dt = Servies.KhoServices.viewNhaCungCap(MaNCC, TenNCC, SoDT, Tinh, LoaiDichVu);
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
