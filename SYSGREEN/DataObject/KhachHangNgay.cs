﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class KhachHangNgay
    {
        public string Table = "SYS_CUSTOMER";
        public int ID { get; set; }
        public String CustomerName { get; set; }
        public String PhoneNumber { get; set; }
        public String Email { get; set; }
        public String Address { get; set; }
        public String MaQuan { get; set; }
        public DateTime BirthDay { get; set; }
        public int NgayHoaDonId { get; set; }
    }
}
