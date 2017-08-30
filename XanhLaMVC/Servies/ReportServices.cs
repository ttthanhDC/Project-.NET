using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class ReportServices
    {
        public static DataTable getRPVanChuyen(String IdNgayHD)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vRPVanChuyen where ";
            if (IdNgayHD != null && IdNgayHD != "")
            {
                Select += "ID_NHD =" + IdNgayHD + " AND ";
            }
            
            Select += " 1=1";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable getRPLoTrinh(String MaLoTrinh)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vRPLoTrinh where ";
            if (MaLoTrinh != null && MaLoTrinh != "")
            {
                Select += "MaLoTrinh LIKE N'%" + MaLoTrinh + "%' AND "; 
            }

            Select += " 1=1";
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
