using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysMenuServices
    {
        public static void InsertData(int menuId,int ProductId)
        {
            String Insert = "INSERT INTO  SYS_PRODUCT_MENU (MenuId,ProductId) VALUES (@MenuId,@ProductId)";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@MenuId", menuId);
            cmd.Parameters.AddWithValue("@ProductId", ProductId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            
        }

        public static void UpdateData(DataObject.SysMenu obj)
        {
            
        }

        public static void DeleteData(int menuId, int ProductId)
        {
            String Delete = "Delete from  SYS_PRODUCT_MENU Where MenuId = @menuId AND ProductId = @ProductId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@menuId", menuId);
            cmd.Parameters.AddWithValue("@ProductId", ProductId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static DataTable GetProductByIdMenu(Int32 menuId)
        {
            DataTable dt = new DataTable();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            Select = "Select * from SYS_PRODUCT_MENU Where MenuId = @menuId";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@menuId", menuId);
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }
    }
}
