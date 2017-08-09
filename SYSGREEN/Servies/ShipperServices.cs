using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class ShipperServices
    {
        public static int InsertLoTrinhShipperReturnId(DataObject.LoTrinhShipper obj)
        {
            String Insert = "INSERT INTO LoTrinhShipper (MaLoTrinh,NgayTao,NguoiTao,TrangThai) VALUES (@MaLoTrinh,@NgayTao,@NguoiTao,@TrangThai);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@MaLoTrinh", obj.MaLoTrinh);
            cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
            cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }
        public static void UpdateLoTrinhShipper(DataObject.LoTrinhShipper obj)
        {
            String Insert = "Update  LoTrinhShipper set  TrangThai= @TrangThai  where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            conn.Close();

            if (obj.TrangThai == "Đang xử lý")
            {
                String updateStatusNHD = "Update NgayHoaDon set TrangThai = 'Đang chuyển'  where IdLotrinhShipper = " + obj.ID;
                SqlCommand cmd1 = new SqlCommand(updateStatusNHD);
                cmd1.CommandType = CommandType.Text;
                cmd1.Connection = conn;
                conn.Open();
                cmd1.ExecuteNonQuery();
                cmd1.Connection.Close();
                conn.Close();
            }
            
        }
        public static void DeleteTrinhShipper(DataObject.LoTrinhShipper obj)
        {
            String Insert = "Delete  LoTrinhShipper  where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            conn.Close();

            String updateStatusNHD = "Update NgayHoaDon set IdLotrinhShipper = -1  where IdLotrinhShipper = " + obj.ID;
            SqlCommand cmd1 = new SqlCommand(updateStatusNHD);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            conn.Open();
            cmd1.ExecuteNonQuery();
            cmd1.Connection.Close();
            conn.Close();

        }
        public static DataTable ViewLoTrinhShipper(String NgayLotrinh, String MaLoTrinh, String ShipName, String ShipNumber, String TrangThai)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select lts.ID, lts.ShipID , s.NAME as ShipperName , s.NUMBER as ShipperNumber , lts.MaLoTrinh ,lts.NgayTao,lts.NguoiTao,lts.TrangThai  from LoTrinhShipper lts left join SHIPER s on s.SHIPER_ID = lts.ShipID Where  ";
            if (MaLoTrinh != null && MaLoTrinh != "")
            {
                Select += "MaLoTrinh LIKE N'%" + MaLoTrinh + "%' AND ";
            }
            if (ShipName != null && ShipName != "")
            {
                Select += "ShipperName LIKE N'%" + ShipName + "%' AND ";
            }
            if (ShipNumber != null && ShipNumber != "")
            {
                Select += "ShipperNumber LIKE N'%" + ShipNumber + "%' AND ";
            }
            if (TrangThai != null && TrangThai != "")
            {
                Select += "TrangThai LIKE N'%" + TrangThai + "%' AND ";
            }//CONVERT(VARCHAR(10),a.NgayTao , 103)
            if (NgayLotrinh != "")
            {
                string[] words = NgayLotrinh.Split('/');
                if (words.Length == 1)
                {
                    Select += "CONVERT(varchar(10), DAY(NgayTao)) = '" + words[0]  + "' AND ";
                }
                else if (words.Length == 2)
                {
                    Select += "CONVERT(varchar(10), DAY(NgayTao)) + '/' + CONVERT(varchar(10), MONTH(NgayTao)) = '" + words[0] + "/" + words[1] + "' AND ";
                }
                else if (words.Length == 3)
                {
                    Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayLotrinh + "' , 103),103) AND ";
                }
            }
            Select += " 1=1 ORDER BY NgayTao desc";
            //select *  from LoTrinhShipper where CONVERT(varchar(10), DAY(NgayTao)) + '/' + CONVERT(varchar(10), MONTH(NgayTao)) = '6/8'
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable InHoaDonSanPhamByNgay(String ngayHD)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "select * from vHoaDonStep3 where convert(date,CONVERT(VARCHAR(10),Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + ngayHD + "' , 103),103)";
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
