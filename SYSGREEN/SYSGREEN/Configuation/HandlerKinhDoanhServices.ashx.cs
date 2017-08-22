using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerKinhDoanhServices
    /// </summary>
    public class HandlerKinhDoanhServices : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            if (type == "getvKD001")
            {
                try
                {
                    String MaKH = context.Request.Form["MaKH"].ToString();
                    String HoTen = context.Request.Form["HoTen"].ToString();
                    String SoDT = context.Request.Form["SoDT"].ToString();
                    String Quan = context.Request.Form["Quan"].ToString();
                    String Email = context.Request.Form["Email"].ToString();
                    DataTable lst = Servies.KinhDoanhSV.getvKD001(MaKH, HoTen, SoDT, Email, Quan);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }

            }
            else if (type == "getvDetailKD001")
            {
                try
                {
                    String IdKH = context.Request.Form["IdKH"].ToString();
                    List<DataTable> dt = Servies.KinhDoanhSV.getvDetailKD001(IdKH);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getvDetailKD003")
            {
                try
                {
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.KinhDoanhSV.getvDetailKD003(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                catch (Exception e)
                {
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
    }
}