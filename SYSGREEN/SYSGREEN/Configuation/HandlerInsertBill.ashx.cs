using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SYSGREEN.Configuation
{
    /// <summary>
    /// Summary description for HandlerInsertBill
    /// </summary>
    public class HandlerInsertBill : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.viewBillTemp obj = new JavaScriptSerializer().Deserialize<DataObject.viewBillTemp>(jsonData);
            if (type == "insert")
            {
                try
                {
                    DataObject.SysBillMaster sysBillMaster = new DataObject.SysBillMaster();
                    DataObject.viewCustomerTemp customerTemp = obj.inFoCustomer;
                    List<DataObject.SysCustomer> lstCustomer = Servies.SysCustomerServices.GetDataByPhoneNumber(customerTemp.soDienThoai);
                    sysBillMaster.CreateDate = DateTime.Now;
                    if (lstCustomer.Count > 0)
                    {
                        DataObject.SysCustomer sysCustomer = lstCustomer[0];
                        sysBillMaster.CustomerId = sysCustomer.ID;
                    }
                    else
                    {
                        DataObject.SysCustomer sysCustomer = new DataObject.SysCustomer();
                        sysCustomer.PhoneNumber = customerTemp.soDienThoai;
                        sysCustomer.CustomerName = customerTemp.hoTen;
                        sysCustomer.Email = customerTemp.email;
                        sysCustomer.Address = customerTemp.diaChi;
                        if (customerTemp.ngaySinh != "")
                        {
                            sysCustomer.BirthDay = DateTime.Parse(customerTemp.ngaySinh);
                        }
                        int customerId = Servies.SysCustomerServices.InsertDataReturnId(sysCustomer);
                        sysBillMaster.CustomerId = customerId;
                    }
                    if (obj.chietkhau != "")
                    {
                        sysBillMaster.Discount = float.Parse(obj.chietkhau);
                    }
                    sysBillMaster.SourceId = obj.sourceId;
                    if (obj.tong != "") {
                        sysBillMaster.TotalAmount = float.Parse(obj.tong);
                    }
                    if (obj.sotienthuduoc != "")
                    {
                        sysBillMaster.TotalAmountCollected = float.Parse(obj.sotienthuduoc);
                    }
                    if (obj.conNo != "")
                    {
                        sysBillMaster.TotalAmountRemain = float.Parse(obj.conNo);
                    }
                    sysBillMaster.DateTotal = obj.songayconlai;
                    sysBillMaster.Status = "Chưa xử lý";
                    List<DataObject.SysBillMaster> lstCount = Servies.SysBillMasterServices.GetData(0);
                    string idHoaDon = "";
                    if (lstCount.Count + 1 < 10)
                    {
                        idHoaDon = "0" + (lstCount.Count + 1).ToString();
                    }
                    else
                    {
                        idHoaDon = (lstCount.Count + 1).ToString();
                    }
                    sysBillMaster.BillCode = "HD" + idHoaDon;
                    sysBillMaster.CreateUser = "admin";
                    int BillMasterId = Servies.SysBillMasterServices.InsertDataReturnId(sysBillMaster);
                    List<DataObject.BillGridMaster> lstMaster = obj.infoBill;
                    //obj.Create_Date = DateTime.Now;
                    //Insert(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(idHoaDon);
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("001");
                }

            }
            else if (type == "update")
            {
                try
                {
                    //Update(obj);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "delete")
            {
                try
                {
                    //DeleteData(obj.ID);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else if (type == "getData")
            {
                try
                {
                    // Case ID > 0 -> Result = 1 record
                    // Case ID = 0; -> Result = All Record
                    List<DataObject.SysBillMaster> lst = Servies.SysBillMasterServices.GetData(0);

                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(lst));
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Hello");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void Insert(DataObject.DeptObject obj)
        {
            Servies.DeptObjectServices.InsertData(obj);
        }
        public void Update(DataObject.DeptObject obj)
        {
            Servies.DeptObjectServices.InsertData(obj);
        }
        public static void DeleteData(Int32 Id)
        {
            Servies.DeptObjectServices.DeleteData(Id);
        }

        public List<DataObject.DeptObject> GetData(Int32 Id)
        {
            List<DataObject.DeptObject> lst = Servies.DeptObjectServices.GetData(Id);
            return lst;
        }
    }
}