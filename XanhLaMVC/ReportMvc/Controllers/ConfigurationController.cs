using Newtonsoft.Json;
using System;
using System.Collections;
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

        public ActionResult TheRightForUser()
        {
            return View();
        }
        public ActionResult RDLCReport()
        {
            List<Syncfusion.JavaScript.Models.ReportViewer.ReportDataSource> datasources = new List<Syncfusion.JavaScript.Models.ReportViewer.ReportDataSource>();

            Syncfusion.JavaScript.Models.ReportViewer.ReportDataSource reportDatasource = new Syncfusion.JavaScript.Models.ReportViewer.ReportDataSource();
            reportDatasource.Name = "Sales";
            reportDatasource.Value = SalesDetails.GetData();
            datasources.Add(reportDatasource);
            ViewData["DataSource"] = datasources;

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
        public class HoaDonDetails
        {
            public int quantity { }
        }
        public class SalesDetails
        {
            public string ProdCat { get; set; }
            public string SubCat { get; set; }
            public double? OrderYear { get; set; }
            public string OrderQtr { get; set; }
            public double? Sales { get; set; }
            public static IList GetData()
            {
                List<SalesDetails> datas = new List<SalesDetails>();
                SalesDetails data = null;
                data = new SalesDetails()
                {
                    ProdCat = "Accessories",
                    SubCat = "Helmets",
                    OrderYear = 2002,
                    OrderQtr = "Q1",
                    Sales = 4945.6925
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Road Frames",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 957715.1942
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Forks",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 23543.1060
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Bikes",
                    SubCat = "Road Bikes",
                    OrderYear = 2002,
                    OrderQtr = "Q1",
                    Sales = 3171787.6112
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Accessories",
                    SubCat = "Helmets",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 33853.1033
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Wheels",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 163921.8870
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Bikes",
                    SubCat = "Road Bikes",
                    OrderYear = 2003,
                    OrderQtr = "Q2",
                    Sales = 4119658.6506
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Socks",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 6968.6884
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Bikes",
                    SubCat = "Road Bikes",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 3734891.6389
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Mountain Frames",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 608352.8754
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Handlebars",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 18309.4452
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Road Frames",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 286591.8208
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Accessories",
                    SubCat = "Tires and Tubes",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 41940.3364
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Mountain Frames",
                    OrderYear = 2003,
                    OrderQtr = "Q2",
                    Sales = 440260.9831
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Road Frames",
                    OrderYear = 2003,
                    OrderQtr = "Q2",
                    Sales = 457688.8401
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Vests",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 66882.6450
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Accessories",
                    SubCat = "Pumps",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 3226.3860
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Tights",
                    OrderYear = 2003,
                    OrderQtr = "Q2",
                    Sales = 51600.6190
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Chains",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 3476.0176
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Handlebars",
                    OrderYear = 2003,
                    OrderQtr = "Q2",
                    Sales = 17194.2146
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Mountain Frames",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 565229.8810
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Tights",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 243.7175
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Road Frames",
                    OrderYear = 2002,
                    OrderQtr = "Q2",
                    Sales = 155311.4063
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Mountain Frames",
                    OrderYear = 2002,
                    OrderQtr = "Q2",
                    Sales = 220935.1648
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Accessories",
                    SubCat = "Locks",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 15.0000
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Mountain Frames",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 827287.5234
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Accessories",
                    SubCat = "Bike Racks",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 75920.4000
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Bottom Brackets",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 17453.6400
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Bikes",
                    SubCat = "Touring Bikes",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 3298006.2858
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Brakes",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 18571.4700
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Tights",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 56782.4280
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Pedals",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 54185.2014
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Jerseys",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 173041.0492
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Jerseys",
                    OrderYear = 2002,
                    OrderQtr = "Q2",
                    Sales = 16931.2362
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Headsets",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 19701.9001
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Road Frames",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 458089.4246
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Shorts",
                    OrderYear = 2003,
                    OrderQtr = "Q1",
                    Sales = 11230.1280
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Bikes",
                    SubCat = "Road Bikes",
                    OrderYear = 2002,
                    OrderQtr = "Q4",
                    Sales = 4189621.8590
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Brakes",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 26659.0800
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Wheels",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 83.2981
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Vests",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 81085.6900
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Cranksets",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 80244.1372
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Socks",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 6183.1422
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Components",
                    SubCat = "Wheels",
                    OrderYear = 2003,
                    OrderQtr = "Q2",
                    Sales = 163929.9435
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Tights",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 67088.3037
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Tights",
                    OrderYear = 2003,
                    OrderQtr = "Q3",
                    Sales = 779.8960
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Socks",
                    OrderYear = 2002,
                    OrderQtr = "Q1",
                    Sales = 1273.8550
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Bikes",
                    SubCat = "Road Bikes",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 4930692.7825
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Shorts",
                    OrderYear = 2003,
                    OrderQtr = "Q4",
                    Sales = 84192.3708
                };
                datas.Add(data);
                data = new SalesDetails()
                {
                    ProdCat = "Clothing",
                    SubCat = "Jerseys",
                    OrderYear = 2002,
                    OrderQtr = "Q3",
                    Sales = 48901.7598
                };
                datas.Add(data);
                return datas;
            }
        }

    }
}
