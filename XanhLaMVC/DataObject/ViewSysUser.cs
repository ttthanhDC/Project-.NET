using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class ViewSysUser
    {
        public string Table = "vSysUser";
        public int ID { get; set; }
        public String UserName { get; set; }
        public String Password { get; set; }
        public String Email { get; set; }
        public int DeptId { get; set; }
        public String DeptName { get; set; }
        public int OrgId { get; set; }
        public String OrgName { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date { get; set; }
    }
}
