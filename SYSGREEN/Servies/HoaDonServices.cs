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
            String Insert = "INSERT INTO ChiTietHoaDon (IDHoaDon,IsMaster,IdKhachHang,TrangThai,tabIndex) VALUES (@IDHoaDon,@IsMaster,@IdKhachHang,@TrangThai,@tabIndex);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@IDHoaDon", obj.IDHoaDon);
            cmd.Parameters.AddWithValue("@IsMaster", obj.IsMaster);
            cmd.Parameters.AddWithValue("@IdKhachHang", obj.IdKhachHang);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            cmd.Parameters.AddWithValue("@tabIndex", obj.tabIndex);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static int InsertPackageChiTietHoaDonReturnId(DataObject.PackageChiTietHoaDon obj)
        {
            String Insert = "INSERT INTO PackageChiTietHoaDon (IDChiTietHD,SoNgay,Loai,TrangThai,Ship,HinhThucThanhToan,HinhThucGiaoHang,ThanhTien,IDKhachHang,IDGoi) VALUES (@IDChiTietHD,@SoNgay,@Loai,@TrangThai,@Ship,@HinhThucThanhToan,@HinhThucGiaoHang,@ThanhTien,@IDKhachHang,@IDGoi);Select @@IDENTITY as newId";
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
            cmd.Parameters.AddWithValue("@IDKhachHang", obj.IDKhachHang);
            cmd.Parameters.AddWithValue("@IDGoi", obj.IDGoi);
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

        public static Int32 getMaxIdHoaDon()
        {
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select Max(ID) from HoaDon ";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            Int32 maxId = (Int32)cmd.ExecuteScalar();
            conn.Close();
            return maxId;
        }

        public static DataTable getvHoaDonStep1(String MaHD, String tuNgay, String denNgay, String trangThai, String TenKH, String SoDT)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vHoaDonStep1 where ";
            if (MaHD != null && MaHD != "")
            {
                Select += "MaReservation LIKE N'%" + MaHD + "%' AND ";
            }
            if (TenKH != null && TenKH != "")
            {
                Select += "TenKH LIKE N'%" + TenKH + "%' AND ";
            }
            if (trangThai != null && trangThai != "")
            {
                Select += "TrangThai LIKE N'%" + trangThai + "%' AND ";
            }
            if (SoDT != null && SoDT != "")
            {
                Select += "SoDienThoai LIKE N'%" + SoDT + "%' AND ";
            }//CONVERT(VARCHAR(10),a.NgayTao , 103)
            if (tuNgay != "" && denNgay == "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) >= convert(date,CONVERT(VARCHAR(10),'" + tuNgay  + "' , 103),103) AND ";
            }
            if (denNgay != "" && tuNgay == "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) <= convert(date,CONVERT(VARCHAR(10),'" + denNgay + "' , 103),103) AND ";
            }
            if (denNgay != "" && tuNgay != "")
            {
                Select += "(convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) BETWEEN  convert(date,CONVERT(VARCHAR(10),'" + tuNgay + "' , 103),103) AND convert(date,CONVERT(VARCHAR(10),'" + denNgay  + "' , 103),103)) AND ";
            }
            Select += "1=1 ORDER BY NgayTao desc";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static void updateStatusVHoaDonStep1(int HoadonID,String trangthai)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE HoaDon SET TrangThai = @TrangThai Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@TrangThai", trangthai);
            cmd.Parameters.AddWithValue("@ID", HoadonID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static DataTable getvHoaDonStep2(String ID)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vHoaDonStep2 where ID = " + ID + " AND ";
            Select += " 1=1 ORDER BY IsMaster desc , IdNgayHD asc";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable getvHoaDonStep3(String ID)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from vHoaDonStep3 where ID = " + ID + " AND ";
            Select += " 1=1 ";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }



        public static void updateHoaDonStep2(int HoadonID, DataObject.HoaDon hoadon)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE HoaDon SET TongTienThuDuoc = @TongTienThuDuoc , TongTienConNo = @TongTienConNo Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@TongTienThuDuoc", hoadon.TongTienThuDuoc);
            cmd.Parameters.AddWithValue("@TongTienConNo", hoadon.TongTienConNo);
            cmd.Parameters.AddWithValue("@ID", HoadonID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static void updateNgayHoaDonStep2(int HoadonID, DataObject.NgayHoaDon ngayhoadon)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE NgayHoaDon SET TrangThai = @TrangThai , GhiChu = @GhiChu , Ngay = @Ngay , TongTien = @TongTien , SoTienThu = @SoTienThu , SoTienConLai = @SoTienConLai Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@TrangThai", ngayhoadon.TrangThai);
            cmd.Parameters.AddWithValue("@GhiChu", ngayhoadon.GhiChu);
            cmd.Parameters.AddWithValue("@Ngay", ngayhoadon.Ngay);
            cmd.Parameters.AddWithValue("@TongTien", ngayhoadon.TongTien);
            cmd.Parameters.AddWithValue("@SoTienThu", ngayhoadon.SoTienThu);
            cmd.Parameters.AddWithValue("@SoTienConLai", ngayhoadon.SoTienConLai);
            cmd.Parameters.AddWithValue("@ID", HoadonID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static int getSoLanGiao(String ID)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlCommand cmd1 = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "select top 1 idPCTHD from vHoaDonStep3  where ID = " + ID + " AND ";
            Select += " 1=1 ";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            String idPCTHD = Convert.ToString(insertedID);
            conn.Close();
            String Select1 = "select distinct ID from vHoaDonStep3 where idPCTHD = " + idPCTHD ;
            cmd1 = new SqlCommand(Select1);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            conn.Open();
            table.Load(cmd1.ExecuteReader());
            int solangiao = 0;
            for (int i = 0; i < table.Rows.Count; i++)
            {
                String idTbl = table.Rows[i]["ID"].ToString();
                if (idTbl == ID){
                    solangiao = i + 1;
                    break;
                }
            }
            conn.Close();

            return solangiao;
        }

        public static void updateNgayHoaDonToShiper(Int32 ngayHoaDonId, Int32 shiperId, Int32 userId, Int32 IdLotrinhShipper,String NguoiTao)
        {
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Update = "UPDATE NgayHoaDon SET USER_ID = @User_Id, SHIPER_ID = @Shiper_Id,IdLotrinhShipper = @IdLotrinhShipper Where ID = @ID";
            cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@User_Id", userId);
            cmd.Parameters.AddWithValue("@Shiper_Id", shiperId);
            cmd.Parameters.AddWithValue("@IdLotrinhShipper", IdLotrinhShipper);
            cmd.Parameters.AddWithValue("@ID", ngayHoaDonId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            String updateLotrinh = "Update LoTrinhShipper Set ShipID = " + shiperId  + ", NguoiTao = '" + NguoiTao + "' where ID = " + IdLotrinhShipper;
            SqlCommand cmd1 = new SqlCommand(updateLotrinh);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
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


        public static int getSoTienChuaXuLy(String ID)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlCommand cmd1 = null;
            SqlCommand cmd2 = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "select hd.ID from NgayHoaDon nhd ";
            Select +="left join PackageChiTietHoaDon pcthd on pcthd.ID = nhd.IDPackageChitietHD ";
            Select +="left join ChiTietHoaDon cthd on cthd.ID = pcthd.IDChiTietHD ";
            Select += "left join HoaDon hd on hd.ID = cthd.IDHoaDon ";
            Select += "where  nhd.ID = " + ID;
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            String idPCTHD = Convert.ToString(insertedID);
            conn.Close();
            String Select1 = "select SUM(nhd.SoTienThu) from NgayHoaDon nhd ";
            Select1 +="left join PackageChiTietHoaDon pcthd on pcthd.ID = nhd.IDPackageChitietHD ";
            Select1 +="left join ChiTietHoaDon cthd on cthd.ID = pcthd.IDChiTietHD ";
            Select1 +="left join HoaDon hd on hd.ID = cthd.IDHoaDon ";
            Select1 += "where  hd.ID = " + idPCTHD + " and nhd.TrangThai = N'Hoàn thành' ";
            cmd1 = new SqlCommand(Select1);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            conn.Open();
            object sumTotal = cmd1.ExecuteScalar();
            Int32 solangiao = 0;

            if (sumTotal.ToString() != "")
            {
                solangiao = Convert.ToInt32(sumTotal);
            } 
            conn.Close();
            String Select2 = "select TongTien from HoaDon where ID = " + idPCTHD;
            cmd2 = new SqlCommand(Select2);
            cmd2.CommandType = CommandType.Text;
            cmd2.Connection = conn;
            conn.Open();
            object Total = cmd2.ExecuteScalar();
            Int32 intTotal = Convert.ToInt32(Total);
            conn.Close();
            Int32 result = intTotal - solangiao;
            return result;
        }
        // Update KH Step V3
        public static int updateGóiStepV3(String ID, String ghichu, String tienTangGiam)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlCommand cmd1 = null;
            SqlCommand cmd2 = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "select top 1 idPCTHD from vHoaDonStep3  where ID = " + ID ;
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            conn.Close();
            String idPCTHD = Convert.ToString(insertedID);
            if(tienTangGiam == "" || tienTangGiam == null){
                tienTangGiam = "0";
            }
            Decimal tanggiamTien = Convert.ToDecimal(tienTangGiam);
            String Select1 = "Update PackageChiTietHoaDon set TangGiamTien = @TangGiamTien where ID =@ID";
            cmd1 = new SqlCommand(Select1);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            cmd1.Parameters.AddWithValue("@TangGiamTien", tanggiamTien);
            cmd1.Parameters.AddWithValue("@ID", insertedID);
            conn.Open();
            cmd1.ExecuteNonQuery();
            conn.Close();
            String Select2 = "Update NgayHoaDon set GhiChu = @GhiChu where ID =@ID";
            cmd2 = new SqlCommand(Select2);
            cmd2.CommandType = CommandType.Text;
            cmd2.Connection = conn;
            cmd2.Parameters.AddWithValue("@GhiChu", ghichu);
            cmd2.Parameters.AddWithValue("@ID", Convert.ToInt32(ID));
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();
            return 1;
        }

        public static void deleteHoaDonSP(String ID)
        {
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select2 = "Delete  HoaDonSanPham  where ID =@ID";
            cmd = new SqlCommand(Select2);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(ID));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public static void insertHoaDonSP(String ID)
        {
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select2 = "Delete  HoaDonSanPham  where ID =@ID";
            cmd = new SqlCommand(Select2);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(ID));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public static DataTable getGoiHD()
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from HoaDonGoi";
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
            //httt
        }

        public static void saveS003InputBill(String idNHD, String ID_PTCHD, String status, String HinhThucThanhToan, String tienthu, String ghiChu)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlCommand cmd1 = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Update PackageChiTietHoaDon set HinhThucThanhToan = N'" + HinhThucThanhToan + "' where ID = " + ID_PTCHD;
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            String Select1 = "Update NgayHoaDon set TrangThai = '" + status + "', GhiChu = '" + ghiChu + "',SoTienThu = " + Convert.ToDecimal(tienthu) + " where ID =" + Convert.ToInt32(idNHD);
            //String Select1 = "Update NgayHoaDon set TrangThai = @TrangThai,GhiChu = @GhiChu,SoTienThu = @SoTienThu where ID = @ID";
            cmd1 = new SqlCommand(Select1);
            cmd1.CommandType = CommandType.Text;
            cmd1.Connection = conn;
            /*
            cmd1.Parameters.AddWithValue("@TrangThai", status);
            cmd1.Parameters.AddWithValue("@GhiChu", ghiChu);
            cmd1.Parameters.AddWithValue("@SoTienThu", Convert.ToDecimal(tienthu));
            cmd1.Parameters.AddWithValue("@ID", Convert.ToInt32(idNHD));*/
            conn.Open();
            cmd1.ExecuteNonQuery();
            conn.Close();
        }

        public static int getTachBill(String idHD, String IdCTHD, String IdPCTHD, String IdNgayHD,String ThanhTien)
        {
            SqlCommand cmd = null;
            SqlCommand cmdUpdateHoaDon = null;
            SqlCommand cmdInsertPCTHD = null;
            SqlCommand cmdUpdatePCTHD = null;
            int IdHDNew = -1;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select * from HoaDon where ID = " + idHD;
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.HoaDon obj = new DataObject.HoaDon();
                    obj.IDKhachHang = Int32.Parse(oReader["IDKhachHang"].ToString());
                    obj.IDNguon = Int32.Parse(oReader["IDNguon"].ToString());
                    obj.TongTien = Convert.ToDecimal(ThanhTien);
                    obj.TongTienThuDuoc = Convert.ToDecimal("0");
                    obj.TongTienConNo = Convert.ToDecimal("0");
                    obj.ChietKhau = Convert.ToDecimal(oReader["ChietKhau"].ToString());
                    obj.TrangThai = oReader["TrangThai"].ToString();
                    if (oReader["NgayTao"].ToString() != "" && oReader["NgayTao"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", DateTime.Now.ToShortDateString());
                        obj.NgayTao = DateTime.Parse(createDate);
                    }
                    obj.NguoiTao = oReader["NguoiTao"].ToString();
                    obj.TongSoNgay = Int32.Parse(oReader["TongSoNgay"].ToString());
                    Decimal TongTienHD = Convert.ToDecimal(oReader["TongTien"].ToString()) - Convert.ToDecimal(ThanhTien);
                    IdHDNew = InsertDataReturnId(obj);
                    conn.Close();
                    //Update Lai Tien HD
                    
                    String updateHoaDon = "Update HoaDon set TongTien = @TongTien where ID =@ID";
                    cmdUpdateHoaDon = new SqlCommand(updateHoaDon);
                    cmdUpdateHoaDon.CommandType = CommandType.Text;
                    cmdUpdateHoaDon.Connection = conn;
                    cmdUpdateHoaDon.Parameters.AddWithValue("@TongTien", TongTienHD);
                    cmdUpdateHoaDon.Parameters.AddWithValue("@ID", Convert.ToInt32(idHD));
                    conn.Open();
                    cmdUpdateHoaDon.ExecuteNonQuery();
                    conn.Close();
                    break;
                    
                }

            }
            



            String SelectChiTietHoaDon = "Select * from ChiTietHoaDon where ID = " + IdCTHD;
            cmdInsertPCTHD = new SqlCommand(SelectChiTietHoaDon);
            cmdInsertPCTHD.CommandType = CommandType.Text;
            cmdInsertPCTHD.Connection = conn;
            conn.Open();
            int IdPCTHDNew = -1;
            using (SqlDataReader oReader = cmdInsertPCTHD.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.ChiTietHoaDon obj = new DataObject.ChiTietHoaDon();
                    obj.IDHoaDon = IdHDNew;
                    obj.IdKhachHang = Int32.Parse(oReader["IdKhachHang"].ToString());
                    obj.IsMaster = 1;
                    obj.tabIndex = 1;
                    obj.TrangThai = oReader["TrangThai"].ToString();
                    IdPCTHDNew = InsertChiTietHoaDonReturnId(obj);
                    conn.Close();
                    String updatePCTHD = "Update PackageChiTietHoaDon set  IDChiTietHD = " + IdPCTHDNew + " where ID = " + IdPCTHD;
                    cmdUpdatePCTHD = new SqlCommand(updatePCTHD);
                    cmdUpdatePCTHD.CommandType = CommandType.Text;
                    cmdUpdatePCTHD.Connection = conn;
                    conn.Open();
                    cmdUpdatePCTHD.ExecuteNonQuery();
                    conn.Close();
                    break;
                }
            }
            
            return IdHDNew;
        }
        public static DataTable getLv2HD(String idHD)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select * from ChiTietHoaDon where IDHoaDon = " + idHD;
            cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }
        public static DataTable getLv3HD(String idCTHD)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "select pcthd.ID,hdg.Name from PackageChiTietHoaDon pcthd ";
            select += "left join HoaDonGoi hdg ON hdg.ID = pcthd.IDGoi where IDChiTietHD = " + idCTHD;
            cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }
        public static void insertKhachHangNgayByGoiHD(int IdPCTHD, int IdNgayHD)
        {
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "select * from PackageChiTietHoaDon pcthd ";
            Select += "left join SYS_CUSTOMER sc on sc.ID = pcthd.IDKhachHang ";
            Select += "where pcthd.ID = " + IdPCTHD;
            cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.KhachHangNgay obj = new DataObject.KhachHangNgay();
                    obj.NgayHoaDonId = IdNgayHD;
                    obj.MaQuan = oReader["MaQuan"].ToString();
                    obj.PhoneNumber = oReader["PhoneNumber"].ToString();
                    obj.Email = oReader["Email"].ToString();
                    obj.CustomerName = oReader["CustomerName"].ToString();
                    if (oReader["BirthDay"].ToString() != "" && oReader["BirthDay"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["BirthDay"].ToString());
                        obj.BirthDay = DateTime.Parse(createDate);
                    }
                    obj.Address = oReader["Address"].ToString();
                    Servies.SysCustomerServices.InsertDataKHNgayReturnId(obj);
                    conn.Close();
                    break;

                }

            }
        }

        public static DataTable loadInfoKHByHD(String ID)
        {
            //vHoaDonStep1
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "select hd.ID, sc.ID as IdKH,sc.Address,sc.BirthDay,sc.CustomerName,sc.Email,sc.MaQuan,sc.PhoneNumber from HoaDon hd  ";
            Select += " left join SYS_CUSTOMER sc on sc.ID = hd.IDKhachHang";
            Select += " where hd.ID = " + ID;
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
