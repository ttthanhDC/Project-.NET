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
            String Insert = "Update  LoTrinhShipper set ShipID = @ShipID  where ID = @ID";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ShipID", obj.ShipID);
            cmd.Parameters.AddWithValue("@TrangThai", obj.TrangThai);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }
        public static DataTable ViewLoTrinhShipper()
        {
            DataTable table = new DataTable();
            SqlCommand cmd = null;
            SqlConnection conn = Common.Connection.SqlConnect();
            String Select = "Select lst.ID, lst.ShipID , s.NAME as ShipperName , s.NUMBER as ShipperNumber , lts.MaLoTrinh ,lts.NgayTao,lts.NguoiTao,lts.TrangThai  from LoTrinhShipper lts left join SHIPER s on s.SHIPER_ID = lts.ShipID ";
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
