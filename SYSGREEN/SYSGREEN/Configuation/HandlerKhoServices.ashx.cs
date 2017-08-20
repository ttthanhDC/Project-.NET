using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerKhoServices
    /// </summary>
    public class HandlerKhoServices : IHttpHandler
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