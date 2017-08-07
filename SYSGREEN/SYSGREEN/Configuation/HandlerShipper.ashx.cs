using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
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
                String jsonData = context.Request.Form["data"].ToString();
                if (type == "InsertLoTrinhShipperReturnId")
                {
                    DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                    String MaLoTrinh = DateTime.Now.ToString("dd/MM/yyyy") + "-" + DateTime.Now.ToString("tt");
                    obj.MaLoTrinh = MaLoTrinh;
                    obj.NguoiTao = "ThanhDC7";
                    obj.NgayTao = DateTime.Now;
                    obj.TrangThai = "";
                    int idLotrinh = Servies.ShipperServices.InsertLoTrinhShipperReturnId(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(idLotrinh);

                }
                else if (type == "UpdateLoTrinhShipper")
                {
                    String ID = context.Request.Form["ID"].ToString();
                    String ShipID = context.Request.Form["ShipID"].ToString();
                    String TrangThai = context.Request.Form["TrangThai"].ToString();
                    DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                    obj.ID = Convert.ToInt32(ID);
                    obj.ShipID = Convert.ToInt32(ShipID);
                    obj.TrangThai = TrangThai;
                    Servies.ShipperServices.UpdateLoTrinhShipper(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("1");

                }
                else if (type == "ViewLoTrinhShipper")
                {
                    
                    String NgayLotrinh = context.Request.Form["NgayLotrinh"].ToString();
                    String MaLoTrinh = context.Request.Form["MaLoTrinh"].ToString();
                    String ShipName = context.Request.Form["ShipName"].ToString();
                    String ShipNumber = context.Request.Form["ShipNumber"].ToString();
                    String TrangThai = context.Request.Form["TrangThai"].ToString();
                    DataTable lst = Servies.ShipperServices.ViewLoTrinhShipper(NgayLotrinh,MaLoTrinh,ShipName,ShipNumber,TrangThai);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
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