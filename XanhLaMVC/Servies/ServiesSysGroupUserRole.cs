using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class ServiesSysGroupUserRole
    {
        public static void InsertData(DataObject.SysGroupUserRole obj)
        {
            String Insert = "INSERT INTO SYS_GROUP_USER_ROLE (ROLE_ID,USER_ID) VALUES ";
            Insert += "(@ROLE_ID,@USER_ID)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@RoleName", obj.ROLE_ID);
            cmd.Parameters.AddWithValue("@Create_User", obj.USER_ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdateData(DataObject.SysGroupUserRole obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_GROUP_USER_ROLE SET ROLE_ID = @ROLE_ID, @USER_ID = USER_ID Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ROLE_ID", obj.ROLE_ID);
            cmd.Parameters.AddWithValue("@USER_ID", obj.USER_ID);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_GROUP_USER_ROLE Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysGroupUserRole> GetData(Int32 Id)
        {
            List<DataObject.SysGroupUserRole> lstSysGroupUserRole = new List<DataObject.SysGroupUserRole>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_GROUP_USER_ROLE Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_GROUP_USER_ROLE";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysGroupUserRole obj = new DataObject.SysGroupUserRole();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.ROLE_ID = Int32.Parse(oReader["ROLE_ID"].ToString());
                    obj.USER_ID = Int32.Parse(oReader["USER_ID"].ToString());
                    lstSysGroupUserRole.Add(obj);
                }
            }
            conn.Close();
            return lstSysGroupUserRole;
        }
    }
}
