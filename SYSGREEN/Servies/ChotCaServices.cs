using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class ChotCaServices
    {
        public static int InsertChotCaReturnId(DataObject.ChotCa obj,String ngayChot)
        {
            int check = 0;
            SqlConnection conn = Common.Connection.SqlConnect();
            String strCheck = "Select Top 1 ID FROM ChotCa where  convert(date,CONVERT(VARCHAR(10),NgayChot, 103),103) = convert(date,CONVERT(VARCHAR(10),'" + ngayChot + "' , 103),103)";
            SqlCommand cmdCheck = new SqlCommand(strCheck);
            cmdCheck.CommandType = CommandType.Text;
            cmdCheck.Connection = conn;
            conn.Open();
            object insertedCheck = cmdCheck.ExecuteScalar();
            cmdCheck.Connection.Close();
            conn.Close();
            if (insertedCheck != null)
            {
                check = Convert.ToInt16(insertedCheck);
            }
            if (check == 0)
            {
                String Insert = "INSERT INTO ChotCa (NgayChot,TienThuDuoc,NguoiChot,GioChot) VALUES (@NgayChot,@TienThuDuoc,@NguoiChot,@GioChot);Select @@IDENTITY as newId";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@NgayChot", obj.NgayChot);
                cmd.Parameters.AddWithValue("@TienThuDuoc", obj.TienThuDuoc);
                cmd.Parameters.AddWithValue("@NguoiChot", obj.NguoiChot);
                cmd.Parameters.AddWithValue("@GioChot", obj.GioChot);
                conn.Open();
                object insertedID = cmd.ExecuteScalar();
                cmd.Connection.Close();
                conn.Close();
                return Convert.ToInt32(insertedID);
            }
            else
            {
                UpdateChotCa(obj,ngayChot);
                return 0;
            }

            
        }
        public static void UpdateChotCa(DataObject.ChotCa obj,String ngayChot)
        {
            // 1 : Lưu thành công
            // 2 : Lưu thông tin không thành công trạng thái đang xử lý
            // 3 : Lưu thông tin không thành công trạng thái hoàn thành
            // 4  : Lưu thông tin không thành công trạng thái Đang xử lý về Chưa xử lý 
            SqlConnection conn = Common.Connection.SqlConnect();
            String Insert = "Update  ChotCa set  TienThuDuoc =" + obj.TienThuDuoc + " ,NguoiChot = N'" + obj.NguoiChot + " ,GioChot ='" + obj.GioChot + " where convert(date,CONVERT(VARCHAR(10),NgayChot, 103),103) = convert(date,CONVERT(VARCHAR(10),'" + ngayChot + "' , 103),103)";
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            conn.Close();
        }
        
        public static DataTable ViewChotCa(String NguoiChot, String NgayChot)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select *  from ChotCa  Where  ";
            if (NguoiChot != null && NguoiChot != "")
            {
                Select += "NguoiChot LIKE N'%" + NguoiChot + "%' AND ";
            }
            if (NgayChot != "")
            {
                string[] words = NgayChot.Split('/');
                if (words.Length == 1)
                {
                    Select += "CONVERT(varchar(10), DAY(NgayChot)) = '" + words[0] + "' AND ";
                }
                else if (words.Length == 2)
                {
                    Select += "CONVERT(varchar(10), DAY(NgayChot)) + '/' + CONVERT(varchar(10), MONTH(NgayChot)) = '" + words[0] + "/" + words[1] + "' AND ";
                }
                else if (words.Length == 3)
                {
                    Select += "convert(date,CONVERT(VARCHAR(10),NgayChot , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayChot + "' , 103),103) AND ";
                }
            }
            Select += " 1=1 ORDER BY NgayChot desc";
            //select *  from LoTrinhShipper where CONVERT(varchar(10), DAY(NgayTao)) + '/' + CONVERT(varchar(10), MONTH(NgayTao)) = '6/8'
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

    }
}
