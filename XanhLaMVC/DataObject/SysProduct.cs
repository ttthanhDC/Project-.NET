using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysProduct
    {
        public string Table = "SYS_PRODUCT";
        public int ID { get; set; }
        public int ORG_ID { get; set; }
        public String Product_Code { get; set; }
        public String Product_Name { get; set; }
        public String Product_Unit { get; set; }
        public float Product_Amount { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
