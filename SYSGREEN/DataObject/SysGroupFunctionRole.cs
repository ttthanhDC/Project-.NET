using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysGroupFunctionRole
    {
        public string Table = "SYS_GROUP_FUNCTION_ROLE";
        public int ID { get; set; }
        public int FUNC_ID { get; set; }
        public int ROLE_ID { get; set; }
        public Boolean IsCreate { get; set; }
        public Boolean IsEdit { get; set; }
        public Boolean IsDelete { get; set; }
        public Boolean IsView { get; set; }
    }
}
