using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;  
namespace SYSGREEN
{
    public partial class wfTestRP : System.Web.UI.Page
    {
        //ReportDocument rprt = new ReportDocument();  
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            rprt.Load(Server.MapPath("~/CrystalReport2.rpt"));

            SqlConnection con = new SqlConnection(@"Data Source=(local);Initial Catalog=DB_SYS_GREEN;Persist Security Info=True;User ID=sa;Password=123456");
            SqlCommand cmd = new SqlCommand("PTest", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds, "Test");
            rprt.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rprt;  */
        }
    }
}