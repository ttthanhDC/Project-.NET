using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysGroupUserRole
    {
        public string Table = "SYS_GROUP_USER_ROLE";
        public int ID { get; set; }
        public int ROLE_ID { get; set; }
        public int USER_ID { get; set; }
    }
}
