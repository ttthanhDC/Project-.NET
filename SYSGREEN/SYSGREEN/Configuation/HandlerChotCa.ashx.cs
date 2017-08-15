using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerChotCa
    /// </summary>
    public class HandlerChotCa : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.DeptObject obj = new JavaScriptSerializer().Deserialize<DataObject.DeptObject>(jsonData);
            if (type == "InsertChotCaReturnId")
            {
                try
                {
                    //String NgayChot = context.Request.Form["NgayChot"].ToString();
                    //DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    String TienThuDuoc = context.Request.Form["TienThuDuoc"].ToString();
                    DataObject.ChotCa chotca = new DataObject.ChotCa();
                    chotca.TienThuDuoc = TienThuDuoc != "" ? Convert.ToDecimal(TienThuDuoc) : 0;
                    chotca.NgayChot = DateTime.ParseExact(DateTime.Now.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    chotca.NguoiChot = HttpContext.Current.Session["UserName"].ToString();
                    chotca.GioChot = DateTime.Now.Hour + "/" + DateTime.Now.Minute + "/" + DateTime.Now.Second;
                    int result = Servies.ChotCaServices.InsertChotCaReturnId(chotca,DateTime.Now.ToString("dd/MM/yyyy"));
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }

            }
            else if (type == "ViewChotCa")
            {
                try
                {
                    String NguoiChot = context.Request.Form["NguoiChot"].ToString();
                    String NgayChot = context.Request.Form["NgayChot"].ToString();
                    DataTable dt = Servies.ChotCaServices.ViewChotCa(NguoiChot, NgayChot);
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