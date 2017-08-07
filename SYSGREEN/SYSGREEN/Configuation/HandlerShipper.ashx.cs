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
                
                if (type == "InsertLoTrinhShipperReturnId")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                    String MaLoTrinh = DateTime.Now.ToString("ddMMyyyy") + "-" + DateTime.Now.ToString("tt");
                    obj.MaLoTrinh = MaLoTrinh;
                    obj.NguoiTao = "";
                    obj.NgayTao = DateTime.Now;
                    obj.TrangThai = "";
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
                    if (listIdLoTrinh.Count > 0)
                    {
                        for (int i = 0; i < listIdLoTrinh.Count; i++)
                        {
                            DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                            String ID = (String)listIdLoTrinh[i]; 
                            obj.ID = Convert.ToInt32(ID);
                            String TrangThai = (String)listStatus[i];
                            obj.TrangThai = TrangThai;
                            Servies.ShipperServices.UpdateLoTrinhShipper(obj);
                        }
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("1");
                    }
                    else
                    {
                        context.Response.ContentType = "text/plain";
                        context.Response.Write("0");
                    }

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