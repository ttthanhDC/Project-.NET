﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class Shiper
    {
        public string Table = "SHIPER";
        public int SHIPER_ID { get; set; }
        public String NUMBER { get; set; }
        public String NAME { get; set; }
        public String DESCRIPTION { get; set; }
        public String DiaChi { get; set; }
        public String SoDienThoai { get; set; }
        public DateTime NgayTao { get; set; }
        public String NguoiTao { get; set; }
       
    }
}
