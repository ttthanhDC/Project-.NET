using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class DetailMasterGrid
    {
         public bool parent { get; set; }
         public int parentBillId { get; set; }
         public int parentId { get; set; }
         public int ID  { get; set; }
         public string deliveryDate { get; set; }
         public string product { get; set; }
         public int sugar { get; set; }
         public string quantity { get; set; }
         public string price { get; set; }
         public string money { get; set; }
         public string promotionCode { get; set; }
         public string total { get; set; }
         public string test { get; set; }
         public string operate { get; set; }
    }
}
