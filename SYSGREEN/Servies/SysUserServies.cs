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
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@UserName", obj.UserName);
            cmd.Parameters.AddWithValue("@Password", obj.Password);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@DeptId", obj.DeptId);
            cmd.Parameters.AddWithValue("@OrgId", obj.OrgId);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static void UpdateData(DataObject.SysUser obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_USER SET Password = @Password, Email = @Email, DeptId = @DeptId, OrgId = @OrgId Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Password", obj.Password);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@DeptId", obj.DeptId);
            cmd.Parameters.AddWithValue("@OrgId", obj.OrgId);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_USER Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }
        public static List<DataObject.SysUser> GetDataEmail(string email)
        {
            List<DataObject.SysUser> lstSysUser = new List<DataObject.SysUser>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (email != "")
            {
                Select = "Select * from SYS_USER Where Email = @Email";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@Email", email);
            }
            
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
            return lstSysUser;
        }

        public static List<DataObject.SysUser> GetDataByUserName(string userName)
        {
            List<DataObject.SysUser> lstSysUser = new List<DataObject.SysUser>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (userName != "")
            {
                Select = "Select * from SYS_USER Where UserName = @UserName";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@UserName", userName);
            }

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
            return lstSysUser;
        }
        public static List<DataObject.SysUser> GetData(Int32 Id)
        {
            List<DataObject.SysUser> lstSysUser = new List<DataObject.SysUser>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_USER Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_USER";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
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
            return lstSysUser;
        }
    }
}
