using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysBillMasterServices
    {
        public static void InsertData(DataObject.SysBillMaster obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER (BillCode,CustomerId,SourceId,TotalAmount,TotalAmountCollected,TotalAmountRemain,Discount,Status,CreateUser,CreateDate) VALUES ";
            Insert += " (@BillCode,@CustomerId,@SourceId,@TotalAmount,@TotalAmountCollected,@TotalAmountRemain,@Discount,@Status,@CreateUser,@CreateDate)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@BillCode", obj.BillCode);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@SourceId", obj.SourceId);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@TotalAmountCollected", obj.TotalAmountCollected);
            cmd.Parameters.AddWithValue("@Discount", obj.Discount);
            cmd.Parameters.AddWithValue("@Status", obj.Status);
            cmd.Parameters.AddWithValue("@CreateUser", obj.CreateUser);
            cmd.Parameters.AddWithValue("@CreateDate", obj.CreateDate);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static int InsertDataReturnId(DataObject.SysBillMaster obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER (BillCode,CustomerId,SourceId,TotalAmount,TotalAmountCollected,TotalAmountRemain,Discount,Status,CreateUser,CreateDate) VALUES ";
            Insert += " (@BillCode,@CustomerId,@SourceId,@TotalAmount,@TotalAmountCollected,@TotalAmountRemain,@Discount,@Status,@CreateUser,@CreateDate)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@BillCode", obj.BillCode);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@SourceId", obj.SourceId);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@TotalAmountCollected", obj.TotalAmountCollected);
            cmd.Parameters.AddWithValue("@Discount", obj.Discount);
            cmd.Parameters.AddWithValue("@Status", obj.Status);
            cmd.Parameters.AddWithValue("@CreateUser", obj.CreateUser);
            cmd.Parameters.AddWithValue("@CreateDate", obj.CreateDate);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            Common.Connection.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysBillMaster obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_BILL_MASTER SET BillCode = @BillCode, CustomerId = @CustomerId, SourceId = @SourceId, ";
            Update += "TotalAmount = @TotalAmount, TotalAmountCollected = @TotalAmountCollected, Discount = @Discount, ";
            Update += "Status = @Status Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@BillCode", obj.BillCode);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@SourceId", obj.SourceId);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@TotalAmountCollected", obj.TotalAmountCollected);
            cmd.Parameters.AddWithValue("@Discount", obj.Discount);
            cmd.Parameters.AddWithValue("@Status", obj.Status);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_MASTER Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysBillMaster> GetData(Int32 Id)
        {
            List<DataObject.SysBillMaster> lstSysBillMaster = new List<DataObject.SysBillMaster>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_MASTER Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_MASTER";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysBillMaster obj = new DataObject.SysBillMaster();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.CustomerId = Int32.Parse(oReader["CustomerId"].ToString());
                    obj.SourceId = Int32.Parse(oReader["SourceId"].ToString());
                    obj.BillCode = oReader["BillCode"].ToString();
                    obj.TotalAmount = float.Parse(oReader["TotalAmount"].ToString());
                    obj.TotalAmountCollected = float.Parse(oReader["TotalAmountCollected"].ToString());
                    obj.TotalAmountRemain = float.Parse(oReader["TotalAmountRemain"].ToString());
                    obj.Discount = float.Parse(oReader["Discount"].ToString());
                    obj.Status = oReader["Status"].ToString();
                    obj.CreateUser = oReader["CreateUser"].ToString();
                    if (oReader["CreateDate"].ToString() != "" && oReader["CreateDate"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["CreateDate"].ToString());
                        obj.CreateDate = DateTime.Parse(createDate);
                    }
                    lstSysBillMaster.Add(obj);
                }
            }
            return lstSysBillMaster;
        }
    }
}
