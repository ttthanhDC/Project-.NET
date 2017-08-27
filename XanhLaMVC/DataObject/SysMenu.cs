using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysMenu
    {
        public string Table = "SYS_MENU";
        public int ID { get; set; }
        public String ThuTrongTuan { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
