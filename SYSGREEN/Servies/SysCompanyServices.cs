using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysCompanyServices
    {
        public static void InsertData(DataObject.SysCompany obj)
        {
            String Insert = "INSERT INTO SYS_COMPANY (Company_Name_EN,Company_Name_Short,Company_Name_Vi,Tax_Code,Bank_Account,Amount_Freeship,Logo,Email,Phone_Number) ";
            Insert += " VALUES (@Company_Name_EN,@Company_Name_Short,@Company_Name_Vi,@Tax_Code,@Bank_Account,@Amount_Freeship,@Logo,@Email,@Phone_Number)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Company_Name_EN", obj.Company_Name_EN);
            cmd.Parameters.AddWithValue("@Company_Name_Short", obj.Company_Name_Short);
            cmd.Parameters.AddWithValue("@Company_Name_Vi", obj.Company_Name_Vi);
            cmd.Parameters.AddWithValue("@Tax_Code", obj.Tax_Code);
            cmd.Parameters.AddWithValue("@Bank_Account", obj.Bank_Account);
            cmd.Parameters.AddWithValue("@Amount_Freeship", obj.Amount_Freeship);
            cmd.Parameters.AddWithValue("@Logo", obj.Logo);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@Phone_Number", obj.Phone_Number);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static void UpdateData(DataObject.SysCompany obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_COMPANY SET Company_Name_EN = @Company_Name_EN, Company_Name_Short = @Company_Name_Short, Company_Name_Vi =@Company_Name_Vi ";
            Update += "Tax_Code = @Tax_Code, Bank_Account = @Bank_Account ,Amount_Freeship = @Amount_Freeship,Logo = @Logo, Email =@Email, Phone_Number = @Phone_Number Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@Company_Name_EN", obj.Company_Name_EN);
            cmd.Parameters.AddWithValue("@Company_Name_Short", obj.Company_Name_Short);
            cmd.Parameters.AddWithValue("@Company_Name_Vi", obj.Company_Name_Vi);
            cmd.Parameters.AddWithValue("@Tax_Code", obj.Tax_Code);
            cmd.Parameters.AddWithValue("@Bank_Account", obj.Bank_Account);
            cmd.Parameters.AddWithValue("@Amount_Freeship", obj.Amount_Freeship);
            cmd.Parameters.AddWithValue("@Logo", obj.Logo);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@Phone_Number", obj.Phone_Number);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_COMPANY Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysCompany> GetData(Int32 Id)
        {
            List<DataObject.SysCompany> lstSysCompany = new List<DataObject.SysCompany>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_COMPANY Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_COMPANY";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysCompany obj = new DataObject.SysCompany();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Company_Name_EN = oReader["Company_Name_EN"].ToString();
                    obj.Company_Name_Short = oReader["Company_Name_Short"].ToString();
                    obj.Company_Name_Vi = oReader["Company_Name_Vi"].ToString();
                    obj.Tax_Code = oReader["Tax_Code"].ToString();
                    obj.Bank_Account = oReader["Bank_Account"].ToString();
                    obj.Amount_Freeship = float.Parse(oReader["Amount_Freeship"].ToString());
                    obj.Logo = oReader["Logo"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.Phone_Number = oReader["Phone_Number"].ToString();
                    lstSysCompany.Add(obj);
                }
            }
            return lstSysCompany;
        }
    }
}
