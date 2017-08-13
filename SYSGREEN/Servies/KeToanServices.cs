using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class KeToanServices
    {

        /************* Insert các bảng kế toán **********/
        public static int InsertKeToanReturnId(String Ngay)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            int countId = 0;
            String select = "Select count(*) from KeToan where convert(date,CONVERT(VARCHAR(10),Ngay , 101),101) = convert(date,CONVERT(VARCHAR(10),'" + Ngay.ToString() + "' , 101),101)";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            object count = cmdSelect.ExecuteScalar();
            conn.Close();
            countId = Convert.ToInt16(count);
            if (countId == 0)
            {
                String Insert = "INSERT INTO KeToan (Ngay) VALUES (@Ngay);Select @@IDENTITY as newId";

                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", Convert.ToDateTime(Ngay));
                conn.Open();
                object insertedID = cmd.ExecuteScalar();
                cmd.Connection.Close();
                conn.Close();
                return Convert.ToInt32(insertedID);
            }

            return 0;
        }
        public static int InsertChiTietThuReturnId(DataObject.ChiTietThu obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            int countId = 0;
            String select = "Select count(*) from ChiTietThu where IdNgayHD = " + obj.IdNgayHD;
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            object count = cmdSelect.ExecuteScalar();
            countId = Convert.ToInt16(count);
            conn.Close();
            if (countId == 0)
            {
                String Insert = "INSERT INTO ChiTietThu (Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan) VALUES (@Ngay,@IdNgayHD,@SoTien,@MaNganHang,@MaGiaoDich,@TinhTrang,@GhiChu,@LoaiThu,@NgayTao,@NguoiTao,@IdKeToan);Select @@IDENTITY as newId";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmd.Parameters.AddWithValue("@IdNgayHD", obj.IdNgayHD);
                cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
                cmd.Parameters.AddWithValue("@MaNganHang", obj.MaNganHang);
                cmd.Parameters.AddWithValue("@MaGiaoDich", obj.MaGiaoDich);
                cmd.Parameters.AddWithValue("@TinhTrang", obj.TinhTrang);
                cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmd.Parameters.AddWithValue("@LoaiThu", obj.LoaiThu);
                cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
                cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
                cmd.Parameters.AddWithValue("@IdKeToan", obj.IdKeToan);
                conn.Open();
                object insertedID = cmd.ExecuteScalar();
                cmd.Connection.Close();
                conn.Close();
                return Convert.ToInt32(insertedID);
            }
            else
            {
                String Insert = "Update ChiTietThu SET Ngay = @Ngay ,SoTien = @SoTien ,MaNganHang = @MaNganHang ,MaGiaoDich = @MaGiaoDich ,TinhTrang = @TinhTrang ,GhiChu = @GhiChu where IdNgayHD = @IdNgayHD";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
                cmd.Parameters.AddWithValue("@MaNganHang", obj.MaNganHang);
                cmd.Parameters.AddWithValue("@MaGiaoDich", obj.MaGiaoDich);
                cmd.Parameters.AddWithValue("@TinhTrang", obj.TinhTrang);
                cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmd.Parameters.AddWithValue("@IdNgayHD", obj.IdNgayHD);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                conn.Close();
                return obj.ID;
            }
            
        }

        public static int InsertChiTietChiReturnId(DataObject.ChiTietChi obj)
        {

            SqlConnection conn = Common.Connection.SqlConnect();
            int countId = 0;
            String select = "Select count(*) from ChiTietChi where ID = " + obj.ID;
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            object count = cmdSelect.ExecuteScalar();
            countId = Convert.ToInt16(count);
            conn.Close();
            if (countId == 0)
            {
                String Insert = "INSERT INTO ChiTietChi (Ngay,NoiDungChi,SoTien,MaNganHang,GhiChu,NguoiTao,NgayTao,IdKeToan) VALUES (@Ngay,@NoiDungChi,@SoTien,@MaNganHang,@GhiChu,@NguoiTao,@NgayTao,@IdKeToan);Select @@IDENTITY as newId";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmd.Parameters.AddWithValue("@NoiDungChi", obj.NoiDungChi);
                cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
                cmd.Parameters.AddWithValue("@MaNganHang", obj.MaNganHang);
                cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
                cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
                cmd.Parameters.AddWithValue("@IdKeToan", obj.IdKeToan);
                conn.Open();
                object insertedID = cmd.ExecuteScalar();
                cmd.Connection.Close();
                conn.Close();
                return Convert.ToInt32(insertedID);
            }
            else
            {
                String Insert = "Update ChiTietChi SET Ngay = @Ngay ,NoiDungChi = @NoiDungChi ,SoTien = @SoTien ,MaNganHang = @MaNganHang ,GhiChu = @GhiChu where ID = @ID";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmd.Parameters.AddWithValue("@NoiDungChi", obj.NoiDungChi);
                cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
                cmd.Parameters.AddWithValue("@MaNganHang", obj.MaNganHang);
                cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmd.Parameters.AddWithValue("@ID", obj.ID);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                conn.Close();
                return obj.ID;
            }
            
        }

        public static int InsertLuuChuyenDongTienReturnId(DataObject.LuuChuyenDongTien obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            int countId = 0;
            String select = "Select count(*) from LuuChuyenDongTien where ID = " + obj.ID;
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            object count = cmdSelect.ExecuteScalar();
            countId = Convert.ToInt16(count);
            conn.Close();
            if (countId == 0)
            {
                String Insert = "INSERT INTO LuuChuyenDongTien (Ngay,SoTien,MaNganHangChi,MaNganHangThu,GhiChu,NguoiTao,NgayTao,IdKeToan) VALUES (@Ngay,@SoTien,@MaNganHangChi,@MaNganHangThu,@GhiChu,@NguoiTao,@NgayTao,@IdKeToan);Select @@IDENTITY as newId";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
                cmd.Parameters.AddWithValue("@MaNganHangChi", obj.MaNganHangChi);
                cmd.Parameters.AddWithValue("@MaNganHangThu", obj.MaNganHangThu);
                cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
                cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
                cmd.Parameters.AddWithValue("@IdKeToan", obj.IdKeToan);
                conn.Open();
                object insertedID = cmd.ExecuteScalar();
                cmd.Connection.Close();
                conn.Close();
                return Convert.ToInt32(insertedID);
            }
            else
            {
                String Insert = "Update LuuChuyenDongTien SET Ngay = @Ngay ,SoTien = @SoTien ,MaNganHangChi = @MaNganHangChi ,MaNganHangThu = @MaNganHangThu ,GhiChu = @GhiChu where ID = @ID";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
                cmd.Parameters.AddWithValue("@MaNganHangChi", obj.MaNganHangChi);
                cmd.Parameters.AddWithValue("@MaNganHangThu", obj.MaNganHangThu);
                cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmd.Parameters.AddWithValue("@ID", obj.ID);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                conn.Close();
                return obj.ID;
            }
            
        }

        public static DataTable viewManHinhLuuChuyenDongTien(String Ngay)
        {
            DataTable dt = new DataTable();
            String Select = "Select * from LuuChuyenDongTien where ";
            if (Ngay != null && Ngay != "")
            {
               Select += "convert(date,CONVERT(VARCHAR(10),x.Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "' , 103),103) AND ";
            }
            Select += " 1 = 1";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            cmd.Connection.Close();
            conn.Close();
            return dt;
        }

        public static DataTable viewManHinhChi(String Ngay)
        {
            DataTable dt = new DataTable();
            String Select = "Select * from ChiTietChi where ";
            if (Ngay != null && Ngay != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),x.Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "' , 103),103) AND ";
            }
            Select += " 1 = 1";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            cmd.Connection.Close();
            conn.Close();
            return dt;
        }


        /************* Update bảng kế toán **********/
        public static int UpdatteChiTietThuReturnId(DataObject.LuuChuyenDongTien obj)
        {
            String Insert = "INSERT INTO ChiTietThu (Ngay,IdNgayHD,SoTien,MaNganHang,MaGiaoDich,TinhTrang,GhiChu,LoaiThu,NgayTao,NguoiTao,IdKeToan) VALUES (@Ngay,@IdNgayHD,@SoTien,@MaNganHang,@MaGiaoDich,@TinhTrang,@GhiChu,@LoaiThu,@NgayTao,@NguoiTao,@IdKeToan);Select @@IDENTITY as newId";
            String Update = " Update ChiTietThu Set SoTien = @SoTien ,";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Ngay", obj.Ngay);
            cmd.Parameters.AddWithValue("@SoTien", obj.SoTien);
            cmd.Parameters.AddWithValue("@MaNganHangChi", obj.MaNganHangChi);
            cmd.Parameters.AddWithValue("@MaNganHangThu", obj.MaNganHangThu);
            cmd.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
            cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
            cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
            cmd.Parameters.AddWithValue("@IdKeToan", obj.IdKeToan);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }


        public static DataTable viewManHinhThuCK(String Ngay)
        {
            DataTable table = new DataTable();
            String Select = "select x.ID_PTCHD,x.TenKH_HD,x.Ngay,x.TongTien as TongTienGoi,x.ID_NHD,ctt.* from vHoaDonShiper x  ";
            Select += " left join ChiTietThu ctt on x.ID_NHD = ctt.IdNgayHD Where ";
            Select += " HinhTHucThanhToan = N'Chuyển khoản' AND ";
            if (Ngay != null && Ngay != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),x.Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "' , 103),103) AND ";
            }
            Select += "1=1 ORDER BY x.ID_PTCHD asc, x.Ngay asc";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DataTable viewManHinhThuTM(String Ngay)
        {
            DataTable table = new DataTable();
            String Select = "select x.ID_PTCHD,x.TenKH_HD,x.Ngay,x.TongTien as TongTienGoi,x.ID_NHD,ctt.* from vHoaDonShiper x  ";
            Select += " left join ChiTietThu ctt on x.ID_NHD = ctt.IdNgayHD Where ";
            Select += " HinhTHucThanhToan != N'Chuyển khoản' AND ";
            if (Ngay != null && Ngay != "")
            {
                Select += "convert(date,CONVERT(VARCHAR(10),x.Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "' , 103),103) AND ";
            }
            Select += "1=1 ORDER BY x.ID_PTCHD asc, x.Ngay asc";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            return table;
        }

        public static DateTime GetLastDayOfMonth(int iMonth)
        {
            DateTime dtResult = new DateTime(DateTime.Now.Year, iMonth, 1);
            dtResult = dtResult.AddMonths(1);
            dtResult = dtResult.AddDays(-(dtResult.Day));
            String createDate = String.Format("{0:dd/MM/yyyy}", dtResult.ToString());
            return DateTime.Parse(createDate);
        }

        public static List<DataObject.KeToanTongHop> viewKeToanTongHopKy(int flag)
        {
            DataTable table = new DataTable();
            String Insert = "Select * from NganHang";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            table.Load(cmd.ExecuteReader());
            conn.Close();
            String startMonth = "";
            String endMonth = "";
            if (DateTime.Now.Month == 1)
            {
                if (flag == 0)
                {
                    startMonth = "1/12/" + (DateTime.Now.Year - 1);
                    DateTime dtResult = new DateTime(DateTime.Now.Year - 1, 12, 1);
                    dtResult = dtResult.AddMonths(1);
                    dtResult = dtResult.AddDays(-(dtResult.Day));
                    endMonth = dtResult.ToString();
                    String createDate = String.Format("{0:dd/MM/yyyy}", dtResult.ToString());
                    endMonth = DateTime.Parse(createDate).ToString();
                }
                else
                {
                    startMonth = "1/1/" + (DateTime.Now.Year);
                    DateTime dtResult = new DateTime(DateTime.Now.Year,1, 1);
                    dtResult = dtResult.AddMonths(1);
                    dtResult = dtResult.AddDays(-(dtResult.Day));
                    endMonth = dtResult.ToString();
                    String createDate = String.Format("{0:dd/MM/yyyy}", dtResult.ToString());
                    endMonth = dtResult.Day + "/" + dtResult.Month + "/" + dtResult.Year;
                }
            }
            else
            {
                if (flag == 0)
                {
                    startMonth = "01/" + (DateTime.Now.Month - 1) + "/" + DateTime.Now.Year;
                    DateTime dtResult = GetLastDayOfMonth(DateTime.Now.Month - 1);
                    endMonth = dtResult.Day + "/" + dtResult.Month + "/" + dtResult.Year;
                }
                else
                {
                    startMonth = "01/" + (DateTime.Now.Month) + "/" + DateTime.Now.Year;
                    DateTime dtResult = GetLastDayOfMonth(DateTime.Now.Month);
                    endMonth = dtResult.Day + "/" + dtResult.Month + "/" + dtResult.Year;
                }
            }
            
            List<DataObject.KeToanTongHop> lst = new  List<DataObject.KeToanTongHop>();
            for (int i = 0; i < table.Rows.Count; i++)
            {
                DataTable dt = new DataTable();
                DataObject.KeToanTongHop ktth = new DataObject.KeToanTongHop();
                String Select = "Select * from fKeToanTongHop("+ table.Rows[i][0]+",'"+ startMonth + "','"+ endMonth.ToString() +"')";
                SqlCommand cmdKTTH = new SqlCommand(Select);
                cmdKTTH.CommandType = CommandType.Text;
                cmdKTTH.Connection = conn;
                conn.Open();
                dt.Load(cmdKTTH.ExecuteReader());
                conn.Close();
                ktth.TaiKhoan = table.Rows[i][1] != null ? Convert.ToString(table.Rows[i][1]) : "";
                ktth.SoTienThu = dt.Rows[0][0] != null ? Convert.ToString(dt.Rows[0][0]) : "0";
                ktth.SoTienChi = dt.Rows[0][1] != null ? Convert.ToString(dt.Rows[0][1]) : "0";
                ktth.SoTienLuuChuyenThu = dt.Rows[0][0] != null ? Convert.ToString(dt.Rows[0][2]) : "0";
                ktth.SoTienLuuChuyenChi = dt.Rows[0][0] != null ? Convert.ToString(dt.Rows[0][3]) : "0";
                lst.Add(ktth);
            }
            return lst;
           // return Convert.ToInt32(insertedID);
        } 

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
        public static int UpdateLoTrinhShipper(DataObject.LoTrinhShipper obj)
        {
            // 1 : Lưu thành công
            // 2 : Lưu thông tin không thành công trạng thái đang xử lý
            // 3 : Lưu thông tin không thành công trạng thái hoàn thành
            // 4  : Lưu thông tin không thành công trạng thái Đang xử lý về Chưa xử lý 
            SqlConnection conn = Common.Connection.SqlConnect();
            String getTrangThaiLoTrinh = "Select TrangThai FROM LoTrinhShipper  where ID = @ID";
            SqlCommand cmdGetTrangThai = new SqlCommand(getTrangThaiLoTrinh);
            cmdGetTrangThai.CommandType = CommandType.Text;
            cmdGetTrangThai.Connection = conn;
            cmdGetTrangThai.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            object trangthaiLT = cmdGetTrangThai.ExecuteScalar();
            conn.Close();
            String statusLT = (String)trangthaiLT;

            String strCheck = "SELECT dbo.fCheckStatusLoTrinh(" + obj.ID + ",'" + obj.TrangThai + "') AS MyResult";
            SqlCommand cmdCheck = new SqlCommand(strCheck);
            cmdCheck.CommandType = CommandType.Text;
            cmdCheck.Connection = conn;
            conn.Open();
            object checkTT = cmdCheck.ExecuteScalar();
            conn.Close();
            int result = Convert.ToInt16(checkTT);
            if (statusLT == "Chưa xử lý" && obj.TrangThai == "Đang xử lý")
            {
                //SELECT dbo.fCheckStatusLoTrinh(1,'Chưa xử lý') AS MyResult

                String Insert = "Update  LoTrinhShipper set  TrangThai= @TrangThai  where ID = @ID";
                SqlCommand cmd = new SqlCommand(Insert);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
                cmd.Parameters.AddWithValue("@ID", obj.ID);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                conn.Close();

                String strUpdateNHD = "Update  NgayHoaDon set  TrangThai= @TrangThai  where IdlotrinhShipper = @ID";
                SqlCommand cmdUpdateNHD = new SqlCommand(strUpdateNHD);
                cmdUpdateNHD.CommandType = CommandType.Text;
                cmdUpdateNHD.Connection = conn;
                cmdUpdateNHD.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
                cmdUpdateNHD.Parameters.AddWithValue("@ID", obj.ID);
                conn.Open();
                cmdUpdateNHD.ExecuteNonQuery();
                cmdUpdateNHD.Connection.Close();
                conn.Close();
            }
            else if (statusLT == "Đang xử lý" && obj.TrangThai == "Hoàn thành")
            {
                if (result != 0)
                {
                    String Insert = "Update  LoTrinhShipper set  TrangThai= @TrangThai  where ID = @ID";
                    SqlCommand cmd = new SqlCommand(Insert);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
                    cmd.Parameters.AddWithValue("@ID", obj.ID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    conn.Close();
                    return 1;
                }
                else
                {
                    return 3;
                }
            }
            else if (statusLT == "Đang xử lý" && obj.TrangThai == "Chưa xử lý")
            {
                return 4;
            }
            else if (statusLT == "Hoàn thành" && obj.TrangThai != "Hoàn thành")
            {
                return 5;
            }
            else if (statusLT == "Chưa xử lý" && obj.TrangThai == "Chưa xử lý")
            {
                return 1;
            }
            return 1;
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
                    Select += "CONVERT(varchar(10), DAY(NgayTao)) = '" + words[0] + "' AND ";
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
        public static int InsertShipperReturnId(DataObject.Shiper obj)
        {
            String Insert = "INSERT INTO SHIPER (NAME,DiaChi,SoDienThoai,DESCRIPTION,NguoiTao,NgayTao) VALUES (@NAME,@DiaChi,@SoDienThoai,@DESCRIPTION,@NguoiTao,@NgayTao);Select @@IDENTITY as newId";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@NAME", obj.NAME);
            cmd.Parameters.AddWithValue("@DiaChi", obj.DiaChi);
            cmd.Parameters.AddWithValue("@SoDienThoai", obj.SoDienThoai);
            cmd.Parameters.AddWithValue("@DESCRIPTION", obj.DESCRIPTION);
            cmd.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
            cmd.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }
        public static void UpdateShipperReturnId(DataObject.Shiper obj)
        {
            String Insert = "Update SHIPER SET NAME = @NAME,DiaChi = @DiaChi,SoDienThoai = @SoDienThoai,DESCRIPTION = @DESCRIPTION where SHIPER_ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@NAME", obj.NAME);
            cmd.Parameters.AddWithValue("@DiaChi", obj.DiaChi);
            cmd.Parameters.AddWithValue("@SoDienThoai", obj.SoDienThoai);
            cmd.Parameters.AddWithValue("@DESCRIPTION", obj.DESCRIPTION);
            cmd.Parameters.AddWithValue("@ID", obj.SHIPER_ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            conn.Close();
        }

        public static DataTable getDataShipper(DataObject.Shiper obj)
        {

            DataTable table = new DataTable();
            String Select = "Select * from  SHIPER Where  ";
            if (obj.SHIPER_ID != null && obj.SHIPER_ID > 0)
            {
                Select += "SHIPER_ID =" + obj.SHIPER_ID + " AND ";
            }
            if (obj.NAME != null && obj.NAME != "")
            {
                Select += "NAME LIKE N'%" + obj.NAME + "%' AND ";

            }

            Select += "1=1 ORDER BY SHIPER_ID DESC";
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
