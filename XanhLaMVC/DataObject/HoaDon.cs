using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataObject
{
    public class HoaDon
    {
        public int IDKhachHang { set; get; }
        public int IDNguon { set; get; }
        public Decimal TongTien { set; get; }
        public Decimal TongTienThuDuoc { set; get; }
        public Decimal TongTienConNo { set; get; }
        public Decimal ChietKhau { set; get; }
        public string TrangThai { set; get; }
        public DateTime NgayTao { set; get; }
        public string NguoiTao { set; get; }
        public int TongSoNgay { set; get; }
    }
}
