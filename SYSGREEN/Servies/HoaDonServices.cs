using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class HoaDonServices
    {
        public static int InsertDataReturnId(DataObject.HoaDon obj)
        {
            String Insert = "INSERT INTO HoaDon (IDKhachHang,IDNguon,TongTien,TongTienThuDuoc,TongTienConNo,ChietKhau,TrangThai,NgayTao,NguoiTao,TongSoNgay) VALUES (@IDKhachHang,@IDNguon,@TongTien,@TongTienThuDuoc,@TongTienConNo,@ChietKhau,@TrangThai,@NgayTao,@NguoiTao,@TongSoNgay);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDKhachHang", obj.IDKhachHang);
            cmd.Parameters.AddWithValue("@IDNguon", obj.IDNguon);
            cmd.Parameters.AddWithValue("@TongTien", obj.TongTien);
            cmd.Parameters.AddWithValue("@TongTienThuDuoc", obj.TongTienThuDuoc);
            cmd.Parameters.AddWithValue("@TongTienConNo", obj.TongTienConNo);
            cmd.Parameters.AddWithValue("@ChietKhau", obj.ChietKhau);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
            cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
            cmd.Parameters.AddWithValue("@TongSoNgay", obj.TongSoNgay);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static int InsertChiTietHoaDonReturnId(DataObject.ChiTietHoaDon obj)
        {
            String Insert = "INSERT INTO ChiTietHoaDon (IDHoaDon,IsMaster,IdKhachHang,TrangThai) VALUES (@IDHoaDon,@IsMaster,@IdKhachHang,@TrangThai);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDHoaDon", obj.IDHoaDon);
            cmd.Parameters.AddWithValue("@IsMaster", obj.IsMaster);
            cmd.Parameters.AddWithValue("@IdKhachHang", obj.IdKhachHang);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static int InsertPackageChiTietHoaDonReturnId(DataObject.PackageChiTietHoaDon obj)
        {
            String Insert = "INSERT INTO PackageChiTietHoaDon (IDChiTietHD,SoNgay,Loai,TrangThai,Ship,HinhThucThanhToan,HinhThucGiaoHang,ThanhTien) VALUES (@IDChiTietHD,@SoNgay,@Loai,@TrangThai,@Ship,@HinhThucThanhToan,@HinhThucGiaoHang,@ThanhTien);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDChiTietHD", obj.IDChiTietHD);
            cmd.Parameters.AddWithValue("@SoNgay", obj.SoNgay);
            cmd.Parameters.AddWithValue("@Loai", obj.Loai);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            cmd.Parameters.AddWithValue("@Ship", obj.Ship);
            cmd.Parameters.AddWithValue("@HinhThucThanhToan", obj.HinhThucThanhToan);
            cmd.Parameters.AddWithValue("@HinhThucGiaoHang", obj.HinhThucGiaoHang);
            cmd.Parameters.AddWithValue("@ThanhTien", obj.ThanhTien);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static int InsertNgayHoaDonReturnId(DataObject.NgayHoaDon obj)
        {
            String Insert = "INSERT INTO NgayHoaDon (IDPackageChitietHD,Ngay,TrangThai) VALUES (@IDPackageChitietHD,@Ngay,@TrangThai);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDPackageChitietHD", obj.IDPackageChitietHD);
            cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }


        public static void UpdateData(DataObject.DeptObject obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE SYS_DEPT SET noidung = @Dept_Name, Dept_Description = @Dept_Description Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Dept_Name", obj.Dept_Name);
            cmd.Parameters.AddWithValue("@Dept_Description", obj.Dept_Description);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_DEPT Where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static List<DataObject.DeptObject> GetData(Int32 Id)
        {
            List<DataObject.DeptObject> lstDeptObject = new List<DataObject.DeptObject>();
            String Select = "";
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            if (Id > 0)
            {
                Select = "Select * from SYS_DEPT Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_DEPT";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
            }
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.DeptObject obj = new DataObject.DeptObject();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.Dept_Description = oReader["Dept_Description"].ToString();
                    obj.Dept_Name = oReader["Dept_Name"].ToString();
                    obj.Create_User = oReader["Create_User"].ToString();
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstDeptObject.Add(obj);
                }

            }
            conn.Close();
            return lstDeptObject;
        }
        public static DataTable getDataViewHoaDon(String MaHD, String TenKH, String TenSP)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vHoaDon where ";
            if (MaHD != null && MaHD != "")
            {
                Select += "MaReservation LIKE N'%" + MaHD + "%' AND "; 
            }
            if(TenKH != null && TenKH != ""){
                Select += "TenKH_HD LIKE N'%" + TenKH + "%' AND "; 
            }
            if (TenSP != null && TenSP != "")
            {
                Select += "product LIKE N'%" + TenSP + "%' AND "; 
            }
            Select += "1=1 ORDER BY ID_CTHD";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable getAllDataViewHoaDon()
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vHoaDonShiper ORDER BY ID_CTHD ";
            
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable getDataFilterViewHoaDon(String maReservation, String ngayHoaDon, String quan,
                        String soShiper, String tenShiper, String trangThai)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vHoaDonShiper where ";
            if (maReservation != null && maReservation != "")
            {
                Select += "MaReservation LIKE N'%" + maReservation + "%' AND ";
            }
            if (ngayHoaDon != null && ngayHoaDon != "")
            {
                Select += "Ngay LIKE N'%" + ngayHoaDon + "%' AND ";
            }
            if (quan != null && quan != "")
            {
                Select += "TenQuan LIKE N'%" + quan + "%' AND ";
            }

            if (soShiper != null && soShiper != "")
            {
                Select += "shipNo LIKE N'%" + soShiper + "%' AND ";
            }

            if (tenShiper != null && tenShiper != "")
            {
                Select += "shipName LIKE N'%" + tenShiper + "%' AND ";
            }

            if (trangThai != null && trangThai != "")
            {
                Select += "TrangThaiHD LIKE N'%" + trangThai + "%' AND ";
            }
            Select += "1=1 ORDER BY ID_CTHD";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable getAllShiper()
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from SHIPER ";

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
