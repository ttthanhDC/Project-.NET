﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class SysCustomer
    {
        public string Table = "SYS_CUSTOMER";
        public int ID { get; set; }
        public String CustomerName { get; set; }
        public String PhoneNumber { get; set; }
        public String Email { get; set; }
        public DateTime BirthDay { get; set; }
    }
}
