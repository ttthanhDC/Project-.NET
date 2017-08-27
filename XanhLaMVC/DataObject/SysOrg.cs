using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysOrg
    {
        public string Table = "SYS_ORG";
        public int ID { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
