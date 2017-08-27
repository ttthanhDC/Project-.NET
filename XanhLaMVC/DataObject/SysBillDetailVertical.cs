using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysBillDetailVertical
    {
        public string Table = "SYS_BILL_DETAIL_VERTICAL";
        public int ID { get; set; }
        public int VerticalMasterBill_ID { get; set; }
        public String ProductCode { get; set; }
        public int Quantity { get; set; }
        public int ProductId { get; set; }
        public float ProductPrice { get; set; }
        public bool IsSugar { get; set; }
        public float TotalAmount { get; set; }
        public String PromotionCode { get; set; }
        public float Total { get; set; }
        public String Comment { get; set; }
    }
}
