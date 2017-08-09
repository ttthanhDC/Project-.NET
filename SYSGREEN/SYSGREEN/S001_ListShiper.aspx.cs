using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SYSGREEN
{
    public partial class S001_ListShiper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //String NgayHD = context.Request.Form["NgayHD"].ToString();
            DataTable table = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("PGetStepV3", conn);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@NgayHD", "08/08/2017");
            DataSet ds = new DataSet();
            sda.Fill(ds, "vHoaDonStep3");
            conn.Close();
            CrystalDecisions.CrystalReports.Engine.ReportDocument rpt = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
            rpt.Load(System.Web.HttpContext.Current.Server.MapPath("~/hoaDon.rpt"));
            rpt.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rpt;
            CrystalReportViewer1.Visible = true;
            CrystalReportViewer1.RefreshReport();
        }
    }
}