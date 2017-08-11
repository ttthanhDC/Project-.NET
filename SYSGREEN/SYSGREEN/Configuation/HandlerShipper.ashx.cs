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
    /// Summary description for HandlerShipper
    /// </summary>
    public class HandlerShipper : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                String type = context.Request.Form["type"].ToString();
                
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
                    context.Response.Write(idLotrinh);

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
                    DataTable lst = Servies.ShipperServices.ViewLoTrinhShipper(NgayLotrinh,MaLoTrinh,ShipName,ShipNumber,TrangThai);
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