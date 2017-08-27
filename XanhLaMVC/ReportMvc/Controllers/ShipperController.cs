using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class ShipperController : Controller
    {
        //
        // GET: /Shipper/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult S001_ListShiper()
        {
            return View();
        }
        public ActionResult S002_Route()
        {
            return View();
        }
        public ActionResult S003_InputBill()
        {
            return View();
        }
        public ActionResult S004_ReportedOver()
        {
            return View();
        }
        public ActionResult S005_ReportedRoute()
        {
            return View();
        }
        public ActionResult S006_ListShiper()
        {
            return View();
        }
        public ActionResult S007_ManagerShiper()
        {
            return View();
        }

        [HttpPost]
        public String  InsertLoTrinhShipperReturnId(String type, String data)
        {
            try
            {
                DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                String MaLoTrinh = DateTime.Now.ToString("ddMMyy") + DateTime.Now.ToString("tt") + DateTime.Now.ToString("hh") + DateTime.Now.ToString("mm") + DateTime.Now.ToString("ss");
                obj.MaLoTrinh = MaLoTrinh;
                obj.NguoiTao = "";
                obj.NgayTao = DateTime.Now;
                obj.TrangThai = "Chưa xử lý";
                int idLotrinh = Servies.ShipperServices.InsertLoTrinhShipperReturnId(obj);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public int UpdateLoTrinhShipper(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                dynamic listIdLoTrinh = dataDynamic.listIdLoTrinh;
                dynamic listStatus = dataDynamic.listStatus;
                int check = -1;
                if (listIdLoTrinh.Count > 0)
                {
                    for (int i = 0; i < listIdLoTrinh.Count; i++)
                    {
                        DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                        String ID = (String)listIdLoTrinh[i];
                        obj.ID = Convert.ToInt32(ID);
                        String TrangThai = (String)listStatus[i];
                        obj.TrangThai = TrangThai;
                        check = Servies.ShipperServices.UpdateLoTrinhShipper(obj);
                    }

                    return check;
                }
                else
                {
                    return -1;
                }
            }
            catch (Exception e)
            {
                e.ToString();
                return -1;
            }

        }
        [HttpPost]
        public String DeleteTrinhShipper(String type, String data, String IdLotrinh)
        {
            try
            {
                DataObject.LoTrinhShipper obj = new DataObject.LoTrinhShipper();
                obj.ID = Convert.ToInt32(IdLotrinh);
                Servies.ShipperServices.DeleteTrinhShipper(obj);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public JsonResult ViewLoTrinhShipper(String type, String data, String NgayLotrinh, String MaLoTrinh, String ShipName, String ShipNumber, String TrangThai)
        {
            try
            {
                DataTable lst = Servies.ShipperServices.ViewLoTrinhShipper(NgayLotrinh, MaLoTrinh, ShipName, ShipNumber, TrangThai);
                return Json(lst);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public Int32 InsertShipperReturnId(String type, String data, String DiaChi, String SoDienThoai, String NAME, String DESCRIPTION)
        {
            try
            {
                DataObject.Shiper s = new DataObject.Shiper();
                s.NAME = NAME;
                s.DiaChi = DiaChi;
                s.SoDienThoai = SoDienThoai;
                s.NguoiTao = "";
                s.NgayTao = DateTime.Now;
                s.DESCRIPTION = DESCRIPTION;
                int idShipper = Servies.ShipperServices.InsertShipperReturnId(s);
                return idShipper;
            }
            catch (Exception e)
            {
                e.ToString();
                return 0;
            }

        }
        [HttpPost]
        public String UpdateShipperReturnId(String type, String data, String DiaChi, String SoDienThoai, String NAME,String Shipe_ID, String DESCRIPTION)
        {
            try
            {
                DataObject.Shiper s = new DataObject.Shiper();
                s.NAME = NAME;
                s.DiaChi = DiaChi;
                s.SoDienThoai = SoDienThoai;
                s.DESCRIPTION = DESCRIPTION;
                s.SHIPER_ID = Convert.ToInt16(Shipe_ID);
                Servies.ShipperServices.UpdateShipperReturnId(s);
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public JsonResult getDataShipper(String type, String data, String NAME, String Shipe_ID)
        {
            try
            {
                DataTable table = new DataTable();
                DataObject.Shiper s = new DataObject.Shiper();
                s.NAME = NAME;
                s.SHIPER_ID = Convert.ToInt16(Shipe_ID);
                table = Servies.ShipperServices.getDataShipper(s);
                return Json(table);
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }

    }
}
