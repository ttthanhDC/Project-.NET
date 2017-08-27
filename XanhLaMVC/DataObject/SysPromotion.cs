using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysPromotion
    {
        public string Table = "SYS_PROMOTION";
        public int ID { get; set; }
        public int ORG_ID { get; set; }
        public float Min { get; set; }
        public float Max { get; set; }
        public DateTime Date_Start { get; set; }
        public DateTime Date_End { get; set; }
        public String Code { get; set; }
        public String Name { get; set; }
        public float Promotion_Percent { get; set; }
        public float Amount_VND { get; set; }
        public float Amount_FreeShip { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }

    }
}
