using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataObject;
using System.Data.SqlClient;
using System.Data;

namespace Servies
{
    public class DeptObjectServices
    {
        public static void InsertData(DataObject.DeptObject obj)
        {
            String Insert = "INSERT INTO SYS_DEPT (Dept_Name,Dept_Description,Create_User,Create_Date) VALUES (@Dept_Name,@Dept_Description,@Create_User,@Create_Date)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Dept_Name", obj.Dept_Name);
            cmd.Parameters.AddWithValue("@Dept_Description", obj.Dept_Description);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdateData(DataObject.DeptObject obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_DEPT SET noidung = @Dept_Name, Dept_Description = @Dept_Description Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Dept_Name", obj.Dept_Name);
            cmd.Parameters.AddWithValue("@Dept_Description", obj.Dept_Description);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_DEPT Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.DeptObject> GetData(Int32 Id)
        {
            List<DataObject.DeptObject> lstDeptObject = new List<DataObject.DeptObject>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_DEPT Where ID = @ID";
               
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_DEPT";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.DeptObject obj = new DataObject.DeptObject();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Dept_Description = oReader["Dept_Description"].ToString();
                    obj.Dept_Name = oReader["Dept_Name"].ToString();
                    obj.Create_User = oReader["Create_User"].ToString();
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstDeptObject.Add(obj);
                }
                
            }
            conn.Close();
            return lstDeptObject;
        }
    }
}
