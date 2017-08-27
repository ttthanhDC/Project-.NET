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
            int check = 0;
            String checkStr = "Select count(*) from SYS_GROUP_USER_ROLE where ROLE_ID = @ROLE_ID AND USER_ID = @USER_ID";
            SqlCommand cmdCheck = new SqlCommand(checkStr);
            cmdCheck.CommandType = CommandType.Text;
            cmdCheck.Connection = conn;
            cmdCheck.Parameters.AddWithValue("@ROLE_ID", roleId);
            cmdCheck.Parameters.AddWithValue("@USER_ID", UserId);
            conn.Open();
            object countID = cmdCheck.ExecuteScalar();
            conn.Close();
            check = Convert.ToInt16(countID);
            if (check > 0)
            {
                return -1;
            }
            else
            {
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
            String select = "Select a.*, b.UserName , c.RoleName, b.Email,so.Name as OrgName,sd.Dept_Name as DeptName from SYS_GROUP_USER_ROLE a ";
            select += "LEFT JOIN SYS_USER b ON b.ID = a.USER_ID " ;
            select += "LEFT JOIN SYS_ROLE c ON c.ID = a.ROLE_ID " ;
            select += "LEFT JOIN SYS_ORG so ON so.ID = b.OrgId ";
            select += "LEFT JOIN SYS_DEPT sd ON sd.ID = b.DeptId ";
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
        public static DataTable getAllFunction(String RoleID)
        {
            DataTable dt = new DataTable(); 
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select sgfr.*,sf.ID as Function_ID,sf.Func_Name,sf.Func_Description from SYS_GROUP_FUNCTION_ROLE sgfr ";
            select += "LEFT JOIN  SYS_FUNCTION sf ON sf.ID = sgfr.FUNC_ID ";
            select += " Where sgfr.ROLE_ID = " + RoleID;
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            dt.Load(cmdSelect.ExecuteReader());
            conn.Close();
            if (dt.Rows.Count == 0)
            {
                dt = (DataTable)getDefaultFunction();
            }
            return dt;
        }
        
        public static DataTable getDefaultFunction()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select ID as FUNC_ID, Func_Name as Func_Name,Func_Description as Func_Description  from SYS_FUNCTION";
            SqlCommand cmdSelect = new SqlCommand(select);
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = conn;
            conn.Open();
            dt.Load(cmdSelect.ExecuteReader());
            conn.Close();
            return dt;
        }

        public static DataTable getAllRole()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = Common.Connection.SqlConnect();
            String select = "Select * from SYS_ROLE";
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

        public static int addFuntionToGroupReturnId(int FUNC_ID, int ROLE_ID, int IsCreate,int IsEdit, int IsDelete, int IsView)
        {
            
            SqlConnection conn = Common.Connection.SqlConnect();
            String Insert = "INSERT INTO SYS_GROUP_FUNCTION_ROLE (FUNC_ID,ROLE_ID,IsCreate,IsEdit,IsDelete,IsView)";
            Insert += "VALUES (@FUNC_ID,@ROLE_ID,@IsCreate,@IsEdit,@IsDelete,@IsView);Select @@IDENTITY as newId";
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@FUNC_ID", FUNC_ID);
            cmd.Parameters.AddWithValue("@ROLE_ID", ROLE_ID);
            cmd.Parameters.AddWithValue("@IsCreate", IsCreate);
            cmd.Parameters.AddWithValue("@IsEdit", IsEdit);
            cmd.Parameters.AddWithValue("@IsDelete", IsDelete);
            cmd.Parameters.AddWithValue("@IsView", IsView);
            conn.Open();
            object insertedID = cmd.ExecuteScalar();
            cmd.Connection.Close();
            conn.Close();
            return Convert.ToInt32(insertedID);
        }

        public static void removeFuntionInGroup(int FUNC_ID, int ROLE_ID)
        {
            SqlConnection conn = Common.Connection.SqlConnect();
            String Insert = "Delete FROM SYS_GROUP_FUNCTION_ROLE WHERE  ROLE_ID = @ROLE_ID";
            SqlCommand cmd = new SqlCommand(Insert);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
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
            String select = "Select a.*,b.ID as Function_ID,b.Func_Name,b.Func_Description from SYS_GROUP_FUNCTION_ROLE a ";
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
