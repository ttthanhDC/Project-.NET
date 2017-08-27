using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysFunction
    {
        public string Table = "SYS_FUNCTION";
        public int ID { get; set; }
        public String Func_Name { get; set; }
        public String Func_Description { get; set; }

    }
}
