using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class ConfigurationController : Controller
    {
        //
        // GET: /Configuration/

        public ActionResult C001_Detail()
        {
            return View();
        }

        public ActionResult C001_ListUser()
        {
            return View();
        }

        public ActionResult C002_GroupUser()
        {
            return View();
        }

        public ActionResult C002_Right()
        {
            return View();
        }

        public ActionResult C003_Depasment()
        {
            return View();
        }

        public ActionResult C005_CompanyInformation()
        {
            return View();
        }

        public ActionResult C007_ConfigurationSource()
        {
            return View();
        }

        public ActionResult C008_Detail()
        {
            return View();
        }

        public ActionResult C008_Product()
        {
            return View();
        }

        public ActionResult C009_Detail()
        {
            return View();
        }
        public ActionResult C009_TotalBill()
        {
            return View();
        }
        public ActionResult C010_ConfigMenu()
        {
            return View();
        }

        public ActionResult C010Menu()
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
                    return "Thêm mới không thành công! Địa chỉ Email đã tồn tại trong hệ thống";
                }
                else
                {
                    Insert(obj);
                    return "insert data success";
                }

            }
            catch (Exception e)
            {
                
                return "Error";
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
                return e.ToString();
            }
        }
        [HttpPost]
        public String delete(String type , String data)
        {
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
            try
            {
                try
                {
                    DeleteData(obj.ID);
                    
                    return "Xóa người dùng thành công";
                }
                catch (Exception e)
                {
                    
                    return "Error";
                }
            }
            catch (Exception e)
            {
                return e.ToString();
            }
        }
        [HttpPost]
        public ContentResult getData(String type , String data)
        {
            DataObject.SysUser obj = new JavaScriptSerializer().Deserialize<DataObject.SysUser>(data);
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record
                List<DataObject.ViewSysUser> lst = Servies.SysUserServies.GetData(obj.ID);
                var list = JsonConvert.SerializeObject(lst,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpPost]
        public ContentResult getDataDept(String type, String data)
        {
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record
                List<DataObject.DeptObject> lst = Servies.DeptObjectServices.GetData(0);

                var list = JsonConvert.SerializeObject(lst,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
            catch (Exception e)
            {
                return null;
            }
        }
        [HttpPost]
        public ContentResult getDataOrg(String type, String data)
        {
            try
            {
                // Case ID > 0 -> Result = 1 record
                // Case ID = 0; -> Result = All Record
                List<DataObject.SysOrg> lst = Servies.SysOrgServies.GetData(0);
                var list = JsonConvert.SerializeObject(lst,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
            catch (Exception e)
            {
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
