using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class HoaDonSanPhamServices
    {
        public static int InsertDataReturnId(DataObject.HoaDonSanPham obj)
        {
            String Insert = "INSERT INTO HoaDonSanPham (IDNgayHoaDon,product,sugar,quantity,price,money,promotionCode,total,GhiChu) VALUES (@IDNgayHoaDon,@product,@sugar,@quantity,@price,@money,@promotionCode,@total,@GhiChu);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDNgayHoaDon", obj.IDNgayHoaDon);
            cmd.Parameters.AddWithValue("@product", obj.product);
            cmd.Parameters.AddWithValue("@sugar", obj.sugar);
            cmd.Parameters.AddWithValue("@quantity", obj.quantity);
            cmd.Parameters.AddWithValue("@price", obj.price);
            cmd.Parameters.AddWithValue("@money", obj.money);
            cmd.Parameters.AddWithValue("@promotionCode", obj.promotionCode);
            cmd.Parameters.AddWithValue("@total", obj.total);
            cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }
        public static int InsertDataStep3ReturnId(DataObject.HoaDonSanPham obj)
        {
            String Insert = "INSERT INTO HoaDonSanPham (IDNgayHoaDon,product,sugar,quantity,price,money,promotionCode,total,GhiChu,Error) VALUES (@IDNgayHoaDon,@product,@sugar,@quantity,@price,@money,@promotionCode,@total,@GhiChu,@Error);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDNgayHoaDon", obj.IDNgayHoaDon);
            cmd.Parameters.AddWithValue("@product", obj.product);
            cmd.Parameters.AddWithValue("@sugar", obj.sugar);
            cmd.Parameters.AddWithValue("@quantity", obj.quantity);
            cmd.Parameters.AddWithValue("@price", obj.price);
            cmd.Parameters.AddWithValue("@money", obj.money);
            cmd.Parameters.AddWithValue("@promotionCode", obj.promotionCode);
            cmd.Parameters.AddWithValue("@total", obj.total);
            cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
            cmd.Parameters.AddWithValue("@Error", obj.Error);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static void UpdateDataHoaDonSP(DataObject.HoaDonSanPham obj)
        {
            String Insert = "Update HoaDonSanPham SET IDNgayHoaDon = @IDNgayHoaDon ,product = @product ,sugar = @sugar ,quantity = @quantity ,price = @price,money = @money, promotionCode = @promotionCode,total = @total ,GhiChu = @GhiChu ,Error = @Error where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDNgayHoaDon", obj.IDNgayHoaDon);
            cmd.Parameters.AddWithValue("@product", obj.product);
            cmd.Parameters.AddWithValue("@sugar", obj.sugar);
            cmd.Parameters.AddWithValue("@quantity", obj.quantity);
            cmd.Parameters.AddWithValue("@price", obj.price);
            cmd.Parameters.AddWithValue("@money", obj.money);
            cmd.Parameters.AddWithValue("@promotionCode", obj.promotionCode);
            cmd.Parameters.AddWithValue("@total", obj.total);
            cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
            cmd.Parameters.AddWithValue("@Error", obj.Error);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            conn.Close();
            
        }

        public static int InsertChiTietHoaDonReturnId(DataObject.ChiTietHoaDon obj)
        {
            String Insert = "INSERT INTO HoaDon (IDHoaDon,IsMaster,IdKhachHang,TrangThai) VALUES (@IDHoaDon,@IsMaster,@IdKhachHang,@TrangThai);Select @@IDENTITY as newId";
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
            String Insert = "INSERT INTO HoaDon (IDChiTietHD,SoNgay,Loai,TrangThai,Ship,HinhThucThanhToan,HinhThucGiaoHang,ThanhTien) VALUES (@IDChiTietHD,@SoNgay,@Loai,@TrangThai,@Ship,@HinhThucThanhToan,@HinhThucGiaoHang,@ThanhTien);Select @@IDENTITY as newId";
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
            String Insert = "INSERT INTO HoaDon (IDPackageChitietHD,Ngay,TrangThai) VALUES (@IDPackageChitietHD,@Ngay,@TrangThai);Select @@IDENTITY as newId";
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
    }
}
