﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class KhoServices
    {
        public static List<DataObject.Kho001> viewK001P1(String Ngay, String thu)
        {
            List<DataObject.Kho001> lst = new List<DataObject.Kho001>();
            SqlConnection conn = Common.Connection.SqlConnect();
            String checkStr = "Select sm.*,sp.Product_Name,sp.Product_Code  from SYS_MENU sm ";
            checkStr += "LEFT JOIN SYS_PRODUCT sp ON sp.ID = sm.PRODUCT_ID ";
            checkStr += " where sm.Code = '" + thu + "'";
            SqlCommand cmd = new SqlCommand(checkStr);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.Kho001 obj = new DataObject.Kho001();
                    DataObject.Kho001 obj1 = new DataObject.Kho001();
                    obj.LoaiSua = oReader["Product_Name"].ToString();
                    obj.ProductId = Convert.ToInt16(oReader["PRODUCT_ID"].ToString());

                    obj1.LoaiSua = oReader["Product_Name"].ToString();
                    obj1.ProductId = Convert.ToInt16(oReader["PRODUCT_ID"].ToString());
                    String productCode = oReader["Product_Code"].ToString();
                    
                    /*** Không đường ****/
                    String strCheck = "SELECT * FROM fK001 ('" + productCode + "','" + Ngay + "',0) AS MyResult";
                    DataTable dt = new DataTable();
                    SqlConnection connF = Common.Connection.SqlConnect();
                    SqlCommand cmdCheck = new SqlCommand(strCheck);
                    cmdCheck.CommandType = CommandType.Text;
                    cmdCheck.Connection = connF;
                    connF.Open();
                    dt.Load(cmdCheck.ExecuteReader());
                    connF.Close();
                    if (dt.Rows.Count > 0)
                    {
                        obj.SoLuongChai = dt.Rows[0][0].ToString() != "" ? Int32.Parse(dt.Rows[0][0].ToString()) : 0;
                        obj.TheTich = dt.Rows[0][1].ToString() != "" ? Int32.Parse(dt.Rows[0][1].ToString()) : 0;
                        obj.sugar = dt.Rows[0][2].ToString() != "" ? (Int32.Parse(dt.Rows[0][2].ToString()) > 0 ? 1 : 0) : 0;
                    }
                    /*** Có đường ****/

                    String strSurgar = "SELECT * FROM fK001 ('" + productCode + "','" + Ngay + "',1) AS MyResult";
                    DataTable dtSurgar = new DataTable();
                    SqlConnection connSurgar = Common.Connection.SqlConnect();
                    SqlCommand cmdSurgar = new SqlCommand(strSurgar);
                    cmdSurgar.CommandType = CommandType.Text;
                    cmdSurgar.Connection = connSurgar;
                    connSurgar.Open();
                    dtSurgar.Load(cmdSurgar.ExecuteReader());
                    connSurgar.Close();
                    if (dtSurgar.Rows.Count > 0)
                    {
                        obj1.SoLuongChai = dtSurgar.Rows[0][0].ToString() != "" ? Int32.Parse(dtSurgar.Rows[0][0].ToString()) : 0;
                        obj1.TheTich = dtSurgar.Rows[0][1].ToString() != "" ? Int32.Parse(dtSurgar.Rows[0][1].ToString()) : 0;
                        obj1.sugar = dtSurgar.Rows[0][2].ToString() != "" ? (Int32.Parse(dtSurgar.Rows[0][2].ToString()) > 0 ? 1 : 0) : 0;
                    }
                    lst.Add(obj);
                    lst.Add(obj1);
                }

            }
            conn.Close();
            return lst;
        }

        public static List<DataObject.Kho001> viewSPCL(String Ngay, String thu)
        {
            /*** Get Sữa Tồn ngày hôm trước *****/
            List<DataObject.Kho001> lst = new List<DataObject.Kho001>();
            SqlConnection conn = Common.Connection.SqlConnect();
            DateTime d = DateTime.ParseExact(Ngay, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime ngayHomTruoc = d.AddDays(-1);
            String strNgayHomTruoc = ngayHomTruoc.ToString("dd/MM/yyyy");
            int dayOfWeek = Convert.ToInt32(ngayHomTruoc.DayOfWeek);
            String strDay = "Select k.*,sp.Product_Name,sp.Product_Code  from Kho001 k ";
            strDay += "LEFT JOIN SYS_PRODUCT sp ON sp.ID = k.Product_ID ";
            strDay += " where convert(date,CONVERT(VARCHAR(10),k.Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + strNgayHomTruoc + "', 103),103)";
            SqlCommand cmdDay = new SqlCommand(strDay);
            cmdDay.CommandType = CommandType.Text;
            cmdDay.Connection = conn;
            conn.Open();
            using (SqlDataReader oReader = cmdDay.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.Kho001 obj = new DataObject.Kho001();
                    obj.LoaiSua = oReader["Product_Name"].ToString();
                    String productCode = oReader["Product_Code"].ToString();
                    String strCheck = "SELECT * FROM fK001P1 ('" + productCode + "','" + strDay + "') AS MyResult";
                    DataTable dt = new DataTable();
                    SqlConnection connF = Common.Connection.SqlConnect();
                    SqlCommand cmdCheck = new SqlCommand(strCheck);
                    cmdCheck.CommandType = CommandType.Text;
                    cmdCheck.Connection = connF;
                    connF.Open();
                    dt.Load(cmdCheck.ExecuteReader());
                    connF.Close();
                    int thetich = Convert.ToInt16(oReader["Product_Unit"].ToString());
                    if (dt.Rows.Count > 0)
                    {
                        obj.SoLuongChai = 0;
                        obj.TheTich = dt.Rows[0][1].ToString() != "" ? (thetich - Int32.Parse(dt.Rows[0][1].ToString())) : 0;
                        obj.sugar = 0;
                    }
                    else
                    {
                        obj.TheTich = 0;
                    }
                    if (obj.TheTich > 0)
                    {
                        lst.Add(obj);
                    }

                }
            }
            conn.Close();
            return lst;
        }

        public static void insertOrUpdateViewK001(String Ngay, String ID,String productName,String ProductId,String productUnit,String productUnit_DK,String productUnit_CL)
        {
            String select = "Select count(*) from Kho001 where convert(date,CONVERT(VARCHAR(10),Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "', 103),103) ";
            int check = 0;
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            object count = cmd.ExecuteScalar();
            conn.Close();
            check = Convert.ToInt16(count);
            if (check > 0)
            {
                String update = "Update Kho001 Set Product_Unit = @productUnit , Product_Unit_DK = @productUnit_DK , Product_Unit_CL = @productUnit_CL  where ID = @ID";
                SqlCommand cmdUpdate = new SqlCommand(update);
                cmdUpdate.CommandType = CommandType.Text;
                cmdUpdate.Connection = conn;
                cmdUpdate.Parameters.AddWithValue("@productUnit", Convert.ToInt16(productUnit));
                cmdUpdate.Parameters.AddWithValue("@productUnit_DK", Convert.ToInt16(productUnit_DK));
                cmdUpdate.Parameters.AddWithValue("@productUnit_CL", Convert.ToInt16(productUnit_CL));
                cmdUpdate.Parameters.AddWithValue("@ID", Convert.ToInt16(ID));
                conn.Open();
                cmdUpdate.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                String update = "Insert INTO  Kho001 (Product_Name,Product_ID,Product_Unit,Product_Unit_DK,Product_Unit_CL,Ngay)VALUES (@Product_Name,@Product_ID,@Product_Unit,@Product_Unit_DK,@Product_Unit_CL,@Ngay)";
                SqlCommand cmdUpdate = new SqlCommand(update);
                cmdUpdate.CommandType = CommandType.Text;
                cmdUpdate.Connection = conn;
                cmdUpdate.Parameters.AddWithValue("@Product_Name", productName);
                cmdUpdate.Parameters.AddWithValue("@Product_ID", Convert.ToInt16(ProductId));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit", Convert.ToInt16(productUnit));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit_DK", Convert.ToInt16(productUnit_DK));
                cmdUpdate.Parameters.AddWithValue("@Product_Unit_CL", Convert.ToInt16(productUnit_CL));
                cmdUpdate.Parameters.AddWithValue("@Ngay", DateTime.ParseExact(Ngay, "dd/MM/yyyy", CultureInfo.InvariantCulture));
                conn.Open();
                cmdUpdate.ExecuteNonQuery();
                conn.Close();
            }
            
        }

        public static DataTable viewK001P2(String Ngay)
        {
            DataTable dt = new DataTable();
            String select = "Select * from Kho001 where convert(date,CONVERT(VARCHAR(10),Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),'" + Ngay + "', 103),103) ";
            SqlConnection conn = Common.Connection.SqlConnect();
            SqlCommand cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            return dt;
        }
        public static List<DataObject.Kho002> viewK002(String TuNgay, String DenNgay)
        {

            List<DataObject.Kho002> lst = new List<DataObject.Kho002>();
            DateTime tNgay = DateTime.ParseExact(TuNgay, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime dNgay = DateTime.ParseExact(DenNgay, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            string[] dates = Enumerable.Range(0, 1 + dNgay.Subtract(tNgay).Days)
           .Select(i => tNgay.AddDays(i).ToString("dd/MM/yyyy"))
           .ToArray();
            for (int i = 0; i < dates.Length; i++)
            {
                DataObject.Kho002 obj = new DataObject.Kho002();
                obj.Ngay = dates[i];
                String strCheck = "SELECT * FROM fK002 ('" + dates[i] + "') AS MyResult";
                DataTable dt = new DataTable();
                SqlConnection connF = Common.Connection.SqlConnect();
                SqlCommand cmdCheck = new SqlCommand(strCheck);
                cmdCheck.CommandType = CommandType.Text;
                cmdCheck.Connection = connF;
                connF.Open();
                dt.Load(cmdCheck.ExecuteReader());
                connF.Close();
                if (dt.Rows.Count > 0)
                {
                    obj.SoLuongChai325 = dt.Rows[0][0].ToString() != "" ? Int32.Parse(dt.Rows[0][0].ToString()) : 0;
                    obj.SoLuongChai550 = dt.Rows[0][1].ToString() != "" ? Int32.Parse(dt.Rows[0][1].ToString()) : 0;
                    obj.SoLuongChai1000 = dt.Rows[0][2].ToString() != "" ? Int32.Parse(dt.Rows[0][2].ToString()) : 0;
                    obj.TheTich = (obj.SoLuongChai325 * 325) + (obj.SoLuongChai550 * 550) + (obj.SoLuongChai1000 * 1000);
                    lst.Add(obj);
                }

            }

            return lst;
        }

        public static int InsertKho003ReturnID(DataObject.Kho003 obj)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            int check = 0;
            String select = "Select count(*) Kho003 where ID = " + obj.ID;
            SqlCommand cmd = new SqlCommand(select);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();
            object count = cmd.ExecuteScalar();
            conn.Close();
            check = Convert.ToInt16(count);
            if (check > 0)
            {
                String insert = "Update Kho003 SET  NhaCungCap = @NhaCungCap,Ten = @Ten ,SoDT = @SoDT ,DiaChi = @DiaChi ,Ngay = @Ngay ,Kho = @Kho,GhiChu = @GhiChu where ID = @ID";
                SqlCommand cmdInsert = new SqlCommand(insert);
                cmdInsert.CommandType = CommandType.Text;
                cmdInsert.Connection = conn;
                cmdInsert.Parameters.AddWithValue("@NhaCungCap", obj.NhaCungCap);
                cmdInsert.Parameters.AddWithValue("@Ten", obj.Ten);
                cmdInsert.Parameters.AddWithValue("@SoDT", obj.SoDT);
                cmdInsert.Parameters.AddWithValue("@DiaChi", obj.DiaChi);
                cmdInsert.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmdInsert.Parameters.AddWithValue("@Kho", obj.Kho);
                cmdInsert.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmdInsert.Parameters.AddWithValue("@ID", obj.ID);
                conn.Open();
                cmdInsert.ExecuteNonQuery();
                conn.Close();
                return obj.ID;
            }
            else
            {
                String insert = "Insert into Kho003 (NhaCungCap,Ten,SoDT,DiaChi,Ngay,Kho,GhiChu,NgayTao,NguoiTao) Values(@NhaCungCap,@Ten,@SoDT,@DiaChi,@Ngay,@Kho,@GhiChu,@NgayTao,@NguoiTao);Select @@IDENTITY as newId";
                SqlCommand cmdInsert = new SqlCommand(insert);
                cmdInsert.CommandType = CommandType.Text;
                cmdInsert.Connection = conn;
                cmdInsert.Parameters.AddWithValue("@NhaCungCap",obj.NhaCungCap);
                cmdInsert.Parameters.AddWithValue("@Ten", obj.Ten);
                cmdInsert.Parameters.AddWithValue("@SoDT", obj.SoDT);
                cmdInsert.Parameters.AddWithValue("@DiaChi", obj.DiaChi);
                cmdInsert.Parameters.AddWithValue("@Ngay", obj.Ngay);
                cmdInsert.Parameters.AddWithValue("@Kho", obj.Kho);
                cmdInsert.Parameters.AddWithValue("@GhiChu", obj.GhiChu);
                cmdInsert.Parameters.AddWithValue("@NgayTao", obj.NgayTao);
                cmdInsert.Parameters.AddWithValue("@NguoiTao", obj.NguoiTao);
                conn.Open();
                object Id = cmdInsert.ExecuteScalar();
                conn.Close();
                return Convert.ToInt16(Id);
            }
        }

    }
}
