using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysBillMasterVerticalServices
    {
        public static void InsertData(DataObject.SysBillMasterVertical obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER_VERTICAL (BILL_MASTER_ID,DeliveryDate) VALUES ";
            Insert += " (@BILL_MASTER_ID,@DeliveryDate)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@BILL_MASTER_ID", obj.BILL_MASTER_ID);
            cmd.Parameters.AddWithValue("@DeliveryDate", obj.DeliveryDate);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static int InsertDataReturnId(DataObject.SysBillMasterVertical obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER_VERTICAL (BILL_MASTER_ID,DeliveryDate) VALUES ";
            Insert += " (@BILL_MASTER_ID,@DeliveryDate)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@BILL_MASTER_ID", obj.BILL_MASTER_ID);
            cmd.Parameters.AddWithValue("@DeliveryDate", obj.DeliveryDate);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            conn.Open();
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysBillMasterVertical obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_BILL_MASTER_VERTICAL SET BILL_MASTER_ID = @BILL_MASTER_ID, DeliveryDate = @DeliveryDate ";
            Update += " Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@BILL_MASTER_ID", obj.BILL_MASTER_ID);
            cmd.Parameters.AddWithValue("@DeliveryDate", obj.DeliveryDate);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_MASTER_VERTICAL Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysBillMasterVertical> GetData(Int32 Id)
        {
            List<DataObject.SysBillMasterVertical> lstSysBillMasterVertical = new List<DataObject.SysBillMasterVertical>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_MASTER_VERTICAL Where BILL_MASTER_ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_MASTER_VERTICAL";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysBillMasterVertical obj = new DataObject.SysBillMasterVertical();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.BILL_MASTER_ID = Int32.Parse(oReader["BILL_MASTER_ID"].ToString());
                    if (oReader["DeliveryDate"].ToString() != "" && oReader["DeliveryDate"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["DeliveryDate"].ToString());
                        obj.DeliveryDate = DateTime.Parse(createDate);
                    }
                    lstSysBillMasterVertical.Add(obj);
                }
            }
            conn.Close();
            return lstSysBillMasterVertical;
        }
    }
}
