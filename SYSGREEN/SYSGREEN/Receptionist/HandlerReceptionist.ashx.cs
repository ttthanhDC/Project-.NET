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
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #region BillMaster 
        
        
        #endregion
        
       
    }
}