using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for Handler1Test
    /// </summary>
    public class Handler1Test : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            //String jsonData = context.Request.Form["data"].ToString();
            if (type == "getALLData")
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
            } else if (type == "getDataFilter")
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
            else if (type == "getAllShiper")
            {
                try
                {

                    DataTable lst = Servies.HoaDonServices.getAllShiper();
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }

            else if (type == "assignHoaDonToShiper")
            {
                try
                {
                    String jsonData = context.Request.Form["data"].ToString();

                    String shiper = "";
                    String user = "";
                    int? shiperId = null;
                    int? userId = null;                  
                    dynamic data = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonData);
                    dynamic listNgayHoaDonJson = data.listNgayHoaDon;

                    shiper = data.shiper;
                    user = data.user;

                    if (shiper != null && shiper != "")
                    {
                        shiperId = Int32.Parse(shiper);
                    }

                    if (user != null && user != "")
                    {
                        userId = Int32.Parse(user);
                    }

                    if (listNgayHoaDonJson != null && listNgayHoaDonJson.count)
                    {
                        for (int i = 0; i < listNgayHoaDonJson.Count; i++)
                        {
                            Servies.HoaDonServices.updateNgayHoaDonToShiper(listNgayHoaDonJson[i], shiperId, userId);
                        }
                    }
                    
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject("update successful"));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
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