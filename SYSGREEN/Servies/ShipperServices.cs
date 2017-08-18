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

                String strSelect = "Select Top 1 ID NgayHoaDon  where IdlotrinhShipper = @ID";
                SqlCommand cmdStrSelect = new SqlCommand(strSelect);
                cmdStrSelect.CommandType = CommandType.Text;
                cmdStrSelect.Connection = conn;
                cmdUpdateNHD.Parameters.AddWithValue("@ID", obj.ID);
                conn.Open();
                object insertedID = cmdUpdateNHD.ExecuteScalar();
                cmdUpdateNHD.Connection.Close();
                conn.Close();

                SqlConnection Pconn = Common.Connection.SqlConnect();
                Pconn.Open();
                SqlCommand Pcmd = new SqlCommand("AutoUpdateStatusHD", Pconn);
                Pcmd.CommandType = CommandType.StoredProcedure;
                Pcmd.Parameters.Add(new SqlParameter("@IDNHD", Convert.ToInt32(insertedID)));
                Pcmd.ExecuteReader();
                Pconn.Close();

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
                Select += "s.NAME LIKE N'%" + ShipName + "%' AND ";
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
                    Select += "CONVERT(varchar(10), DAY(lts.NgayTao)) = '" + words[0] + "' AND ";
                }
                else if (words.Length == 2)
                {
                    Select += "CONVERT(varchar(10), DAY(lts.NgayTao)) + '/' + CONVERT(varchar(10), MONTH(lts.NgayTao)) = '" + words[0] + "/" + words[1] + "' AND ";
                }
                else if (words.Length == 3)
                {
                    Select += "convert(date,CONVERT(VARCHAR(10),lts.NgayTao , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + NgayLotrinh + "' , 103),103) AND ";
                }
            }
            Select += " 1=1 ORDER BY lts.NgayTao desc , lts.MaLoTrinh desc";
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
            String Select  = "Select * from  SHIPER Where  ";
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
