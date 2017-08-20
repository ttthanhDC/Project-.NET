using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class KhoServices
    {
        public static List<DataObject.Kho001> viewK001P1(String Ngay, String thu)
        {
            List<DataObject.Kho001> lst = new List<DataObject.Kho001>();
            SqlConnection conn = Common.Connection.SqlConnect();
            String checkStr = "Select sm.*,sp.Product_Name,sp.Product_Code  from SYS_MENU sm ";
            checkStr += "LEFT JOIN SYS_PRODUCT sp ON sp.ID = sm.PRODUCT_ID ";
            checkStr += " where sm.Code = '" + thu + "'";
            SqlCommand cmd = new SqlCommand(checkStr);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.Kho001 obj = new DataObject.Kho001();
                    obj.LoaiSua = oReader["Product_Name"].ToString();
                    String productCode = oReader["Product_Code"].ToString();
                    String strCheck = "SELECT fK001('" + productCode + "','" + Ngay + "') AS MyResult";
                    DataTable dt = new DataTable();
                    SqlConnection connF = Common.Connection.SqlConnect();
                    SqlCommand cmdCheck = new SqlCommand(strCheck);
                    cmdCheck.CommandType = CommandType.Text;
                    cmdCheck.Connection = connF;
                    connF.Open();
                    dt.Load(cmdCheck.ExecuteReader());
                    connF.Close();
                    if (dt.Rows.Count > 0)
                    {
                        obj.SoLuongChai = Int32.Parse(dt.Rows[0][0].ToString());
                        obj.TheTich = Int32.Parse(dt.Rows[0][1].ToString());
                        obj.sugar = Int32.Parse(dt.Rows[0][1].ToString()) > 0 ? 1 : 0;
                    }
                    lst.Add(obj);
                }

            }
            conn.Close();
            return lst;
        }

        public static void insertOrUpdateViewK001(String Ngay, String ID,String productName,String ProductId,String productUnit,String productUnit_DK,String productUnit_CL)
        {
            String select = "Select count(*) from Kho001 where convert(date,CONVERT(VARCHAR(10),Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10)," + Ngay + ", 103),103) ";
            int check = 0;
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            object count = cmd.ExecuteScalar();
            conn.Close();
            check = Convert.ToInt16(count);
            if (check > 0)
            {
                String update = "Update Kho001 Set Product_Unit = @productUnit , Product_Unit_DK = @productUnit_DK , Product_Unit_CL = @productUnit_CL  where ID = @ID";
                SqlCommand cmdUpdate = new SqlCommand(update);
                cmdUpdate.CommandType = CommandType.Text;
                cmdUpdate.Connection = conn;
                cmdUpdate.Parameters.AddWithValue("@productUnit", Convert.ToInt16(productUnit));
                cmdUpdate.Parameters.AddWithValue("@productUnit_DK", Convert.ToInt16(productUnit_DK));
                cmdUpdate.Parameters.AddWithValue("@productUnit_CL", Convert.ToInt16(productUnit_CL));
                cmdUpdate.Parameters.AddWithValue("@ID", Convert.ToInt16(ID));
                conn.Open();
                cmdUpdate.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                String update = "Insert INTO  Kho001 (Product_Name,Product_ID,Product_Unit,Product_Unit_DK,Product_Unit_CL,Ngay)VALUES (@Product_Name,@Product_ID,@Product_Unit,@Product_Unit_DK,@Product_Unit_CL,@Ngay)";
                SqlCommand cmdUpdate = new SqlCommand(update);
                cmdUpdate.CommandType = CommandType.Text;
                cmdUpdate.Connection = conn;
                cmdUpdate.Parameters.AddWithValue("@Product_Name", productName);
                cmdUpdate.Parameters.AddWithValue("@Product_ID", Convert.ToInt16(ProductId));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit", Convert.ToInt16(productUnit));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit_DK", Convert.ToInt16(productUnit_DK));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit_CL", Convert.ToInt16(productUnit_CL));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit_CL", Convert.ToInt16(productUnit_CL));
                cmdUpdate.Parameters.AddWithValue("@Ngay", DateTime.ParseExact(Ngay, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                conn.Open();
                cmdUpdate.ExecuteNonQuery();
                conn.Close();
            }
            
        }

        public static DataTable viewK001P2(String Ngay)
        {
            DataTable dt = new DataTable();
            String select = "Select * from Kho001 where convert(date,CONVERT(VARCHAR(10),Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10)," + Ngay + ", 103),103) ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }

    }
}
