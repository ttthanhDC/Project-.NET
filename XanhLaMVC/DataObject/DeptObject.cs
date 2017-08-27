using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
   
    public class DeptObject
    {
        public string Table = "SYS_DEPT";
        public int ID { get; set; }
        public String Dept_Name { get; set; }
        public String Dept_Description { get; set; }
        public String Create_User { get; set; }
        public DateTime Create_Date{ get; set; }
        
    }
}
