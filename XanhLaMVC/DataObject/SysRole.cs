using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysRole
    {
        public string Table = "SYS_ROLE";
        public int ID { get; set; }
        public String RoleName { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
