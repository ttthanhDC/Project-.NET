using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Common
{
    public class Connection
    {
        public static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SysXanhLa"].ConnectionString);
        public static SqlConnection SqlConnect(){
            return conn;
        }
        public static void Open()
        {
            conn.Open();
        }
        public static void Close()
        {

            conn.Close();
        }
        public static bool checkConnect()
        {
            if (conn != null)
            {
                return true;
            }
            return false;
        }
    }
}
