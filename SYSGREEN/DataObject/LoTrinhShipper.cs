using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class LoTrinhShipper
    {
        public string Table = "LoTrinhShipper";
        public int ID { get; set; }
        public String MaLoTrinh { get; set; }
        public DateTime NgayTao { get; set; }
        public String NguoiTao { get; set; }
        public String TrangThai { get; set; }
        public int ShipID { get; set; }
       
    }
}
