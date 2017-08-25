using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysUserServies
    {
        public static void InsertData(DataObject.SysUser obj)
        {
            String Insert = "INSERT INTO SYS_USER (UserName,Password,Email,DeptId,OrgId,Create_User,Create_Date) VALUES ";
            Insert += "(@UserName,@Password,@Email,@DeptId,@OrgId,@Create_User,@Create_Date)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@UserName", obj.UserName);
            cmd.Parameters.AddWithValue("@Password", obj.Password);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@DeptId", obj.DeptId);
            cmd.Parameters.AddWithValue("@OrgId", obj.OrgId);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdateData(DataObject.SysUser obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_USER SET Password = @Password, Email = @Email, DeptId = @DeptId, OrgId = @OrgId Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Password", obj.Password);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@DeptId", obj.DeptId);
            cmd.Parameters.AddWithValue("@OrgId", obj.OrgId);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdatePasswordByEmail(String Email,String Password)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_USER SET Password = @Password Where Email = @Email";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@Email", Email);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_USER Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable CheckLogin(String UserName,String Password)
        {
            DataTable dt = new DataTable();
            String Select = "Select *  from  SYS_USER Where UserName = @UserName And Password =@Password";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@Password", Password);
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }
        public static List<DataObject.SysUser> GetDataEmail(string email)
        {
            List<DataObject.SysUser> lstSysUser = new List<DataObject.SysUser>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (email != "")
            {
                Select = "Select * from SYS_USER Where Email = @Email";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Email", email);
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysUser obj = new DataObject.SysUser();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.UserName = oReader["UserName"].ToString();
                    obj.Password = oReader["Password"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.DeptId = Int32.Parse(oReader["DeptId"].ToString());
                    obj.OrgId = Int32.Parse(oReader["OrgId"].ToString());
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysUser.Add(obj);
                }
            }
            conn.Close();
            return lstSysUser;
        }

        public static List<DataObject.SysUser> GetDataByUserName(string userName)
        {
            List<DataObject.SysUser> lstSysUser = new List<DataObject.SysUser>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (userName != "")
            {
                Select = "Select * from SYS_USER Where UserName = @UserName";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@UserName", userName);
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysUser obj = new DataObject.SysUser();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.UserName = oReader["UserName"].ToString();
                    obj.Password = oReader["Password"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.DeptId = Int32.Parse(oReader["DeptId"].ToString());
                    obj.OrgId = Int32.Parse(oReader["OrgId"].ToString());
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysUser.Add(obj);
                }
            }
            conn.Close();
            return lstSysUser;
        }
        public static List<DataObject.ViewSysUser> GetData(Int32 Id)
        {
            List<DataObject.ViewSysUser> lstSysUser = new List<DataObject.ViewSysUser>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from vSysUser Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from vSysUser";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.ViewSysUser obj = new DataObject.ViewSysUser();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.UserName = oReader["UserName"].ToString();
                    obj.Password = oReader["Password"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.DeptName = oReader["NAME_DEPT"].ToString();
                    obj.OrgName = oReader["NAME_ORG"].ToString();
                    obj.DeptId = Int32.Parse(oReader["DeptId"].ToString());
                    obj.OrgId = Int32.Parse(oReader["OrgId"].ToString());
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysUser.Add(obj);
                }
            }
            conn.Close();
            return lstSysUser;
        }
    }
}
