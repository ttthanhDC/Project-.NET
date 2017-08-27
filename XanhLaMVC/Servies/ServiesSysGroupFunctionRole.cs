using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class ServiesSysGroupFunctionRole
    {
        public static void InsertData(DataObject.SysGroupFunctionRole obj)
        {
            String Insert = "INSERT INTO SYS_GROUP_FUNCTION_ROLE (FUNC_ID,ROLE_ID,IsCreate,IsEdit,IsDelete,IsView) VALUES ";
            Insert += "(@FUNC_ID,@ROLE_ID,@IsCreate,@IsEdit,@IsDelete,@IsView)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@FUNC_ID", obj.FUNC_ID);
            cmd.Parameters.AddWithValue("@ROLE_ID", obj.ROLE_ID);
            cmd.Parameters.AddWithValue("@IsCreate", obj.IsCreate);
            cmd.Parameters.AddWithValue("@IsEdit", obj.IsEdit);
            cmd.Parameters.AddWithValue("@IsDelete", obj.IsDelete);
            cmd.Parameters.AddWithValue("@IsView", obj.IsView);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdateData(DataObject.SysGroupFunctionRole obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_GROUP_FUNCTION_ROLE SET FUNC_ID = @FUNC_ID, ROLE_ID = @ROLE_ID,IsCreate = @IsCreate,";
            Update += "IsEdit = @IsEdit, IsDelete = @IsDelete, IsView = @IsView Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@FUNC_ID", obj.FUNC_ID);
            cmd.Parameters.AddWithValue("@ROLE_ID", obj.ROLE_ID);
            cmd.Parameters.AddWithValue("@IsCreate", obj.IsCreate);
            cmd.Parameters.AddWithValue("@IsEdit", obj.IsEdit);
            cmd.Parameters.AddWithValue("@IsDelete", obj.IsDelete);
            cmd.Parameters.AddWithValue("@IsView", obj.IsView);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_GROUP_FUNCTION_ROLE Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysGroupFunctionRole> GetData(Int32 Id)
        {
            List<DataObject.SysGroupFunctionRole> lstSysGroupFunctionRole = new List<DataObject.SysGroupFunctionRole>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_GROUP_FUNCTION_ROLE Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_GROUP_FUNCTION_ROLE";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysGroupFunctionRole obj = new DataObject.SysGroupFunctionRole();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.FUNC_ID = Int32.Parse(oReader["FUNC_ID"].ToString());
                    obj.ROLE_ID = Int32.Parse(oReader["ROLE_ID"].ToString());
                    obj.IsCreate = (Boolean)(oReader["IsCreate"]);
                    obj.IsEdit = (Boolean)(oReader["IsEdit"]);
                    obj.IsDelete = (Boolean)(oReader["IsDelete"]);
                    obj.IsView = (Boolean)(oReader["IsView"]);
                    lstSysGroupFunctionRole.Add(obj);
                }
            }
            conn.Close();
            return lstSysGroupFunctionRole;
        }
    }
}
