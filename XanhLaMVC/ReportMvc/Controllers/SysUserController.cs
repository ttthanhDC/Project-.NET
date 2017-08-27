using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysUserController : Controller
    {
        //
        // GET: /SysUser/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public String insert(String type, String data)
        {
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
            try
            {
                obj.Create_Date = DateTime.Now;
                List<DataObject.SysUser> lst = Servies.SysUserServies.GetDataByUserName(obj.UserName);
                if (lst.Count > 0)
                {
                    
                    return "Thêm mới không thành công! Tên người dùng đã tồn tại trong hệ thống";
                }
                List<DataObject.SysUser> lstEmail = Servies.SysUserServies.GetDataEmail(obj.Email);
                if (lstEmail.Count > 0)
                {
                    return "Thêm mới không thành công! Địa chỉ Email đã tồn tại trong hệ thống" ;
                }
                else
                {
                    Insert(obj);
                    return "insert data success";
                }

            }
            catch (Exception e)
            {
                return "Error" ;
            }

        }
        [HttpPost]
        public String update(String type, String data)
        {
            
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
            try
            {
                List<DataObject.SysUser> lstEmail = Servies.SysUserServies.GetDataEmail(obj.Email);
                if (lstEmail.Count > 0)
                {
                    return "Cập nhật thông tin không thành công! Địa chỉ Email đã tồn tại trong hệ thống";
                }
                else
                {
                    Update(obj);
                    return "Cập nhật thông tin người dùng thành công";
                }
            }
            catch (Exception e)
            {
                return "Error";
            }

        }
        [HttpPost]
        public String delete(String type, String data)
        {
            try
            {
                DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
                DeleteData(obj.ID);
                return "Xóa người dùng thành công";
            }
            catch (Exception e)
            {
                e.ToString();
                return "Error";
            }

        }
        [HttpPost]
        public JsonResult getData(String type, String data)
        {
            try
            {
                DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
                List<DataObject.ViewSysUser> lst = Servies.SysUserServies.GetData(obj.ID);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getDataDept(String type, String data)
        {
            try
            {
                List<DataObject.DeptObject> lst = Servies.DeptObjectServices.GetData(0);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getDataOrg(String type, String data)
        {
            try
            {
                List<DataObject.SysOrg> lst = Servies.SysOrgServies.GetData(0);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        public void Insert(DataObject.SysUser obj)
        {
            Servies.SysUserServies.InsertData(obj);
        }
        public void Update(DataObject.SysUser obj)
        {
            Servies.SysUserServies.UpdateData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.SysUserServies.DeleteData(Id);
        }

    }
}
