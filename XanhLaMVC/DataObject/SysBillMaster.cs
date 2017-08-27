using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysBillMaster
    {
        public string Table = "SYS_BILL_MASTER";
        public int ID { get; set; }
        public int DateTotal { get; set; }
        public String BillCode { get; set; }
        public int CustomerId { get; set; }
        public int SourceId { get; set; }
        public float TotalAmount { get; set; }
        public float TotalAmountCollected { get; set; }
        public float TotalAmountRemain { get; set; }
        public float Discount { get; set; }
        public String Status { get; set; }
        public String CreateUser { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
