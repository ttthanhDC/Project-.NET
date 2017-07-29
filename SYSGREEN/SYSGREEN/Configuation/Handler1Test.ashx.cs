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