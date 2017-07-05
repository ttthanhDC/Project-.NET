using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysProductServices
    {
        public static void InsertData(DataObject.SysProduct obj)
        {
            String Insert = "INSERT INTO SYS_PRODUCT (ORG_ID,Product_Code,Product_Name,Product_Unit,Product_Amount,Create_User,Create_Date) VALUES ";
            Insert += "(@ORG_ID,@Product_Code,@Product_Name,@Product_Unit,@Product_Amount,@Create_User,@Create_Date)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ORG_ID", obj.ORG_ID);
            cmd.Parameters.AddWithValue("@Product_Code", obj.Product_Code);
            cmd.Parameters.AddWithValue("@Product_Name", obj.Product_Name);
            cmd.Parameters.AddWithValue("@Product_Unit", obj.Product_Unit);
            cmd.Parameters.AddWithValue("@Product_Amount", obj.Product_Amount);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void UpdateData(DataObject.SysProduct obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_PRODUCT SET ORG_ID = @ORG_ID, Product_Code = @Product_Code, ";
            Update += "Product_Name = @Product_Name, Product_Unit = @Product_Unit, Product_Amount = @Product_Amount  Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ORG_ID", obj.ORG_ID);
            cmd.Parameters.AddWithValue("@Product_Code", obj.Product_Code);
            cmd.Parameters.AddWithValue("@Product_Name", obj.Product_Name);
            cmd.Parameters.AddWithValue("@Product_Unit", obj.Product_Unit);
            cmd.Parameters.AddWithValue("@Product_Amount", obj.Product_Amount);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_PRODUCT Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static List<DataObject.SysProduct> GetDataByProduct(string productCode)
        {
            List<DataObject.SysProduct> lstSysProduct = new List<DataObject.SysProduct>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (productCode != null && productCode != "")
            {
                Select = "Select * from SYS_PRODUCT Where Product_Code = @Product_Code";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Product_Code", productCode);
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysProduct obj = new DataObject.SysProduct();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.ORG_ID = Int32.Parse(oReader["ORG_ID"].ToString());
                    obj.Product_Code = oReader["Product_Code"].ToString();
                    obj.Product_Name = oReader["Product_Name"].ToString();
                    obj.Product_Unit = oReader["Product_Unit"].ToString();
                    obj.Product_Amount = float.Parse(oReader["Product_Amount"].ToString());
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysProduct.Add(obj);
                }
            }
            conn.Close();
            return lstSysProduct;
        }
        public static List<DataObject.SysProduct> GetData(Int32 Id)
        {
            List<DataObject.SysProduct> lstSysProduct = new List<DataObject.SysProduct>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_PRODUCT Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_PRODUCT";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysProduct obj = new DataObject.SysProduct();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.ORG_ID = Int32.Parse(oReader["ORG_ID"].ToString());
                    obj.Product_Code = oReader["Product_Code"].ToString();
                    obj.Product_Name = oReader["Product_Name"].ToString();
                    obj.Product_Unit = oReader["Product_Unit"].ToString();
                    obj.Product_Amount = float.Parse(oReader["Product_Amount"].ToString());
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysProduct.Add(obj);
                }
            }
            conn.Close();
            return lstSysProduct;
        }
    }
}
