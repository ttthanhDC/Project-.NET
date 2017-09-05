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
        public static DataTable getRPBaoCao01(String NgayTao)
        {
            DataTable table = new DataTable();
            String Select = "Select * from  vRPBaoCao01 Where  ";
            if (NgayTao != null && NgayTao != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),Time , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayTao + "' , 103),103) AND ";
            }
            Select += "1=1 ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }
        public static DataTable getRPBaoCao02(String NgayTao)
        {
            DataTable table = new DataTable();
            String Select = "Select * from  vRPBaoCao02 Where  ";
            if (NgayTao != null && NgayTao != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),Time , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayTao + "' , 103),103) AND ";
            }
            Select += "1=1 ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }
        public static List<DataObject.BaoCao04> getvBaoCao04(String tuNgay, String denNgay)
        {

            List<DataObject.BaoCao04> lstDeptObject = new List<DataObject.BaoCao04>();

            String Select = "select * from  SYS_SOURCE  ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {

                    DataObject.BaoCao04 obj = new DataObject.BaoCao04();
                    obj.IdNguon = Int32.Parse(oReader["ID"].ToString());
                    obj.TenNguon = oReader["Source_Name"].ToString();
                    DataTable table = new DataTable();
                    String strSolanConLai = "select * from fBC004(" + obj.IdNguon + ",'" + tuNgay + "','" + denNgay + "')";
                    SqlCommand cmdSoLanConLai = new SqlCommand(strSolanConLai);
                    cmdSoLanConLai.CommandType = CommandType.Text;
                    SqlConnection connStr = Common.Connection.SqlConnect();
                    cmdSoLanConLai.Connection = connStr;
                    connStr.Open();
                    table.Load(cmdSoLanConLai.ExecuteReader());
                    connStr.Close();
                    obj.SoLuongDon = table.Rows[0][0] != null ? Convert.ToInt16(table.Rows[0][0]) : 0;
                    obj.SoluongShip = table.Rows[0][1] != null ? Convert.ToInt16(table.Rows[0][1]) : 0;
                    obj.DuKienThu = table.Rows[0][2] != null ? Convert.ToDecimal(table.Rows[0][2]) : 0;
                    lstDeptObject.Add(obj);
                }

            }
            conn.Close();
            return lstDeptObject;
        }

        public static List<DataObject.BaoCao05> getvBaoCao05(String shipperName, String tuNgay, String denNgay)
        {

            List<DataObject.BaoCao05> lstDeptObject = new List<DataObject.BaoCao05>();

            String Select = "select * from  vBC05 Where   ";
            if (shipperName != null && shipperName != "")
            {
                Select += "NAME LIKE N'%" + shipperName + "%' AND ";
            }
            if (tuNgay != "" && denNgay == "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) >= convert(date,CONVERT(VARCHAR(10),'" + tuNgay + "' , 103),103) AND ";
            }
            if (denNgay != "" && tuNgay == "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) <= convert(date,CONVERT(VARCHAR(10),'" + denNgay + "' , 103),103) AND ";
            }
            if (denNgay != "" && tuNgay != "")
            {
                Select += "(convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) BETWEEN  convert(date,CONVERT(VARCHAR(10),'" + tuNgay + "' , 103),103) AND convert(date,CONVERT(VARCHAR(10),'" + denNgay + "' , 103),103)) AND ";
            }
            Select += " 1 = 1";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {

                    DataObject.BaoCao05 obj = new DataObject.BaoCao05();
                    obj.MaChuyenDi = oReader["MaLoTrinh"].ToString();
                    obj.MaLoTrinhId = Convert.ToInt32(oReader["ID"].ToString());
                    obj.MaShipper = oReader["SHIPER_ID"] != null ? oReader["SHIPER_ID"].ToString() : "";
                    obj.HoTen = oReader["NAME"].ToString();
                    DataTable table = new DataTable();
                    String strSolanConLai = "select * from fBC005(" + obj.MaLoTrinhId + ")";
                    SqlCommand cmdSoLanConLai = new SqlCommand(strSolanConLai);
                    cmdSoLanConLai.CommandType = CommandType.Text;
                    SqlConnection connStr = Common.Connection.SqlConnect();
                    cmdSoLanConLai.Connection = connStr;
                    connStr.Open();
                    table.Load(cmdSoLanConLai.ExecuteReader());
                    connStr.Close();
                    obj.Nhan = table.Rows[0][0] != null ? Convert.ToInt16(table.Rows[0][0]) : 0;
                    obj.Di = table.Rows[0][1] != null ? Convert.ToInt16(table.Rows[0][1]) : 0;
                    obj.Trave = table.Rows[0][2] != null ? Convert.ToInt16(table.Rows[0][2]) : 0;
                    obj.DuKienThu = table.Rows[0][3] != null ? Convert.ToDecimal(table.Rows[0][3]) : 0;
                    lstDeptObject.Add(obj);
                }

            }
            conn.Close();
            return lstDeptObject;
        }
        public static DataTable getRPGopDon(String IdNgayHD)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vRPVanChuyen where ";
            if (IdNgayHD != null && IdNgayHD != "")
            {
                Select += "ID_NHD IN (" + IdNgayHD + ") AND ";
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
