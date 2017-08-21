using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerKhoServices
    /// </summary>
    public class HandlerKhoServices : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            //String jsonData = context.Request.Form["data"].ToString();
            if (type == "viewK001P1")
            {
                try
                {
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    String thu = context.Request.Form["thu"].ToString();
                    List<DataObject.Kho001> result = Servies.KhoServices.viewK001P1(Ngay, thu);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(result));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "viewSPCL")
            {
                try
                {
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    String thu = context.Request.Form["thu"].ToString();
                    List<DataObject.Kho001> result = Servies.KhoServices.viewSPCL(Ngay, thu);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(result));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "insertOrUpdateViewK001")
            {
                try
                {

                    //String Ngay, String ID,String productName,String ProductId,String productUnit,String productUnit_DK,String productUnit_CL
                    String jsonData = context.Request.Form["data"].ToString();
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    for (int i = 0; i < data.Count; i++)
                    {
                        String Ngay = data[i].Ngay;
                        String ID = data[i].ID;
                        String productName = data[i].productName;
                        String ProductId = data[i].ProductId;
                        String productUnit = data[i].productUnit;
                        String productUnit_DK = data[i].productUnit_DK;
                        String productUnit_CL = data[i].productUnit_CL;
                        Servies.KhoServices.insertOrUpdateViewK001(Ngay,ID,productName,ProductId,productUnit,productUnit_DK,productUnit_CL);
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "viewK001P2")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record getUserInGroup(String MaHD,String TenKH,String TenSP)
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable lst = Servies.KhoServices.viewK001P2(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "viewK002")
            {
                try
                {
                    String TuNgay = context.Request.Form["TuNgay"].ToString();
                    String DenNgay = context.Request.Form["DenNgay"].ToString();
                    List<DataObject.Kho002> lst = Servies.KhoServices.viewK002(TuNgay, DenNgay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "InsertKho003ReturnID")
            {
                try
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    DataObject.Kho003 obj = new DataObject.Kho003();
                    dynamic dataPX = data.PX;
                    obj.ID = Convert.ToInt16(dataPX.ID);
                    obj.NhaCungCap = (String)dataPX.NhaCungCap;
                    obj.Ten = (String)dataPX.Ten;
                    obj.SoDT = (String)dataPX.SoDT;
                    obj.DiaChi = (String)dataPX.DiaChi;
                    obj.Ngay = DateTime.ParseExact((String)dataPX.Ngay, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    obj.Kho = Convert.ToInt16(dataPX.Kho);
                    obj.GhiChu = (String)dataPX.GhiChu;
                    obj.NgayTao = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    obj.NguoiTao = HttpContext.Current.Session["UserName"].ToString();
                    obj.MaPhieuNhap = "PN-" + DateTime.Now.ToString("ddMMyy") + DateTime.Now.ToString("tt") + DateTime.Now.ToString("hh");
                    obj.MaPhieuXuat = "PX-" + DateTime.Now.ToString("ddMMyy") + DateTime.Now.ToString("tt") + DateTime.Now.ToString("hh");
                    obj.Type = Convert.ToInt16(dataPX.Type);
                    int result = Servies.KhoServices.InsertKho003ReturnID(obj);
                    dynamic dataDetail = data.Detail;
                    for (int i = 0; i < dataDetail.Count; i++)
                    {
                        DataObject.KhoNhapXuatDetail detail = new DataObject.KhoNhapXuatDetail();
                        detail.Type = Convert.ToInt16(dataDetail[i].Type);
                        detail.ID = Convert.ToInt16(dataDetail[i].ID);
                        if(detail.Type == 0){
                            detail.NhapKhoId = result;
                        }else{
                            detail.XuatKhoId = result;
                        }
                        detail.Product_Code = (String)dataDetail[i].Product_Code;
                        detail.Product_Name = (String)dataDetail[i].Product_Name;
                        detail.SoLuong = Convert.ToInt16(dataDetail[i].SoLuong);
                        detail.DonVi =(String)dataDetail[i].DonVi;
                        detail.HanSuDung = DateTime.ParseExact((String)dataDetail[i].HanSuDung, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        detail.Gia = (String)dataDetail[i].Gia;
                        detail.Kho = Convert.ToInt16(dataDetail[i].Kho);
                        Servies.KhoServices.InsertKhoNhapXuatDetailReturnID(detail);
                    }
                    context.Response.ContentType = "text/plain";
                    if (obj.Type == 0)
                    {
                        context.Response.Write(obj.MaPhieuNhap);
                    }
                    else
                    {
                        context.Response.Write(obj.MaPhieuXuat);
                    }
                    
                }

                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "viewDetailNhapXuatKho")
            {
                try
                {
                    String Type = context.Request.Form["TypeXNK"].ToString();
                    String IdNhapXuat = context.Request.Form["IdNhapXuat"].ToString();
                    List<DataTable> lst = Servies.KhoServices.viewDetailNhapXuatKho(Convert.ToInt16(Type), Convert.ToInt16(IdNhapXuat));
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "viewNhapXuatKho")
            {
                try
                {
                    String Type = context.Request.Form["TypeXNK"].ToString();
                    String Ma = context.Request.Form["Ma"].ToString();
                    String KhoId = context.Request.Form["KhoId"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable lst = Servies.KhoServices.viewNhapXuatKho(Convert.ToInt16(Type), Ma, Convert.ToInt16(KhoId), Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "insertOrUpdateNhaCungCap")
            {
                String jsonData = context.Request.Form["data"].ToString();
                dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                DataObject.NhaCungCap obj = new DataObject.NhaCungCap();
                obj.ID = Convert.ToInt16(data.ID);
                obj.MaNCC = (String)data.MaNCC;
                obj.TenNCC = (String)data.TenNCC;
                obj.SoDT = (String)data.SoDT;
                obj.Tinh = (String)data.Tinh;
                obj.DiaChi = (String)data.DiaChi;
                obj.LoaiDichVu = (String)data.LoaiDichVu;
                obj.GhiChu = (String)data.GhiChu;
                obj.NgayTao = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                obj.NguoiTao = HttpContext.Current.Session["UserName"].ToString();
                Servies.KhoServices.insertOrUpdateNhaCungCap(obj);
                context.Response.ContentType = "text/plain";
                context.Response.Write("1");
            }
            else if (type == "DeleteNhaCungCap")
            {
                int ID = Convert.ToInt16(context.Request.Form["ID"].ToString());
                Servies.KhoServices.DeleteNhaCungCap(ID);
                context.Response.ContentType = "text/plain";
                context.Response.Write("1");
            }
            else if (type == "viewNhaCungCap")
            {
                //viewNhaCungCap(String MaNCC, String TenNCC, String SoDT, String Tinh, String LoaiDichVu)
                String MaNCC = context.Request.Form["MaNCC"].ToString();
                String TenNCC = context.Request.Form["TenNCC"].ToString();
                String SoDT = context.Request.Form["SoDT"].ToString();
                String Tinh = context.Request.Form["Tinh"].ToString();
                String LoaiDichVu = context.Request.Form["LoaiDichVu"].ToString();
                DataTable dt = Servies.KhoServices.viewNhaCungCap(MaNCC, TenNCC, SoDT, Tinh, LoaiDichVu);
                context.Response.ContentType = "text/plain";
                context.Response.Write("1");
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("1");
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