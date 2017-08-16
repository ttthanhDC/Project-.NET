using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servies
{
    public class PermissionServices
    {
        /**************************  Add User vào Nhóm Quyền  ****************************/
        public static int addUserToGroupReturnId(int roleId,int UserId)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Insert = "INSERT INTO SYS_GROUP_USER_ROLE (ROLE_ID,USER_ID) VALUES (@ROLE_ID,@USER_ID);Select @@IDENTITY as newId";
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@ROLE_ID", roleId);
            cmd.Parameters.AddWithValue("@USER_ID", UserId);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static void removeUserInGroup(int roleId, int UserId)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Delete  from  SYS_GROUP_USER_ROLE Where ROLE_ID = @ROLE_ID AND USER_ID = @USER_ID";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            cmdSelect.Parameters.AddWithValue("@ROLE_ID", roleId);
            cmdSelect.Parameters.AddWithValue("@USER_ID", UserId);
            conn.Open();
            cmdSelect.ExecuteNonQuery();
            conn.Close();
        }
        public static DataTable getUserInGroup(int roleId)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select a.*, b.UserName , c.RoleName from SYS_GROUP_USER_ROLE a ";
            select += "LEFT JOIN SYS_USER b ON b.ID = a.USER_ID " ;
            select += "LEFT JOIN SYS_ROLE c ON c.ID = a.ROLE_ID " ;
            select += " where a.ROLE_ID = @ROLE_ID ";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            cmdSelect.Parameters.AddWithValue("@ROLE_ID", roleId);
            conn.Open();
            dt.Load(cmdSelect.ExecuteReader());
            conn.Close();
            return dt;
        }

        /*************** Phân quyển ***********************/
        public static DataTable getAllFunction()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select * from SYS_GROUP_FUNCTION_ROLE";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            dt.Load(cmdSelect.ExecuteReader());
            conn.Close();
            return dt;
        }

        public static DataTable UpdateFunctionPermision(int IsCreate, int IsEdit, int IsDelete, int IsView,int ID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Update SYS_GROUP_FUNCTION_ROLE SET  IsCreate = @IsCreate, IsEdit = @IsEdit, IsDelete = @IsDelete, IsView = @IsView where ID = @ID";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            cmdSelect.Parameters.AddWithValue("@IsCreate", IsCreate);
            cmdSelect.Parameters.AddWithValue("@IsEdit", IsEdit);
            cmdSelect.Parameters.AddWithValue("@IsDelete", IsDelete);
            cmdSelect.Parameters.AddWithValue("@IsView", IsView);
            cmdSelect.Parameters.AddWithValue("@ID", ID);
            conn.Open();
            cmdSelect.ExecuteNonQuery();
            conn.Close();
            return dt;
        }

        public static int addFuntionToGroupReturnId(int FUNC_ID, int ROLE_ID)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Insert = "INSERT INTO SYS_FUNCTION_ROLE (FUNC_ID,ROLE_ID) VALUES (@FUNC_ID,@ROLE_ID);Select @@IDENTITY as newId";
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@FUNC_ID", FUNC_ID);
            cmd.Parameters.AddWithValue("@ROLE_ID", ROLE_ID);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static void removeFuntionInGroup(int FUNC_ID, int ROLE_ID)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Insert = "Delete FROM SYS_FUNCTION_ROLE WHERE FUNC_ID = @FUNC_ID AND ROLE_ID = @ROLE_ID)";
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@FUNC_ID", FUNC_ID);
            cmd.Parameters.AddWithValue("@ROLE_ID", ROLE_ID);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            conn.Close();
        }

        public static DataTable getFuntionByGroupId(int ROLE_ID)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select * from SYS_FUNCTION_ROLE a ";
            select += " LEFT JOIN SYS_FUNCTION b ON b.ID = a.FUNC_ID ";
            select += " LEFT JOIN SYS_ROLE c ON c.ID = a.ROLE_ID ";
            select += " where a.ROLE_ID = @ROLE_ID";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            cmdSelect.Parameters.AddWithValue("@ROLE_ID", ROLE_ID);
            conn.Open();
            dt.Load(cmdSelect.ExecuteReader());
            conn.Close();
            return dt;
        }

        public static DataTable getPermisionByScreen(String nameScreen,String userName)
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select * from vPhanQuyen where Func_Name = @Func_Name AND UserName = @UserName ";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            cmdSelect.Parameters.AddWithValue("@Func_Name", nameScreen);
            cmdSelect.Parameters.AddWithValue("@UserName", userName);
            conn.Open();
            dt.Load(cmdSelect.ExecuteReader());
            conn.Close();
            return dt;
        }



    }
}
