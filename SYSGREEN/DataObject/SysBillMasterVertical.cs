using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysBillMasterVertical
    {
        public string Table = "SYS_BILL_MASTER_VERTICAL";
        public int ID { get; set; }
        public int BILL_MASTER_ID { get; set; }
        public DateTime DeliveryDate { get; set; }
    }
}
