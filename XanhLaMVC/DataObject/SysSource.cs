using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysSource
    {
        public string Table = "SYS_SOURCE";
        public int ID { get; set; }
        public String Source_Name { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
