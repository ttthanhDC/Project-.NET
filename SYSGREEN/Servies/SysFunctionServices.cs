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
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Func_Name", obj.Func_Name);
            cmd.Parameters.AddWithValue("@Func_Description", obj.Func_Description);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static void UpdateData(DataObject.SysFunction obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_FUNCTION SET Func_Name = @Func_Name, Func_Description = @Func_Description Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Func_Name", obj.Func_Name);
            cmd.Parameters.AddWithValue("@Func_Description", obj.Func_Description);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_FUNCTION Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysFunction> GetData(Int32 Id)
        {
            List<DataObject.SysFunction> lstSysFunction = new List<DataObject.SysFunction>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_FUNCTION Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_FUNCTION";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
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
            return lstSysFunction;
        }
    }
}
