using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class SysPromotionServices
    {
        public static void InsertData(DataObject.SysPromotion obj)
        {
            String Insert = "INSERT INTO SYS_PROMOTION (ORG_ID,Min,Max,Date_Start,Date_End,Code,Name,Promotion_Percent,Amount_VND,Amount_FreeShip,Create_User,Create_Date) VALUES ";
            Insert += "(@ORG_ID,@Min,@Max,@Date_Start,@Date_End,@Code,@Name,@Promotion_Percent,@Amount_VND,@Amount_FreeShip,@Create_User,@Create_Date)";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ORG_ID", obj.ORG_ID);
            cmd.Parameters.AddWithValue("@Min", obj.Min);
            cmd.Parameters.AddWithValue("@Max", obj.Max);
            cmd.Parameters.AddWithValue("@Date_Start", obj.Date_Start);
            cmd.Parameters.AddWithValue("@Date_End", obj.Date_End);
            cmd.Parameters.AddWithValue("@Code", obj.Code);
            cmd.Parameters.AddWithValue("@Name", obj.Name);
            cmd.Parameters.AddWithValue("@Promotion_Percent", obj.Promotion_Percent);
            cmd.Parameters.AddWithValue("@Amount_VND", obj.Amount_VND);
            cmd.Parameters.AddWithValue("@Amount_FreeShip", obj.Amount_FreeShip);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            cmd.ExecuteNonQuery();
            Common.Connection.Close();
        }

        public static void UpdateData(DataObject.SysPromotion obj)
        {
            Common.Connection.Close();
            Common.Connection.Open();
            String Update = "UPDATE SYS_PROMOTION SET ORG_ID = @ORG_ID, Min = @Min, ";
            Update += "Max = @Max, Date_Start = @Date_Start, Date_End = @Date_End, ";
            Update += "Code = @Code, Name = @Name, Promotion_Percent = @Promotion_Percent, Amount_VND = @Amount_VND, Amount_FreeShip= @Amount_FreeShip ";
            Update += " Where ID = @ID";
            SqlCommand cmd = new SqlCommand(Update);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ORG_ID", obj.ORG_ID);
            cmd.Parameters.AddWithValue("@Min", obj.Min);
            cmd.Parameters.AddWithValue("@Max", obj.Max);
            cmd.Parameters.AddWithValue("@Date_Start", obj.Date_Start);
            cmd.Parameters.AddWithValue("@Date_End", obj.Date_End);
            cmd.Parameters.AddWithValue("@Code", obj.Code);
            cmd.Parameters.AddWithValue("@Name", obj.Name);
            cmd.Parameters.AddWithValue("@Promotion_Percent", obj.Promotion_Percent);
            cmd.Parameters.AddWithValue("@Amount_VND", obj.Amount_VND);
            cmd.Parameters.AddWithValue("@Amount_FreeShip", obj.Amount_FreeShip);
            cmd.Parameters.AddWithValue("@Create_User", obj.Create_User);
            cmd.Parameters.AddWithValue("@Create_Date", obj.Create_Date);
            cmd.Parameters.AddWithValue("@ID", obj.ID);
            cmd.ExecuteNonQuery();
        }

        public static void DeleteData(Int32 Id)
        {
            String Delete = "Delete from  SYS_PROMOTION Where ID = @ID";
            Common.Connection.Close();
            Common.Connection.Open();
            SqlCommand cmd = new SqlCommand(Delete);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = Common.Connection.SqlConnect();
            cmd.Parameters.AddWithValue("@ID", Id);
            cmd.ExecuteNonQuery();
        }

        public static List<DataObject.SysPromotion> GetData(Int32 Id)
        {
            List<DataObject.SysPromotion> lstSysPromotion = new List<DataObject.SysPromotion>();
            String Select = "";
            SqlCommand cmd = null;
            Common.Connection.Close();
            Common.Connection.Open();
            if (Id > 0)
            {
                Select = "Select * from SYS_PROMOTION Where ID = @ID";

                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
                cmd.Parameters.AddWithValue("@ID", Id);
            }
            else
            {
                Select = "Select * from SYS_PROMOTION";
                cmd = new SqlCommand(Select);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = Common.Connection.SqlConnect();
            }
            using (SqlDataReader oReader = cmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    DataObject.SysPromotion obj = new DataObject.SysPromotion();
                    obj.ID = Int32.Parse(oReader["ID"].ToString());
                    obj.ORG_ID = Int32.Parse(oReader["ORG_ID"].ToString());
                    obj.Min = float.Parse(oReader["Min"].ToString());
                    obj.Max = float.Parse(oReader["Max"].ToString());
                    if (oReader["Date_Start"].ToString() != "" && oReader["Date_Start"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Date_Start"].ToString());
                        obj.Date_Start = DateTime.Parse(createDate);
                    }
                    if (oReader["Date_End"].ToString() != "" && oReader["Date_End"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Date_End"].ToString());
                        obj.Date_End = DateTime.Parse(createDate);
                    }
                    obj.Code = oReader["Code"].ToString();
                    obj.Name = oReader["Name"].ToString();
                    obj.Promotion_Percent = float.Parse(oReader["Promotion_Percent"].ToString());
                    obj.Amount_VND = float.Parse(oReader["Amount_VND"].ToString());
                    obj.Amount_FreeShip = float.Parse(oReader["Amount_FreeShip"].ToString());
                    obj.Create_User = oReader["Create_User"].ToString();
                    if (oReader["Create_Date"].ToString() != "" && oReader["Create_Date"].ToString() != null)
                    {
                        String createDate = String.Format("{0:dd/MM/yyyy}", oReader["Create_Date"].ToString());
                        obj.Create_Date = DateTime.Parse(createDate);
                    }
                    lstSysPromotion.Add(obj);
                }
            }
            return lstSysPromotion;
        }
    }
}
