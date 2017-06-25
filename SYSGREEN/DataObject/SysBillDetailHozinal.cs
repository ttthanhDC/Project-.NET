using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysBillDetailHozinal
    {
        public string Table = "SYS_BILL_DETAIL_HOZINAL";
        public int ID { get; set; }
        public int HozinalMasterBillId { get; set; }
        public int CustomerId { get; set; }
    }
}
