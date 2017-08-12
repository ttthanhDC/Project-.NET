using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SYSGREEN
{
    public partial class loginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Convert.ToString(Request.Form["__EVENTARGUMENT"]) == "Button1_Click")
                {
                    //submit action here
                    Button1_Click(sender,e);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String userName = Request.Form["txtUserName"];
            String Password = Request.Form["txtPassword"];
            if (userName == "" || userName == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                "Thông báo",
                "alert('Notification : Bạn chưa nhập tên đăng nhập!');",
                true);
                return;
            }
            if (Password == "" || Password == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                "Thông báo",
                "alert('Notification : Bạn chưa nhập mật khẩu!');",
                true);
                return;
            }
            DataTable dt = Servies.SysUserServies.CheckLogin(userName, Password);
            if (dt.Rows.Count > 0)
            {
                HttpContext.Current.Session["UserName"] = userName;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                "Thông báo",
                "alert('Notification : Đăng nhập thành công, Hệ thống sẽ chuyển sang trang quản trị!');window.location ='/Main.aspx';",
                true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
               "Thông báo",
               "alert('Notification : Sai Tên đăng nhập hoặc mật khẩu!');",
               true);
            }
        }
    }
}