using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class KinhDoanhSV
    {
        public static DataTable getvKD001(String MaKH, String HoTen, String SoDT, String Email, String Quan)
        {

            DataTable table = new DataTable();
            String Select = "Select * from  vKD001 Where ";
            if (MaKH != null && MaKH != "")
            {
                Select += "MaKH LIKE N'%" + MaKH + "%' AND ";
            }
            if (HoTen != null && HoTen != "")
            {
                Select += "CustomerName LIKE N'%" + HoTen + "%' AND ";
            }
            if (SoDT != null && SoDT != "")
            {
                Select += "PhoneNumber LIKE N'%" + SoDT + "%' AND ";
            }
            if (Email != null && Email != "")
            {
                Select += "Email LIKE N'%" + Email + "%' AND ";
            }
            if (Quan != null && Quan != "")
            {
                Select += "TenQuan LIKE N'%" + Quan + "%' AND ";
            }
            Select += " 1=1 ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }
        public static List<DataTable> getvDetailKD001(String IdKH)
        {

            List<DataTable> lst = new List<DataTable>();
            DataTable table = new DataTable();
            DataTable tbl = new DataTable();
            String Select = "Select * from  vKhachHang Where ID = " + IdKH;
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();

            String Select1 = "Select * from  vDetailKD001 Where IdKH = " + IdKH;
            SqlCommand cmd1 = new SqlCommand(Select1);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            conn.Open();
            tbl.Load(cmd1.ExecuteReader());
            conn.Close();
            lst.Add(table);
            lst.Add(tbl);
            return lst;
        }
        public static DataTable  getvDetailKD003(String Ngay)
        {

            List<DataTable> lst = new List<DataTable>();
            DataTable table = new DataTable();
            String Select = "Select * from  vDetailKD003 Where ";
            if (Ngay != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "' , 103),103) AND ";
            }
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }
    }
}
