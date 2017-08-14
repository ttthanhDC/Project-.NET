using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class BaocaoServices
    {
        public static DataTable getvBaoCao01(String NgayTao)
        {

            DataTable table = new DataTable();
            String Select = "Select * from  vBC0102 Where TrangThai != N'Hủy Đơn' AND  ";
            if (NgayTao != null &&  NgayTao != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayTao + "' , 103),103) AND ";
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
        public static DataTable getvBaoCao02(String NgayTao)
        {

            DataTable table = new DataTable();
            String Select = "Select * from  vBC0102 Where TrangThai = N'Hủy Đơn' AND  ";
            if (NgayTao != null && NgayTao != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayTao + "' , 103),103) AND ";
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

        public static List<DataObject.BaoCao03> getvBaoCao03(String tuNgay, String denNgay, Int16 LoaiDon)
        {

            List<DataObject.BaoCao03> lstDeptObject = new List<DataObject.BaoCao03>();
            DataTable table = new DataTable();
            String Select = "Select * from  vBC0103 Where  ";
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
            if (LoaiDon > -1)
            {
                Select += " Loai = " + LoaiDon + " AND ";
            }
            Select += "1=1 ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    conn.Close();
                    DataObject.BaoCao03 obj = new DataObject.BaoCao03();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.MaHD = Int32.Parse(oReader["MaHD"].ToString());
                    obj.Loai = Int32.Parse(oReader["Loai"].ToString());
                    obj.CustomerName = oReader["CustomerName"].ToString();
                    obj.TenQuan = oReader["TenQuan"].ToString();
                    obj.TenQuan = oReader["TenQuan"].ToString();
                    obj.PhoneNumber = oReader["PhoneNumber"].ToString();
                    obj.NguoiTao = oReader["TenQNguoiTaouan"].ToString();
                    if (oReader["NgayTao"].ToString() != "" && oReader["NgayTao"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["NgayTao"].ToString());
                        obj.NgayTao = DateTime.Parse(createDate);
                    }
                    obj.NguoiTao = oReader["TenQNguoiTaouan"].ToString();

                    String strSolanConLai = "select fSoLanConLaiByIdGoi(" + obj.ID + ")";
                    SqlCommand cmdSoLanConLai = new SqlCommand(strSolanConLai);
                    cmdSoLanConLai.CommandType = CommandType.Text;
                    cmdSoLanConLai.Connection = conn;
                    conn.Open();
                    object oSolanConLai = cmdSoLanConLai.ExecuteScalar();
                    obj.SoLanGiaoConLai = Convert.ToInt16(oSolanConLai);
                    conn.Close();


                    String strSumTien = "Select ffSumSoTienByBC03(" + obj.ID + ")";
                    SqlCommand cmdSumTien = new SqlCommand(strSolanConLai);
                    cmdSumTien.CommandType = CommandType.Text;
                    cmdSumTien.Connection = conn;
                    conn.Open();
                    DataTable dt = new DataTable();
                    dt.Load(cmdSumTien.ExecuteReader());
                    if (dt.Rows[0][0] != null)
                    {
                        obj.SoTienThu = dt.Rows[0][0] != null ? Convert.ToDecimal(dt.Rows[0][0]) : 0;
                    }
                    if (dt.Rows[0][1] != null)
                    {
                        obj.SoTienTong = dt.Rows[0][1] != null ? Convert.ToDecimal(dt.Rows[0][1]) : 0;
                    }
                    if (dt.Rows[0][2] != null)
                    {
                        obj.SoTienThieu = dt.Rows[0][1] != null ? Convert.ToDecimal(dt.Rows[0][2]) : 0;
                    }
                    conn.Close();
                    lstDeptObject.Add(obj);
                }

            }
            return lstDeptObject;
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
                    conn.Close();
                    DataObject.BaoCao04 obj = new DataObject.BaoCao04();
                    obj.IdNguon = Int32.Parse(oReader["ID"].ToString());
                    obj.TenNguon = oReader["Source_Name"].ToString();
                    DataTable table = new DataTable();
                    String strSolanConLai = "select * from fBC004(" + obj.IdNguon + ",'"+tuNgay+"','"+denNgay+"')";
                    SqlCommand cmdSoLanConLai = new SqlCommand(strSolanConLai);
                    cmdSoLanConLai.CommandType = CommandType.Text;
                    cmdSoLanConLai.Connection = conn;
                    conn.Open();
                    table.Load(cmdSoLanConLai.ExecuteReader());
                    conn.Close();
                    obj.SoLuongDon = table.Rows[0][0] != null ? Convert.ToInt16(table.Rows[0][0]) : 0;
                    obj.SoluongShip = table.Rows[0][1] != null ? Convert.ToInt16(table.Rows[0][1]) : 0;
                    obj.DuKienThu = table.Rows[0][2] != null ? Convert.ToDecimal(table.Rows[0][2]) : 0;
                    lstDeptObject.Add(obj);
                }

            }
            return lstDeptObject;
        }

        public static List<DataObject.BaoCao05> getvBaoCao05(String shipperName , String tuNgay, String denNgay)
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



        //public st


    }
}
