using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysOrgServies
    {
        public static void InsertData(DataObject.SysOrg obj)
        {
            String Insert = "INSERT INTO SYS_ORG (Name,Description,Create_User,Create_Date) VALUES ";
            Insert += "(@Name,@Description,@Create_User,@Create_Date)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Name", obj.Name);
            cmd.Parameters.AddWithValue("@Description", obj.Description);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static void UpdateData(DataObject.SysOrg obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_ORG SET Name = @Name, Description = @Description Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Name", obj.Name);
            cmd.Parameters.AddWithValue("@Description", obj.Description);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_ORG Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Id", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysOrg> GetData(Int32 Id)
        {
            List<DataObject.SysOrg> lstSysOrg = new List<DataObject.SysOrg>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_ORG Where ID = @ID";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_ORG";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysOrg obj = new DataObject.SysOrg();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Name = oReader["Name"].ToString();
                    obj.Description = oReader["Description"].ToString();
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysOrg.Add(obj);
                }
            }
            return lstSysOrg;
        }
    }
}
