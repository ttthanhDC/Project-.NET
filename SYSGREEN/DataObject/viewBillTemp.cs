using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class viewBillTemp
    {
             public string sourceName { get; set; }
             public int sourceId { get; set; }
             public int songayconlai { get; set; }
             public string tong  { get; set; }
             public string sotienthuduoc { get; set; }
             public string chietkhau { get; set; }
             public string conNo  { get; set; }
             public List<BillGridMaster>  infoBill {get;set;}
             public viewCustomerTemp inFoCustomer { get; set; }
            
    }
}
