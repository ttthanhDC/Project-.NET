using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysCustomerServices
    {
        public static void InsertData(DataObject.SysCustomer obj)
        {
            String Insert = "INSERT INTO SYS_CUSTOMER (CustomerName,PhoneNumber,Email,BirthDay,Address) VALUES (@CustomerName,@PhoneNumber,@Email,@BirthDay,@Address)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@CustomerName", obj.CustomerName);
            cmd.Parameters.AddWithValue("@PhoneNumber", obj.PhoneNumber);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@BirthDay", obj.BirthDay);
            cmd.Parameters.AddWithValue("@Address", obj.Address);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static int InsertDataReturnId(DataObject.SysCustomer obj)
        {
            String Insert = "INSERT INTO SYS_CUSTOMER (CustomerName,PhoneNumber,Email,BirthDay,Address) VALUES (@CustomerName,@PhoneNumber,@Email,@BirthDay,@Address)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@CustomerName", obj.CustomerName);
            cmd.Parameters.AddWithValue("@PhoneNumber", obj.PhoneNumber);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@BirthDay", obj.BirthDay);
            cmd.Parameters.AddWithValue("@Address", obj.Address);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            cmd.CommandText = "SELECT scope_identity()";
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            Common.Connection.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysCustomer obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_CUSTOMER SET CustomerName = @CustomerName, PhoneNumber = @PhoneNumber, Email = @Email, BirthDay = @BirthDay, Address = @Address Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@CustomerName", obj.CustomerName);
            cmd.Parameters.AddWithValue("@PhoneNumber", obj.PhoneNumber);
            cmd.Parameters.AddWithValue("@Email", obj.Email);
            cmd.Parameters.AddWithValue("@BirthDay", obj.BirthDay);
            cmd.Parameters.AddWithValue("@Address", obj.Address);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_CUSTOMER Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysCustomer> GetDataByPhoneNumber(string phoneNumber)
        {
            List<DataObject.SysCustomer> lstSysCustomer = new List<DataObject.SysCustomer>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (phoneNumber != null && phoneNumber != "")
            {
                Select = "Select * from SYS_CUSTOMER Where PhoneNumber = @PhoneNumber";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysCustomer obj = new DataObject.SysCustomer();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.CustomerName = oReader["CustomerName"].ToString();
                    obj.PhoneNumber = oReader["PhoneNumber"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.Address = oReader["Address"].ToString();
                    if (oReader["BirthDay"].ToString() != "" && oReader["BirthDay"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["BirthDay"].ToString());
                        obj.BirthDay = DateTime.Parse(createDate);
                    }
                    lstSysCustomer.Add(obj);
                }
            }
            return lstSysCustomer;
        }

        public static List<DataObject.SysCustomer> GetData(Int32 Id)
        {
            List<DataObject.SysCustomer> lstSysCustomer = new List<DataObject.SysCustomer>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_CUSTOMER Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_CUSTOMER";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysCustomer obj = new DataObject.SysCustomer();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.CustomerName = oReader["CustomerName"].ToString();
                    obj.PhoneNumber = oReader["PhoneNumber"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.Address = oReader["Address"].ToString();
                    if (oReader["BirthDay"].ToString() != "" && oReader["BirthDay"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["BirthDay"].ToString());
                        obj.BirthDay = DateTime.Parse(createDate);
                    }
                    lstSysCustomer.Add(obj);
                }
            }
            return lstSysCustomer;
        }
    }
}
