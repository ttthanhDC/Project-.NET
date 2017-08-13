using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerBaoCao
    /// </summary>
    public class HandlerBaoCao : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                String type = context.Request.Form["type"].ToString();

                if (type == "getvBaoCao01")
                {
                    //getvBaoCao01(String NgayTao)
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.BaocaoServices.getvBaoCao01(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "getvBaoCao02")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String Ngay = context.Request.Form["Ngay"].ToString();
                    DataTable dt = Servies.BaocaoServices.getvBaoCao02(Ngay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "getvBaoCao03")
                {
                    //getvBaoCao03(String tuNgay, String denNgay, Int16 LoaiDon)
                    String jsonData = context.Request.Form["data"].ToString();
                    String tuNgay = context.Request.Form["tuNgay"].ToString();
                    String denNgay = context.Request.Form["denNgay"].ToString();
                    String strLoaiDon = context.Request.Form["LoaiDon"].ToString();
                    Int16 loaiDon = -1;
                    if(strLoaiDon != null && strLoaiDon != ""){
                        loaiDon = Convert.ToInt16(strLoaiDon);
                    }
                    List<DataObject.BaoCao03> dt = Servies.BaocaoServices.getvBaoCao03(tuNgay, denNgay, loaiDon);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "getvBaoCao04")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String tuNgay = context.Request.Form["tuNgay"].ToString();
                    String denNgay = context.Request.Form["denNgay"].ToString();
                    List<DataObject.BaoCao04> dt = Servies.BaocaoServices.getvBaoCao04(tuNgay, denNgay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
                }
                if (type == "getvBaoCao05")
                {
                    String jsonData = context.Request.Form["data"].ToString();
                    String tuNgay = context.Request.Form["tuNgay"].ToString();
                    String denNgay = context.Request.Form["denNgay"].ToString();
                    String shipperName = context.Request.Form["shipperName"].ToString();
                    List<DataObject.BaoCao05> dt = Servies.BaocaoServices.getvBaoCao05(shipperName, tuNgay, denNgay);
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(dt));
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