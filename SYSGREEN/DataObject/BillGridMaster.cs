using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class BillGridMaster
    {
        public bool Master { set; get; }
        public string billType { set; get; }
        public string billTypeId { set; get; }
        public string OrderType { set; get; }
        public string OrderTypeId { set; get; }
        public string OrderType2Id { set; get; }
        public string dateShip { set; get; }
        public string discount { set; get; }
        public string monny { set; get; }
        public string payType { set; get; }
        public string payTypeId { set; get; }
        public int stt { set; get; }
        public int billId { set; get; }
        public List<DetailMasterGrid> detalMaster { set; get; } // Popup
        public viewCustomerPopUp detalCustomer { set; get; }
        
    }
}
