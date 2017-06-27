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
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@HozinalMasterBillId", obj.HozinalMasterBillId);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static int InsertDataReturnId(DataObject.SysBillDetailHozinal obj)
        {
            String Insert = "INSERT INTO SYS_BILL_DETAIL_HOZINAL (HozinalMasterBillId,CustomerId) VALUES ";
            Insert += " (@HozinalMasterBillId,@CustomerId)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@HozinalMasterBillId", obj.HozinalMasterBillId);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            Common.Connection.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysBillDetailHozinal obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_BILL_DETAIL_HOZINAL SET HozinalMasterBillId = @HozinalMasterBillId, CustomerId = @CustomerId ";
            Update += " Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@HozinalMasterBillId", obj.HozinalMasterBillId);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_DETAIL_HOZINAL Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysBillDetailHozinal> GetData(Int32 Id)
        {
            List<DataObject.SysBillDetailHozinal> lstSysBillDetailHozinal = new List<DataObject.SysBillDetailHozinal>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_DETAIL_HOZINAL Where HozinalMasterBillId = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_DETAIL_HOZINAL";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
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
            return lstSysBillDetailHozinal;
        }
    }
}
