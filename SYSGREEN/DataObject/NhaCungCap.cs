using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class NhaCungCap
    {
        public int ID { set; get; }
        public string MaNCC { set; get; }
        public string TenNCC { set; get; }
        public string SoDT { set; get; }
        public string Tinh { set; get; }
        public string DiaChi { set; get; }
        public string LoaiDichVu { set; get; }
        public string GhiChu { set; get; }
        public DateTime NgayTao { set; get; }
        public string NguoiTao { set; get; }
    }
}
