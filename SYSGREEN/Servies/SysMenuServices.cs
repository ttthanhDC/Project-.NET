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
        public static int InsertData(int Code,int ProductId)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            int check = 0;
            String strCheck = "Select Count(*) from SYS_MENU Where Code = " + Code + " AND PRODUCT_ID = " + ProductId;
            SqlCommand cmdCheck = new SqlCommand(strCheck);
            cmdCheck.CommandType = CommandType.Text;
            cmdCheck.Connection = conn;
            conn.Open();
            object count = cmdCheck.ExecuteScalar();
            conn.Close();
            check = Convert.ToInt16(count);
            if (check == 0)
            {
                String Insert = "INSERT INTO  SYS_MENU (Code,PRODUCT_ID) VALUES (@Code,@ProductId)";

                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Code", Code);
                cmd.Parameters.AddWithValue("@ProductId", ProductId);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return 1;
            }
            else
            {
                return -1;
            }
        }

        public static void UpdateData(DataObject.SysMenu obj)
        {
            
        }

        public static void DeleteData(int Code, int ProductId)
        {
            String Delete = "Delete from  SYS_MENU Where Code = @Code AND PRODUCT_ID = @ProductId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Code", Code);
            cmd.Parameters.AddWithValue("@ProductId", ProductId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static DataTable GetProductByIdCode(Int32 Code)
        {
            DataTable dt = new DataTable();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            Select = "Select a.*,c.Product_Name from SYS_MENU a ";
            Select += " LEFT JOIN SYS_PRODUCT c ON c.ID = a.PRODUCT_ID ";
            Select += " Where a.Code = @Code";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Code", Code);
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }
        public static DataTable GetProductByIdMenu(Int32 menuId)
        {
            DataTable dt = new DataTable();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            Select = "Select a.*,b.ThuTrongTuan,c.Product_Name from SYS_PRODUCT_MENU a ";
            Select += " LEFT JOIN SYS_MENU b ON b.ID = a.MenuId ";
            Select += " LEFT JOIN SYS_PRODUCT c ON c.ID = a.ProductId ";
            Select += " Where a.MenuId = @menuId";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@menuId", menuId);
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }
        public static DataTable GetAllMenu()
        {
            DataTable dt = new DataTable();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            Select = " Select * from SYS_MENU a ";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }
    }
}
