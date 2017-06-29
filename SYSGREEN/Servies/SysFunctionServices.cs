using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysFunctionServices
    {
        public static void InsertData(DataObject.SysFunction obj)
        {
            String Insert = "INSERT INTO SYS_FUNCTION (Func_Name,Func_Description) VALUES ";
            Insert += "(@Func_Name,@Func_Description)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Func_Name", obj.Func_Name);
            cmd.Parameters.AddWithValue("@Func_Description", obj.Func_Description);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
           
        }

        public static void UpdateData(DataObject.SysFunction obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_FUNCTION SET Func_Name = @Func_Name, Func_Description = @Func_Description Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Func_Name", obj.Func_Name);
            cmd.Parameters.AddWithValue("@Func_Description", obj.Func_Description);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_FUNCTION Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysFunction> GetData(Int32 Id)
        {
            List<DataObject.SysFunction> lstSysFunction = new List<DataObject.SysFunction>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_FUNCTION Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_FUNCTION";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysFunction obj = new DataObject.SysFunction();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Func_Name = oReader["Func_Name"].ToString();
                    obj.Func_Description = oReader["Func_Description"].ToString();
                    lstSysFunction.Add(obj);
                }
            }
            conn.Close();
            return lstSysFunction;
        }
    }
}
