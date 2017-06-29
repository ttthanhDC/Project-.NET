using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysBillDetailHozinalServices
    {
        public static void InsertData(DataObject.SysBillDetailHozinal obj)
        {
            String Insert = "INSERT INTO SYS_BILL_DETAIL_HOZINAL (HozinalMasterBillId,CustomerId) VALUES ";
            Insert += " (@HozinalMasterBillId,@CustomerId)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@HozinalMasterBillId", obj.HozinalMasterBillId);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static int InsertDataReturnId(DataObject.SysBillDetailHozinal obj)
        {
            String Insert = "INSERT INTO SYS_BILL_DETAIL_HOZINAL (HozinalMasterBillId,CustomerId) VALUES ";
            Insert += " (@HozinalMasterBillId,@CustomerId)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@HozinalMasterBillId", obj.HozinalMasterBillId);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            conn.Open();
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysBillDetailHozinal obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_BILL_DETAIL_HOZINAL SET HozinalMasterBillId = @HozinalMasterBillId, CustomerId = @CustomerId ";
            Update += " Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@HozinalMasterBillId", obj.HozinalMasterBillId);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_DETAIL_HOZINAL Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysBillDetailHozinal> GetData(Int32 Id)
        {
            List<DataObject.SysBillDetailHozinal> lstSysBillDetailHozinal = new List<DataObject.SysBillDetailHozinal>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_DETAIL_HOZINAL Where HozinalMasterBillId = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_DETAIL_HOZINAL";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysBillDetailHozinal obj = new DataObject.SysBillDetailHozinal();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.HozinalMasterBillId = Int32.Parse(oReader["HozinalMasterBillId"].ToString());
                    obj.CustomerId = Int32.Parse(oReader["CustomerId"].ToString());

                    lstSysBillDetailHozinal.Add(obj);
                }
            }
            conn.Close();
            return lstSysBillDetailHozinal;
        }
    }
}
