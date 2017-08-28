using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReportMvc.Controllers
{
    public class TestController : Controller
    {
        //
        // GET: /Test/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ContentResult getALLData(String type, String data)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getAllDataViewHoaDon();
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
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public ContentResult getDataFilter(String type, String data, String MaReservation, String ngayHoaDon, String quan, String soShiper, String tenShiper, String trangThai)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getDataFilterViewHoaDon(MaReservation, ngayHoaDon, quan,
                         soShiper, tenShiper, trangThai);
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
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public ContentResult getAllShiper(String type, String data)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getAllShiper();
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
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public ContentResult assignHoaDonToShiper(String type, String data, String IdLotrinh)
        {
            try
            {
                String NguoiTao = this.Session["UserName"].ToString();

                String shiper = "";
                String user = "";
                int? shiperId = null;
                int? userId = null;
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                dynamic listNgayHoaDonJson = dataDynamic.listNgayHoaDon;

                shiper = dataDynamic.shiper;
                user = dataDynamic.user;

                if (shiper != null && shiper != "")
                {
                    shiperId = Int32.Parse(shiper);
                }

                if (user != null && user != "")
                {
                    userId = Int32.Parse(user);
                }


                String lstHD = "";
                Servies.HoaDonServices.ResetNgayHoaDonToShiper(-1, -1, -1, Convert.ToInt32(IdLotrinh), NguoiTao);
                if (listNgayHoaDonJson != null && listNgayHoaDonJson.Count > 0)
                {
                    for (int i = 0; i < listNgayHoaDonJson.Count; i++)
                    {
                        lstHD += (String)listNgayHoaDonJson[i] + ",";
                        Servies.HoaDonServices.updateNgayHoaDonToShiper(Convert.ToInt32(listNgayHoaDonJson[i]), Convert.ToInt32(shiperId), Convert.ToInt32(userId), Convert.ToInt32(IdLotrinh), NguoiTao);
                    }
                }
                DataTable dt = null;
                if (lstHD != "")
                {
                    lstHD = lstHD.Substring(0, lstHD.Length - 1);
                    dt = Servies.HoaDonServices.getAllDataViewHoaDonByListId(lstHD);
                }


                var list = JsonConvert.SerializeObject(dt,
                    Formatting.None,
                    new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                    });

                return Content(list, "application/json");
            }
            catch (Exception e)
            {
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public String saveS003InputBill(String type, String data)
        {
            try
            {
                dynamic dataDynamic = Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                /*
                obj.status = 1;// chua có
                obj.statusTT = 2;// chua có
                obj.note = "jshdfksdhfksdfsafsdf";// chua có
                obj.moneyPay = objectData.shipNo || "";
                 Int32 idNHD, Int32 ID_PTCHD, String status, String HinhThucThanhToan, String tienthu, String ghiChu
                 */
                for (int i = 0; i < dataDynamic.Count; i++)
                {
                    String idNHD = (String)dataDynamic[i].id;
                    if (idNHD == "")
                    {
                        idNHD = "0";
                    }
                    String ID_PTCHD = (String)dataDynamic[i].ID_PTCHD;
                    if (ID_PTCHD == "")
                    {
                        ID_PTCHD = "0";
                    }
                    String HinhThucThanhToan = (String)dataDynamic[i].httt;
                    String tienthu = (String)dataDynamic[i].moneyPay;
                    if (tienthu == "")
                    {
                        tienthu = "0";
                    }
                    String ghiChu = (String)dataDynamic[i].note;
                    String status = (String)dataDynamic[i].status;

                    Servies.HoaDonServices.saveS003InputBill(idNHD, ID_PTCHD, status, HinhThucThanhToan, tienthu, ghiChu);
                }
                return "1";
            }
            catch (Exception e)
            {
                e.ToString();
                return "0";
            }

        }
        [HttpPost]
        public ContentResult getALLDataByIdLoTrinh(String type, String data, String IdLotrinh)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getAllDataViewHoaDonByIdLoTrinh(IdLotrinh);
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
                e.ToString();
                return null;
            }

        }
        [HttpPost]
        public ContentResult getALLDataByMaLoTrinh(String type, String data, String MaLotrinh)
        {
            try
            {
                DataTable lst = Servies.HoaDonServices.getAllDataViewHoaDonByMaLoTrinh(MaLotrinh);
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
                e.ToString();
                return null;
            }

        }
        
        
    }
}
