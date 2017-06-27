using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SYSGREEN.Receptionist
{
    /// <summary>
    /// Summary description for HandlerReceptionist
    /// </summary>
    public class HandlerReceptionist : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String type = context.Request.Form["type"].ToString();
            String jsonData = context.Request.Form["data"].ToString();
            DataObject.DeptObject obj = new JavaScriptSerializer().Deserialize<DataObject.DeptObject>(jsonData);
            if (type == "insert")
            {
                try
                {
                    String jsonCustomer = context.Request.Form["customer"].ToString();
                    DataObject.SysCustomer objSysCustomer = new JavaScriptSerializer().Deserialize<DataObject.SysCustomer>(jsonCustomer);
                    List<DataObject.SysCustomer> lstCustomer = Servies.SysCustomerServices.GetDataByPhoneNumber(objSysCustomer.PhoneNumber);
                    int customerId = -1;
                    if (lstCustomer.Count > 0)
                    {
                        customerId = lstCustomer[0].ID;
                    }
                    else
                    {
                       // customerId = InsertCustomerDataReturnId(obj);
                    }
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("insert data success");
                }
                catch (Exception e)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error");
                }

            }
            else if (type == "update")
            {
                try
                {
                    Update(obj);
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
                    DeleteData(obj.ID);
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
                    List<DataObject.DeptObject> lst = GetData(obj.ID);

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
        #region BillMaster 
        public void InsertBillMaster(DataObject.SysBillMaster obj)
        {
            Servies.SysBillMasterServices.InsertData(obj);
        }
        public int InsertBillMasterDataReturnId(DataObject.SysBillMaster obj)
        {
            int customerId = Servies.SysBillMasterServices.InsertDataReturnId(obj);
            return customerId;
        }
        public void UpdateBillMaster(DataObject.SysBillMaster obj)
        {
            Servies.SysBillMasterServices.UpdateData(obj);
        }
        public static void DeleteDataBillMaster(Int32 Id)
        {
            Servies.SysBillMasterServices.DeleteData(Id);
        }

        public List<DataObject.SysBillMaster> GetDataCustomer(Int32 Id)
        {
            List<DataObject.SysBillMaster> lst = Servies.SysBillMasterServices.GetData(Id);
            return lst;
        }
        #endregion
        #region SysCustomer
        public void InsertCustomer(DataObject.SysCustomer obj)
        {
            Servies.SysCustomerServices.InsertData(obj);
        }
        public int InsertCustomerDataReturnId(DataObject.SysCustomer obj)
        {
            int customerId = Servies.SysCustomerServices.InsertDataReturnId(obj);
            return customerId;
        }
        public void UpdateCustomer(DataObject.SysCustomer obj)
        {
            Servies.SysCustomerServices.InsertData(obj);
        }
        public static void DeleteDataCustomer(Int32 Id)
        {
            Servies.SysCustomerServices.DeleteData(Id);
        }

        public List<DataObject.SysCustomer> GetDataCustomer1(Int32 Id)
        {
            List<DataObject.SysCustomer> lst = Servies.SysCustomerServices.GetData(Id);
            return lst;
        }
        #endregion
        #region SysMasterBillVertical
        public void InsertMasterBillVertical(DataObject.SysBillMasterVertical obj)
        {
            Servies.SysBillMasterVerticalServices.InsertData(obj);
        }
        public int InsertMasterBillVerticalReturnId(DataObject.SysBillMasterVertical obj)
        {
            int customerId = Servies.SysBillMasterVerticalServices.InsertDataReturnId(obj);
            return customerId;
        }
        public void UpdateMasterBillVertical(DataObject.SysBillMasterVertical obj)
        {
            Servies.SysBillMasterVerticalServices.UpdateData(obj);
        }
        public static void DeleteMasterBillVertical(Int32 Id)
        {
            Servies.SysBillMasterVerticalServices.DeleteData(Id);
        }

        public List<DataObject.SysBillMasterVertical> GetDataMasterBillVertical(Int32 Id)
        {
            List<DataObject.SysBillMasterVertical> lst = Servies.SysBillMasterVerticalServices.GetData(Id);
            return lst;
        }
        #endregion
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