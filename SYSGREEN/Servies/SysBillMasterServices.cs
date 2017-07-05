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
            String Insert = "INSERT INTO SYS_BILL_MASTER (BillCode,CustomerId,SourceId,TotalAmount,TotalAmountCollected,TotalAmountRemain,Discount,Status,CreateUser,CreateDate,DateTotal) VALUES ";
            Insert += " (@BillCode,@CustomerId,@SourceId,@TotalAmount,@TotalAmountCollected,@TotalAmountRemain,@Discount,@Status,@CreateUser,@CreateDate,@DateTotal)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@BillCode", obj.BillCode);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@SourceId", obj.SourceId);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@TotalAmountCollected", obj.TotalAmountCollected);
            cmd.Parameters.AddWithValue("@Discount", obj.Discount);
            cmd.Parameters.AddWithValue("@Status", obj.Status);
            cmd.Parameters.AddWithValue("@CreateUser", obj.CreateUser);
            cmd.Parameters.AddWithValue("@CreateDate", obj.CreateDate);
            cmd.Parameters.AddWithValue("@DateTotal", obj.DateTotal);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static int InsertDataReturnId(DataObject.SysBillMaster obj)
        {
            String Insert = "INSERT INTO SYS_BILL_MASTER (BillCode,CustomerId,SourceId,TotalAmount,TotalAmountCollected,TotalAmountRemain,Discount,Status,CreateUser,CreateDate,DateTotal) VALUES ";
            Insert += " (@BillCode,@CustomerId,@SourceId,@TotalAmount,@TotalAmountCollected,@TotalAmountRemain,@Discount,@Status,@CreateUser,@CreateDate,@DateTotal)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@BillCode", obj.BillCode);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@SourceId", obj.SourceId);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@TotalAmountRemain", obj.TotalAmountRemain);
            cmd.Parameters.AddWithValue("@TotalAmountCollected", obj.TotalAmountCollected);
            cmd.Parameters.AddWithValue("@Discount", obj.Discount);
            cmd.Parameters.AddWithValue("@Status", obj.Status);
            cmd.Parameters.AddWithValue("@CreateUser", obj.CreateUser);
            cmd.Parameters.AddWithValue("@CreateDate", obj.CreateDate);
            cmd.Parameters.AddWithValue("@DateTotal", obj.DateTotal);
            conn.Open();
            cmd.ExecuteNonQuery();
            //cmd.CommandText = "SELECT scope_identity()";
            //int identity = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return 1;
        }

        public static int InsertDataBillGridMasterReturnId(DataObject.BillGridMasterDB obj)
        {
            String Insert = "INSERT INTO BillGridMasterDB (Master,billType,billTypeId,OrderType,OrderTypeId,OrderType2Id,dateShip,discount,monny,payType,payTypeId,stt,billId,customerId) VALUES ";
            Insert += " (@Master,@billType,@billTypeId,@OrderType,@OrderTypeId,@OrderType2Id,@dateShip,@discount,@monny,@payType,@payTypeId,@stt,@billId,@customerId)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Master", obj.Master);
            cmd.Parameters.AddWithValue("@billType", obj.billType);
            cmd.Parameters.AddWithValue("@billTypeId", obj.billTypeId);
            cmd.Parameters.AddWithValue("@OrderType", obj.OrderType);
            cmd.Parameters.AddWithValue("@OrderTypeId", obj.OrderTypeId);
            cmd.Parameters.AddWithValue("@OrderType2Id", obj.OrderType2Id);
            cmd.Parameters.AddWithValue("@dateShip", obj.dateShip);
            cmd.Parameters.AddWithValue("@discount", obj.discount);
            cmd.Parameters.AddWithValue("@monny", obj.monny);
            cmd.Parameters.AddWithValue("@payType", obj.payType);
            cmd.Parameters.AddWithValue("@payTypeId", obj.payTypeId);
            cmd.Parameters.AddWithValue("@stt", obj.stt);
            cmd.Parameters.AddWithValue("@billId", obj.billId);
            cmd.Parameters.AddWithValue("@customerId", obj.customerId);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return identity;
        }

        public static int InsertDataDetailMasterGridReturnId(DataObject.DetailMasterGrid obj)
        {
            String Insert = "INSERT INTO DetailMasterGrid (parent,parentBillId,parentId,deliveryDate,product,sugar,quantity,price,money,promotionCode,total,test,operate) VALUES ";
            Insert += " (@parent,@parentBillId,@parentId,@deliveryDate,@product,@sugar,@quantity,@price,@money,@promotionCode,@total,@test,@operate)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@parent", obj.parent);
            cmd.Parameters.AddWithValue("@parentBillId", obj.parentBillId);
            cmd.Parameters.AddWithValue("@deliveryDate", obj.deliveryDate);
            cmd.Parameters.AddWithValue("@product", obj.product);
            cmd.Parameters.AddWithValue("@sugar", obj.sugar);
            cmd.Parameters.AddWithValue("@quantity", obj.quantity);
            cmd.Parameters.AddWithValue("@price", obj.price);
            cmd.Parameters.AddWithValue("@money", obj.money);
            cmd.Parameters.AddWithValue("@promotionCode", obj.promotionCode);
            cmd.Parameters.AddWithValue("@total", obj.total);
            cmd.Parameters.AddWithValue("@test", obj.test);
            cmd.Parameters.AddWithValue("@operate", obj.operate);
            conn.Open();
            cmd.ExecuteNonQuery();
            /*
            cmd.CommandText = "SELECT scope_identity()";
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
             * */
            conn.Close();
            return 1;
        }

        public static void UpdateData(DataObject.SysBillMaster obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_BILL_MASTER SET BillCode = @BillCode, CustomerId = @CustomerId, SourceId = @SourceId, ";
            Update += "TotalAmount = @TotalAmount, TotalAmountCollected = @TotalAmountCollected, Discount = @Discount, ";
            Update += "Status = @Status, DateTotal= @DateTotal Where ID = @ID";  
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@BillCode", obj.BillCode);
            cmd.Parameters.AddWithValue("@CustomerId", obj.CustomerId);
            cmd.Parameters.AddWithValue("@SourceId", obj.SourceId);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@TotalAmountCollected", obj.TotalAmountCollected);
            cmd.Parameters.AddWithValue("@Discount", obj.Discount);
            cmd.Parameters.AddWithValue("@Status", obj.Status);
            cmd.Parameters.AddWithValue("@DateTotal", obj.DateTotal);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_MASTER Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.DetailMasterGrid> GetDetailMasterGrid(Int32 Id)
        {
            List<DataObject.DetailMasterGrid> lstGridMasterDB = new List<DataObject.DetailMasterGrid>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from DetailMasterGrid Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from DetailMasterGrid";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    // parent,parentBillId,parentId,deliveryDate,product,sugar,quantity,price,money,promotionCode,total,test,operate
                    DataObject.DetailMasterGrid obj = new DataObject.DetailMasterGrid();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.parent = (bool)(oReader["parent"]);
                    obj.parentBillId = Int32.Parse(oReader["parentBillId"].ToString());
                    obj.parentId = Int32.Parse(oReader["parentId"].ToString());
                    obj.deliveryDate = oReader["deliveryDate"].ToString();
                    obj.product = oReader["product"].ToString();
                    obj.sugar = Int32.Parse(oReader["sugar"].ToString());
                    obj.quantity = oReader["quantity"].ToString();
                    obj.price = oReader["price"].ToString();
                    obj.money = oReader["money"].ToString();
                    obj.promotionCode = oReader["promotionCode"].ToString();
                    obj.total = oReader["total"].ToString();
                    obj.test = oReader["test"].ToString();
                    obj.operate = oReader["operate"].ToString();
                    lstGridMasterDB.Add(obj);
                }
            }
            conn.Close();
            return lstGridMasterDB;
        }
        public static List<DataObject.BillGridMasterDB> GetDataBillGridMasterDB(Int32 Id)
        {
            List<DataObject.BillGridMasterDB> lstGridMasterDB = new List<DataObject.BillGridMasterDB>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from BillGridMasterDB Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from BillGridMasterDB";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                   // Master,billType,billTypeId,OrderType,OrderTypeId,OrderType2Id,dateShip,discount,monny,payType,payTypeId,stt,billId,customerId
                    DataObject.BillGridMasterDB obj = new DataObject.BillGridMasterDB();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Master = (bool)(oReader["Master"]);
                    obj.billType = oReader["billType"].ToString();
                    obj.billTypeId = oReader["billTypeId"].ToString();
                    obj.OrderType = oReader["OrderType"].ToString();
                    obj.OrderTypeId = oReader["OrderTypeId"].ToString();
                    obj.OrderType2Id = oReader["OrderType2Id"].ToString();
                    obj.dateShip = oReader["dateShip"].ToString();
                    obj.discount = oReader["discount"].ToString();
                    obj.monny = oReader["monny"].ToString();
                    obj.payType = oReader["payType"].ToString();
                    obj.payTypeId = oReader["payTypeId"].ToString();
                    obj.stt = Int32.Parse(oReader["stt"].ToString());
                    obj.billId = Int32.Parse(oReader["billId"].ToString());
                    obj.customerId = Int32.Parse(oReader["customerId"].ToString());
                    lstGridMasterDB.Add(obj);
                }
            }
            conn.Close();
            return lstGridMasterDB;
        }
        public static List<DataObject.SysBillMaster> GetData(Int32 Id)
        {
            List<DataObject.SysBillMaster> lstSysBillMaster = new List<DataObject.SysBillMaster>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_MASTER Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_MASTER";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysBillMaster obj = new DataObject.SysBillMaster();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.DateTotal = Int32.Parse(oReader["DateTotal"].ToString());
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
            conn.Close();
            return lstSysBillMaster;
        }
    }
}
