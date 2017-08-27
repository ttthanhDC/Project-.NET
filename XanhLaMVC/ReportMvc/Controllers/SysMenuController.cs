using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace ReportMvc.Controllers
{
    public class SysMenuController : Controller
    {
        //
        // GET: /SysMenu/

        public ActionResult Index()
        {
            return View();
        }

        public int insert(String type, String data, String Code, String ProductId)
        {
            try
            {
                int result = Servies.SysMenuServices.InsertData(Convert.ToInt16(Code), Convert.ToInt16(ProductId));
                return result;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }

        }
        [HttpPost]
        public String update(String type, String data)
        {
            try
            {
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public String delete(String type, String data, String Code, String ProductId)
        {
            try
            {
                Servies.SysMenuServices.DeleteData(Convert.ToInt16(Code), Convert.ToInt16(ProductId));
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public JsonResult getData(String type, String data,String Code)
        {
            try
            {
                DataTable lst = Servies.SysMenuServices.GetProductByIdCode(Convert.ToInt16(Code));
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public JsonResult getALLMenu(String type, String data, String Code)
        {
            try
            {
                DataTable lst = Servies.SysMenuServices.GetAllMenu();
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public String getSessionUser(String type, String data, String Code)
        {
            try
            {
                String UserName = this.Session["UserName"].ToString();
                return UserName;
            }
            catch (Exception e)
            {
                e.ToString();
                return "";
            }

        }

    }
}
