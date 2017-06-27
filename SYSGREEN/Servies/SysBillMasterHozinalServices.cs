using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysBillMasterHozinalServices
    {
        public static void InsertData(DataObject.SysBillMasterHozinal obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER_HOZINAL (BILL_MASTER_ID) VALUES ";
            Insert += " (@BILL_MASTER_ID)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@BILL_MASTER_ID", obj.BILL_MASTER_ID);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static int InsertDataReturnId(DataObject.SysBillMasterHozinal obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER_HOZINAL (BILL_MASTER_ID) VALUES ";
            Insert += " (@BILL_MASTER_ID)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@BILL_MASTER_ID", obj.BILL_MASTER_ID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            Common.Connection.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysBillMasterHozinal obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_BILL_MASTER_HOZINAL SET BILL_MASTER_ID = @BILL_MASTER_ID ";
            Update += " Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@BILL_MASTER_ID", obj.BILL_MASTER_ID);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_MASTER_HOZINAL Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysBillMasterHozinal> GetData(Int32 Id)
        {
            List<DataObject.SysBillMasterHozinal> lstSysBillMasterHozinal = new List<DataObject.SysBillMasterHozinal>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_MASTER_HOZINAL Where BILL_MASTER_ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_MASTER_HOZINAL";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysBillMasterHozinal obj = new DataObject.SysBillMasterHozinal();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.BILL_MASTER_ID = Int32.Parse(oReader["BILL_MASTER_ID"].ToString());
                    lstSysBillMasterHozinal.Add(obj);
                }
            }
            return lstSysBillMasterHozinal;
        }
    }
}
