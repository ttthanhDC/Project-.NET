using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysSourceServices
    {
        public static void InsertData(DataObject.SysSource obj)
        {
            String Insert = "INSERT INTO SYS_SOURCE (Source_Name,Create_User,Create_Date) VALUES (@Source_Name,@Create_User,@Create_Date)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Source_Name", obj.Source_Name);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdateData(DataObject.SysSource obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_SOURCE SET Source_Name = @Source_Name Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Source_Name", obj.Source_Name);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_SOURCE Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysSource> GetData(Int32 Id)
        {
            List<DataObject.SysSource> lstSysSource = new List<DataObject.SysSource>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_SOURCE Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_SOURCE";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysSource obj = new DataObject.SysSource();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Source_Name = oReader["Source_Name"].ToString();
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysSource.Add(obj);
                }

            }
            conn.Close();
            return lstSysSource;
        }
    }
}
