using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysUser
    {
        public string Table = "SYS_USER";
        public int ID { get; set; }
        public String UserName { get; set; }
        public String Password { get; set; }
        public String Email { get; set; }
        public int DeptId { get; set; }
        public int OrgId { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
