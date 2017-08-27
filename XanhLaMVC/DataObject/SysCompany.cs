using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysCompany
    {
        public string Table = "SYS_COMPANY";
        public int ID { get; set; }
        public String Company_Name_EN { get; set; }
        public String Company_Name_Short { get; set; }
        public String Company_Name_Vi { get; set; }
        public String Tax_Code { get; set; }
        public String Bank_Account { get; set; }
        public float Amount_Freeship { get; set; }
        public String Logo { get; set; }
        public String Email { get; set; }
        public String Phone_Number { get; set; }
    }
}
