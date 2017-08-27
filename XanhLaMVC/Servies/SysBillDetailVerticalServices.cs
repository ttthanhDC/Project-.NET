using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysBillDetailVerticalServices
    {
        public static void InsertData(DataObject.SysBillDetailVertical obj)
        {
            String Insert = "INSERT INTO SYS_BILL_DETAIL_VERTICAL (VerticalMasterBill_ID,ProductCode,Quantity,ProductId,ProductPrice,IsSugar,TotalAmount,PromotionCode,Total,Comment) VALUES ";
            Insert += " (@VerticalMasterBill_ID,@ProductCode,@Quantity,@ProductId,@ProductPrice,@IsSugar,@TotalAmount,@PromotionCode,@Total,@Comment)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@VerticalMasterBill_ID", obj.VerticalMasterBill_ID);
            cmd.Parameters.AddWithValue("@ProductCode", obj.ProductCode);
            cmd.Parameters.AddWithValue("@Quantity", obj.Quantity);
            cmd.Parameters.AddWithValue("@ProductId", obj.ProductId);
            cmd.Parameters.AddWithValue("@ProductPrice", obj.ProductPrice);
            cmd.Parameters.AddWithValue("@IsSugar", obj.IsSugar);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@Total", obj.Total);
            cmd.Parameters.AddWithValue("@Comment", obj.Comment);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static int InsertDataReturnId(DataObject.SysBillDetailVertical obj)
        {
            String Insert = "INSERT INTO SYS_BILL_DETAIL_VERTICAL (VerticalMasterBill_ID,ProductCode,Quantity,ProductId,ProductPrice,IsSugar,TotalAmount,PromotionCode,Total,Comment) VALUES ";
            Insert += " (@VerticalMasterBill_ID,@ProductCode,@Quantity,@ProductId,@ProductPrice,@IsSugar,@TotalAmount,@PromotionCode,@Total,@Comment)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@VerticalMasterBill_ID", obj.VerticalMasterBill_ID);
            cmd.Parameters.AddWithValue("@ProductCode", obj.ProductCode);
            cmd.Parameters.AddWithValue("@Quantity", obj.Quantity);
            cmd.Parameters.AddWithValue("@ProductId", obj.ProductId);
            cmd.Parameters.AddWithValue("@ProductPrice", obj.ProductPrice);
            cmd.Parameters.AddWithValue("@IsSugar", obj.IsSugar);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@Total", obj.Total);
            cmd.Parameters.AddWithValue("@Comment", obj.Comment);
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT scope_identity()";
            conn.Open();
            int identity = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return identity;
        }

        public static void UpdateData(DataObject.SysBillDetailVertical obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_BILL_DETAIL_VERTICAL SET VerticalMasterBill_ID = @VerticalMasterBill_ID, ProductCode = @ProductCode ";
            Update += " @Quantity = Quantity, ";
            Update += "  @ProductId = ProductId, @ProductPrice = ProductPrice, @IsSugar = IsSugar, ";
            Update += "  @TotalAmount = TotalAmount, ";
            Update += "  @PromotionCode = PromotionCode, ";
            Update += "  @Total = Total, @Comment = Comment, ";
            Update += " Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@VerticalMasterBill_ID", obj.VerticalMasterBill_ID);
            cmd.Parameters.AddWithValue("@ProductCode", obj.ProductCode);
            cmd.Parameters.AddWithValue("@Quantity", obj.Quantity);
            cmd.Parameters.AddWithValue("@ProductId", obj.ProductId);
            cmd.Parameters.AddWithValue("@ProductPrice", obj.ProductPrice);
            cmd.Parameters.AddWithValue("@IsSugar", obj.IsSugar);
            cmd.Parameters.AddWithValue("@TotalAmount", obj.TotalAmount);
            cmd.Parameters.AddWithValue("@Total", obj.Total);
            cmd.Parameters.AddWithValue("@Comment", obj.Comment);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_BILL_DETAIL_VERTICAL Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.SysBillDetailVertical> GetData(Int32 Id)
        {
            List<DataObject.SysBillDetailVertical> lstSysBillDetailVertical = new List<DataObject.SysBillDetailVertical>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_BILL_DETAIL_VERTICAL Where VerticalMasterBill_ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_BILL_DETAIL_VERTICAL";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysBillDetailVertical obj = new DataObject.SysBillDetailVertical();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.VerticalMasterBill_ID = Int32.Parse(oReader["VerticalMasterBill_ID"].ToString());
                    obj.ProductCode = oReader["ProductCode"].ToString();
                    obj.Quantity = Int32.Parse(oReader["Quantity"].ToString());
                    obj.ProductId = Int32.Parse(oReader["ProductId"].ToString());
                    obj.ProductPrice = Int32.Parse(oReader["ProductPrice"].ToString());
                    obj.IsSugar = (bool)oReader["IsSugar"];
                    obj.TotalAmount = float.Parse(oReader["TotalAmount"].ToString());
                    obj.PromotionCode = oReader["PromotionCode"].ToString();
                    obj.Total = float.Parse(oReader["Total"].ToString());
                    obj.Comment = oReader["Comment"].ToString();
                    lstSysBillDetailVertical.Add(obj);
                }
            }
            conn.Close();
            return lstSysBillDetailVertical;
        }
    }
}
